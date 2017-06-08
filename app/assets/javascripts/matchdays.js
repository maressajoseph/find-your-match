function shiftWeek(event){


  var viewDate = event.target.id;
  var url = event.target.url;


  $.ajax({
    url: url,
    type: 'GET',
    dataType: 'json',
    contentType: 'application/json',
    data: JSON.stringify({
      view_date: viewDate
    })
  })
  .done(function(data){
      $('#show-week-container').html(" ")
  })
};


$(document).ready(function(){
    $('.shift-week').bind('click', shiftWeek)
});
