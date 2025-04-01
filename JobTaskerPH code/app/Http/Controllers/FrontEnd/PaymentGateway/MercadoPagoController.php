<?php

namespace App\Http\Controllers\FrontEnd\PaymentGateway;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontEnd\ClientService\OrderProcessController;
use App\Http\Controllers\FrontEnd\PayController;
use App\Models\ClientService\Service;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\Seller;
use Illuminate\Http\Request;

class MercadoPagoController extends Controller
{
  private $token, $sandbox_status;

  public function __construct()
  {
    $data = OnlineGateway::query()->whereKeyword('mercadopago')->first();
    $mercadopagoData = json_decode($data->information, true);

    $this->token = $mercadopagoData['token'];
    $this->sandbox_status = $mercadopagoData['sandbox_status'];
  }

  public function index(Request $request, $data, $paymentFor)
  {
    $allowedCurrencies = array('ARS', 'BOB', 'BRL', 'CLF', 'CLP', 'COP', 'CRC', 'CUC', 'CUP', 'DOP', 'EUR', 'GTQ', 'HNL', 'MXN', 'NIO', 'PAB', 'PEN', 'PYG', 'USD', 'UYU', 'VEF', 'VES');

    $currencyInfo = $this->getCurrencyInfo();

    // checking whether the base currency is allowed or not
    if (!in_array($currencyInfo->base_currency_text, $allowedCurrencies)) {
      return redirect()->back()->with('error', 'Invalid currency for mercadopago payment.');
    }

    if ($paymentFor != 'invoice') {
      $data['currencyText'] = $currencyInfo->base_currency_text;
      $data['currencyTextPosition'] = $currencyInfo->base_currency_text_position;
      $data['currencySymbol'] = $currencyInfo->base_currency_symbol;
      $data['currencySymbolPosition'] = $currencyInfo->base_currency_symbol_position;
      $data['paymentMethod'] = 'MercadoPago';
      $data['gatewayType'] = 'online';
      $data['paymentStatus'] = 'completed';
      $data['orderStatus'] = 'pending';
    }

    if ($paymentFor == 'service') {
      $title = 'Order A Service';
      $serviceSlug = $data['slug'];
      $notifyURL = route('service.place_order.mercadopago.notify', ['slug' => $serviceSlug]);
      $completeURL = route('service.place_order.complete', ['slug' => $serviceSlug, 'via' => 'online']);
      $cancelURL = route('service.place_order.cancel', ['slug' => $serviceSlug]);

      $customerEmail = $request['email_address'];
    } else {
      $title = 'Purchase Items';
      $notifyURL = route('pay.mercadopago.notify');
      $completeURL = route('pay.complete');
      $cancelURL = route('pay.cancel');

      $invoice = $data['invoice'];

      $customerEmail = $invoice->user_email_address;
    }

    $curl = curl_init();

    $preferenceData = [
      'items' => [
        [
          'id' => uniqid(),
          'title' => $title,
          'description' => $title . ' via MercadoPago',
          'quantity' => 1,
          'currency' => $currencyInfo->base_currency_text,
          'unit_price' => $data['grandTotal']
        ]
      ],
      'payer' => [
        'email' => $customerEmail
      ],
      'back_urls' => [
        'success' => $notifyURL,
        'pending' => '',
        'failure' => $cancelURL
      ],
      'notification_url' => $notifyURL,
      'auto_return' => 'approved'
    ];

    $httpHeader = ['Content-Type: application/json'];

    $url = 'https://api.mercadopago.com/checkout/preferences?access_token=' . $this->token;

    $curlOPT = [
      CURLOPT_URL             => $url,
      CURLOPT_CUSTOMREQUEST   => 'POST',
      CURLOPT_POSTFIELDS      => json_encode($preferenceData, true),
      CURLOPT_HTTP_VERSION    => CURL_HTTP_VERSION_1_1,
      CURLOPT_RETURNTRANSFER  => true,
      CURLOPT_TIMEOUT         => 30,
      CURLOPT_HTTPHEADER      => $httpHeader
    ];

    curl_setopt_array($curl, $curlOPT);

    $response = curl_exec($curl);
    $responseInfo = json_decode($response, true);

    curl_close($curl);

    // put some data in session before redirect to mercadopago url
    $request->session()->put('arrData', $data);
    $request->session()->put('paymentFor', $paymentFor);

    if ($this->sandbox_status == 1) {
      return redirect($responseInfo['sandbox_init_point']);
    } else {
      return redirect($responseInfo['init_point']);
    }
  }

