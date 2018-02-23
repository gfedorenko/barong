$(document).ready(function () {
  let submitBtn = $('input[name=commit]')
  submitBtn.addClass('disabled')

  $('#submit-email').on('click', function (e) {
    e.preventDefault()
    $('#email-form').hide()
    $('#passwords-form').fadeIn('fast')
    email = $('#account_email').val()
    $.ajax({
      method: 'GET',
      data:   {email: email},
      url:    'display-code',
      success: function(result){
        if (result.answer == false){
          $('#otp').removeAttr('required')
          $('#otp-code').hide()
          $('#otp-code').novalidate = true
          submitBtn.removeClass('disabled')
        }
      }
    })
  })

  $('#back').on('click', function (e) {
    e.preventDefault()
    $('#passwords-form').hide()
    $('#email-form').fadeIn('fast')
  })

  $('#otp').on('input', function (e) {
    if (e.target.value.length !== 6) {
      submitBtn.addClass('disabled')
    } else {
      submitBtn.removeClass('disabled')
    }
  })
})

