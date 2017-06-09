// application.js

//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// 
// $(document).ready(function() {
//
//     var button = $('.adminchange')
//
//     button.on("click", function(event) {
//       event.preventDefault();
//
//       var url = $(event.target).attr('href');
//       var token = $('input[name=authenticity_token]').val();
//
//       button.attr('disabled', 'disabled');
//
//     $.ajax({
//       url: url,
//       type: 'PUT',
//       contentType: 'application/json',
//       data: JSON.stringify({
//         authenticity_token: token,
//       }),
//       dataType: 'json',
//     })
//
//     .done(function(data) {
//       $('event.target').attr("admin", data.admin);
//       button.attr('disabled', false);
//     })
//   });
// })