  public function notify(Request $request)
  {
    // get the information from session
    $paymentFor = $request->session()->get('paymentFor');
    $arrData = $request->session()->get('arrData');

    if ($paymentFor == 'service') {
      $serviceSlug = $arrData['slug'];
    } else if ($paymentFor == 'product') {
      $productList = $request->session()->get('productCart');
    }

    $paymentURL = 'https://api.mercadopago.com/v1/payments/' . $request['data']['id'] . '?access_token=' . $this->token;

    $paymentData = $this->curlCalls($paymentURL);
    $paymentInfo = json_decode($paymentData, true);

    if ($paymentInfo['status'] == 'approved') {
      // remove this session datas
      $request->session()->forget('paymentFor');
      $request->session()->forget('arrData');

      if ($paymentFor == 'service') {
        $orderProcess = new OrderProcessController();

        // store service order information in database
        $selected_service = Service::where('id', $arrData['serviceId'])->select('seller_id')->first();
        if ($selected_service->seller_id != 0) {
          $arrData['seller_id'] = $selected_service->seller_id;
          $seller = Seller::where('id', $selected_service->seller_id)->first();
          if ($seller) {
            $pre_balance = $seller->amount;
            $after_balance = $seller->amount + ($arrData['grandTotal'] - $arrData['tax']);
            $seller->amount = $after_balance;
            $seller->save();
          } else {
            $pre_balance = null;
            $after_balance = null;
          }
        } else {
          $arrData['seller_id'] = null;
          $pre_balance = null;
          $after_balance = null;
        }
        $orderInfo = $orderProcess->storeData($arrData);

        //add balance to seller account and transcation
        $transaction_data = [];
        $transaction_data['order_id'] = $orderInfo->id;
        $transaction_data['transcation_type'] = 1;
        $transaction_data['user_id'] = $orderInfo->user_id;
        $transaction_data['seller_id'] = $orderInfo->seller_id;
        $transaction_data['payment_status'] = $orderInfo->payment_status;
        $transaction_data['payment_method'] = $orderInfo->payment_method;
        $transaction_data['grand_total'] = $orderInfo->grand_total;
        $transaction_data['tax'] = $orderInfo->tax;
        $transaction_data['pre_balance'] = $pre_balance;
        $transaction_data['after_balance'] = $after_balance;
        $transaction_data['gateway_type'] = $orderInfo->gateway_type;
        $transaction_data['currency_symbol'] = $orderInfo->currency_symbol;
        $transaction_data['currency_symbol_position'] = $orderInfo->currency_symbol_position;
        storeTransaction($transaction_data);
        $data = [
          'life_time_earning' => $orderInfo->grand_total,
          'total_profit' => is_null($orderInfo->seller_id) ? $orderInfo->grand_total : $orderInfo->tax,
        ];
        storeEarnings($data);
        //add balance to seller account and transcation end

        // generate an invoice in pdf format
        $invoice = $orderProcess->generateInvoice($orderInfo);

        // then, update the invoice field info in database
        $orderInfo->update(['invoice' => $invoice]);

        // send a mail to the customer with the invoice
        $orderProcess->prepareMail($orderInfo);

        return redirect()->route('service.place_order.complete', ['slug' => $serviceSlug, 'via' => 'online']);
      } else {
        // update info in db
        $invoice = $arrData['invoice'];

        $invoice->update([
          'payment_status' => 'paid',
          'payment_method' => 'MercadoPago',
          'gateway_type' => 'online'
        ]);

        $pay = new PayController();

        // generate an invoice in pdf format
        $pay->generateInvoice($invoice);

        // send a mail to the customer with the invoice
        $pay->prepareMail($invoice);

        return redirect()->route('pay.complete', ['via' => 'online']);
      }
    } else {
      $request->session()->forget('paymentFor');
      $request->session()->forget('arrData');

      if ($paymentFor == 'service') {
        return redirect()->route('service.place_order.cancel', ['slug' => $serviceSlug]);
      } else {
        return redirect()->route('pay.cancel');
      }
    }
  }

  public function curlCalls($url)
  {
    $curl = curl_init();

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $curlData = curl_exec($curl);

    curl_close($curl);

    return $curlData;
  }
}
