"use strict";
$('body').on('submit', '#sellerContactForm', function (e) {
  e.preventDefault();

  let sellerContactForm = document.getElementById('sellerContactForm');
  $('.request-loader').addClass('show');
  var url = $(this).attr('action');
  var method = $(this).attr('method');

  let fd = new FormData(sellerContactForm);
  $.ajax({
    url: url,
    method: method,
    data: fd,
    contentType: false,
    processData: false,
    success: function (data) {
      $('.request-loader').removeClass('show');
      $('.em').each(function () {
        $(this).html('');
      });

      if (data == 'success') {
        location.reload();
      }
    },
    error: function (error) {
      if ($('.g-recaptcha').length > 0) {
        grecaptcha.reset();
      }
      $('.em').each(function () {
        $(this).html('');
      });

      for (let x in error.responseJSON.errors) {
        document.getElementById('err_' + x).innerHTML = error.responseJSON.errors[x][0];
      }

      $('.request-loader').removeClass('show');
    }
  })
});
