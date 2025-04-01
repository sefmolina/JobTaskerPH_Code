<?php

namespace App\Http\Controllers\FrontEnd\PaymentGateway;

use App\Http\Controllers\Controller;
use App\Http\Controllers\FrontEnd\ClientService\OrderProcessController;
use App\Http\Controllers\FrontEnd\PayController;
use App\Models\ClientService\Service;
use App\Models\PaymentGateway\OnlineGateway;
use App\Models\Seller;
use Illuminate\Http\Request;
use Omnipay\Omnipay;

class AuthorizeNetController extends Controller
{
  private $gateway;

  public function __construct()
  {
    $data = OnlineGateway::query()->whereKeyword('authorize.net')->first();
    $authorizeNetData = json_decode($data->information, true);

    $this->gateway = Omnipay::create('AuthorizeNetApi_Api');

    $this->gateway->setAuthName($authorizeNetData['api_login_id']);
    $this->gateway->setTransactionKey($authorizeNetData['transaction_key']);

    if ($authorizeNetData['sandbox_status'] == 1) {
      $this->gateway->setTestMode(true);
    }
  }

  public function index(Request $request, $data, $paymentFor)
  {
    $allowedCurrencies = array('USD', 'CAD', 'CHF', 'DKK', 'EUR', 'GBP', 'NOK', 'PLN', 'SEK', 'AUD', 'NZD');

    $currencyInfo = $this->getCurrencyInfo();

    // checking whether the base currency is allowed or not
    if (!in_array($currencyInfo->base_currency_text, $allowedCurrencies)) {
      return redirect()->back()->with('error', 'Invalid currency for authorize.net payment.')->withInput();
    }

    if ($paymentFor != 'invoice') {
      $data['currencyText'] = $currencyInfo->base_currency_text;
      $data['currencyTextPosition'] = $currencyInfo->base_currency_text_position;
      $data['currencySymbol'] = $currencyInfo->base_currency_symbol;
      $data['currencySymbolPosition'] = $currencyInfo->base_currency_symbol_position;
      $data['paymentMethod'] = 'Authorize.Net';
      $data['gatewayType'] = 'online';
      $data['paymentStatus'] = 'completed';
      $data['orderStatus'] = 'pending';
    }

    if ($paymentFor == 'service') {
      $serviceSlug = $data['slug'];
    }

    if ($request->filled('opaqueDataValue') && $request->filled('opaqueDataDescriptor')) {
      // generate a unique merchant site transaction ID
      $transactionId = rand(100000000, 999999999);

      $response = $this->gateway->authorize([
        'amount' => sprintf('%0.2f', $data['grandTotal']),
        'currency' => $currencyInfo->base_currency_text,
        'transactionId' => $transactionId,
        'opaqueDataDescriptor' => $request->opaqueDataDescriptor,
        'opaqueDataValue' => $request->opaqueDataValue
      ])->send();

      if ($response->isSuccessful()) {
        if ($paymentFor == 'service') {
          $orderProcess = new OrderProcessController();

          // store service order information in database
          $selected_service = Service::where('id', $data['serviceId'])->select('seller_id')->first();
          if ($selected_service->seller_id != 0) {
            $data['seller_id'] = $selected_service->seller_id;
            $seller = Seller::where('id', $selected_service->seller_id)->first();
            if ($seller) {
              $pre_balance = $seller->amount;
              $after_balance = $seller->amount + ($data['grandTotal'] - $data['tax']);
              $seller->amount = $after_balance;
              $seller->save();
            } else {
              $pre_balance = null;
              $after_balance = null;
            }
          } else {
            $data['seller_id'] = null;
            $pre_balance = null;
            $after_balance = null;
          }
          $orderInfo = $orderProcess->storeData($data);

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
          $invoice = $data['invoice'];

          $invoice->update([
            'payment_status' => 'paid',
            'payment_method' => 'Authorize.Net',
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
        if ($paymentFor == 'service') {
          return redirect()->route('service.place_order.cancel', ['slug' => $serviceSlug]);
        } else {
          return redirect()->route('pay.cancel');
        }
      }
    } else {
      if ($paymentFor == 'service') {
        return redirect()->route('service.place_order.cancel', ['slug' => $serviceSlug]);
      } else {
        return redirect()->route('pay.cancel');
      }
    }
  }
}
