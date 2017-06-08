function shiftWeek(event){
  var viewDate = event.target.id;
  var url = event.target.href;

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
    $('#week-backward').id = data.backward;
    $('#week-forward').id = data.forward;
  })
};


$(document).ready(function(){
    $('.shift-week').bind('click', shiftWeek)
});
