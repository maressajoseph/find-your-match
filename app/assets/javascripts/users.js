$(document).ready(function() {

    var button = $('.adminchange')

    button.on("click", function(event) {
      event.preventDefault();

      var htmlTarget = $(event.target);
      var url = $(event.target).attr('href');
      var token = $('input[name=authenticity_token]').val();


    $.ajax({
      url: url,
      type: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({
        authenticity_token: token,
      }),
      dataType: 'json',
    })

    .done(function(data) {
      console.log(data)
      $(htmlTarget).attr("admin", data.admin);
      if (data === true) {
        $(htmlTarget).removeClass("glyphicon-minus");
        $(htmlTarget).addClass("glyphicon-ok");
      }
      else {
          $(htmlTarget).removeClass("glyphicon-ok");
          $(htmlTarget).addClass("glyphicon-minus");
      }
    })
  });
})
