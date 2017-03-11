// //メッセージを自動更新
// function message_update(data){
//   for(var i = 0; i < data.messages.length; i++){
//     var appended_html = "<div class = 'main__body--box clearfix'><div class = 'main__body--box--name'>"+data.name+"</div>\
//     <div class = 'main__body--box--time'>"+data.messages[i].created_at+"</div></div>\
//     <div class = 'main__body--box--group'>"+data.messages[i].body+"</div>"
//
//     if (data.messages[i].image.url != null) {
//       $("#ajax.main__body").append(appended_html,"<img src="+data.messages[i].image.url+">");
//     }else{
//       $("#ajax.main__body").append(appended_html);
//     };
//   };
// };
//
// //ajax
// $(function(){
//   setInterval(function(){
//     $.ajax({
//       url: 'messages.json',
//       type: 'GET',
//       dataType: 'json'
//     })
//     .done(function(data){
//       $("#ajax").empty();
//       message_update(data);
//     })
//     .fail(function(){
//     });
//   },2000);
// });
