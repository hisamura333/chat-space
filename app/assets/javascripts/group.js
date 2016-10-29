// ユーザー追加機能
$(function(){
  $("#user-search-result").on('click','.user-search-add',function(e){
    e.preventDefault();
    var userName = $(this).attr("user_name");
    var userId = $(this).attr("user_id");

    $('#group-user').append("<div class= 'chat-group-user clearfix'><input type='hidden' name='group[user_ids][]' value="+userId+ "><p class='chat-group-user__name'>"+userName+"</p><a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove',id ='group_remove"+userId+"',user_id: "+userId+">削除</a></div>");
  });

// ユーザー削除機能
  $("#group-user").on('click','.chat-group-user',function(e){
    e.preventDefault();
    $(this).remove();
  });
});
//インクリメンタルサーチの機能
$(function(){
  var list = $("#user-search-result");
  var preWord;

  function appendList(user) {
    var item = $("<div class= 'chat-group-user clearfix'>").append("<p class='chat-group-user__name'>"+user.name+"</p><a class='user-search-add chat-group-user__btn chat-group-user__btn--add,user_id='"+user.id+"', user_name='"+user.name+"'>追加</a>");
      list.append(item);
  }
  $('#user-search-field').on("keyup", function(){
    var input = $(this).val();
    console.log (this)
    if(input !== preWord) {
      $.ajax({
        url: '/users.json',
        type: 'GET',
        datatype:'json',
        data: {
          name: input
        }
      })
      .done(function(data) {
        $.each(data, function(i, user){
          appendList(user);
        })
      })
      .fail(function(){
      });
    }
  preWord = input;
  });

});


