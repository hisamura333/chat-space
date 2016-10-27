$(document).on('turbolinks:load', function(){
$(function(){
  $("#submit").click(function(e){
    console.log("クリックされた");
    var sample = $("#message-body").val()
    console.log(sample);
    var data = {
        body: sample
      };
    e.preventDefault();
    $.ajax({
      url: 'messages.json',
      type: 'POST',
      datatype: 'json',
      contentType: "application/json",
      data: JSON.stringify(data)
    }).done(function(data){
    console.log("レスポンスされました");
    $('#ajax').append("<div class= 'main__body clearfix'><div class='main__body--name'>"+data.name+"</div><div class='main__body--time'>"+data.date+"</div></div><div class='main__body--group'>"+data.body+"</div>");
    })

  });
});
});
