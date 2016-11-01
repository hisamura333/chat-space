$(document).on('turbolinks:load', function(){
$(function(){
  $("#submit").click(function(e){
    var form = $("#message-form").get()[0];
    var formData = new FormData(form);
    e.preventDefault();
    $.ajax({
      url: 'messages.json',
      type: 'POST',
      datatype: 'json',
      contentType: "application/json",
      data: formData,
      processData: false,
      contentType: false
    }).done(function(data){
    $('#ajax').append("<div class= 'main__body clearfix'><div class='main__body--name'>"+data.name+"</div><div class='main__body--time'>"+data.date+"</div></div><div class='main__body--group'>"+data.body+"<img src="+data.image+"/></div>");
    })
  });
});
});
