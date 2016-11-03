//メッセージを自動更新
function message_update(data){
  for(var i = 0; i < data.messages.length; i++){
    var appended_html = "<div class = 'main__body'>\
    <div class = 'main__body--name'>"+data.name+"</div>\
    <div class = 'main__body--time'>"+data.messages[i].created_at+"</div></div>\
    <div class = 'main__body--group'>"+data.messages[i].body+"</div>"

    if (data.messages[i].image.url != null) {
      $(".main__body").append(appended_html,"<img src="+data.messages[i].image.url+">");
    }else{
      $(".main__body").append(appended_html);
    };
  };
};

//ajax
$(function(){
  setInterval(function(){
    $.ajax({
      url: 'messages.json',
      type: 'GET',
      dataType: 'json'
    })
    .done(function(data){
      $(".main__body").empty();
      message_update(data);
    })
    .fail(function(){
    });
  },5000);
});
