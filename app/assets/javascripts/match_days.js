function shiftWeek(event){
  event.preventDefault()

  var viewDate = event.target.id;
  var url = event.target.href;


  $.ajax({
    url: url,
    type: 'GET',
    dataType: 'json',
    contentType: 'application/json',
    data: {
      view_date: viewDate
    }
  })
  .done(function(data){
    $('.week-backward').attr('id', data.backward);
    $('.week-forward').attr('id', data.forward);
    $('.matchdaycard').remove();
    debugger
    //
    // var daycarddiv = $('<div></div>').attr('class', 'col-xs-1 box text-center matchdaycard')
    // var dayofweek = $('<p></p>').attr('class', 'day-of-the-week').html(data.match_days[i].day)
    // var date = $(<p></p>).html(data.match_days[i].day)
    // console.log(data.match_days.length)
    //
    //       <% if match_day.matches.length == 0 %>
    //         <%= link_to "Add a new match", match_days_path(day: match_day.day, group: @group), class:"text-center", method: :post %>
    //       <% else %>
    //         <% match_day.matches.each do |match| %>
    //           <p><%=  "#{match.student1.first_name} - #{match.student2.first_name}"%></p>
    //         <% end %>
    //     <% end %>
    //   </div>
  })
};


$(document).ready(function(){
    $('.shift-week').bind('click', shiftWeek)
});
