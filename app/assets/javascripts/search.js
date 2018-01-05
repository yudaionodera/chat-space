$(function() {
  var search_list = $(".js-user-seaerch-result");
  var search_result = $(".chat-group-user.clearfix.js-chat-member");
  var chat_members = $(".chat-group-users.js-add-user");
  var UserIds = [];
  var UserNames = [];
  var savedUserId = [];

  function appendUser(user){
    var html =`<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" data-id="${user.id}" data-name="${user.name}">追加</a>
              </div>`
    search_list.append(html);
  }
  function appendUserToMember(userId,userName){
    var html2 = `<div class="chat-group-user clearfix js-chat-member" id="${userId}">
                  <input type="hidden" name = "group[user_ids][]" value="${userId}">
                    <p class="chat-group-user__name">${userName}</p>
                    <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${userId}" data-user-name="${userName}">削除</a>
                  </input>
                </div>`
    chat_members.append(html2);
  }
  //⑴検索の部分
 $(".chat-group-form__input").on("keyup", function(){
    var input = $(".chat-group-form__input").val();//inputに、ゆーざーが入力した文字を代入。
    //ajax処理
    $.ajax({//HTTPメソッドはGETで、/groups/searchのURLに{ keyword: input }を送信する。
      type: 'GET',
      url: '/groups/search', ///groups/searchにリクエストが飛ぶ
      data: { keyword: input }, //フォームに入力された文字をkeywordとinputをキーとバリューの関係でいれる。
      dataType: 'json',
      timeout: 500,
    })
    .done(function(users){//detaには@usersが入っている。
      $(".js-user-seaerch-result").empty(); //追加のボタンが該当するdiv idの要素が削除される。
      if (users.length !== 0){
        users.forEach(function(user){ //与えられた関数を配列に含まれる各要素に対して一度ずつ呼び出す。
          appendUser(user);//#user-search-resultの子要素に変数htmlを追加する。
        });
      }
      else{
        appendNoUser("一致するものはありません");
      }
    })
    // .fail(function(){
    //   alert("ユーザー検索できませんでした。")
    // });
 });

 //⑵追加ボタンを押したら、追加されるコード
 $('.js-user-seaerch-result').on("click", ".user-search-add", function() {
   console.log(this);
    var adduserId = $(this).attr('data-id'); //ここでとれてないっぽい
    var adduserName = $(this).attr('data-name');
    console.log(adduserId);

    // MySQLレコードを更新
    // $.ajax({
    //        type:'PUT',
    //        url:'/groups/ + adduserId',
    //        data: {'': adduserName},
    //        success:function(data){
    //           console.log(data);
    //        }
    // });
    $(this).parent().remove();
    appendUserToMember(adduserId,adduserName); // 追加ボタンを押したuserのいdとnameをぶち込む。
  });
 //⑶削除ボタンを押したら、削除ボタンが含まれる親要素を消す。
 $(document).on("click",".user-search-remove",function(){
   var deleteuserId = $(this).attr("data-user-id");
   var deleteuserIdd = $(this).attr("data-user-id");
   var deleteuserName = $(this).attr("data-user-name");
   //削除ボタンを押したメンバーを削除する
   // $.ajax({
   // type:'DELETE',
   // url:'/groups/:+ deleteuserId' ,
   // data: {},
   // })
   $(this).parent().remove();
 });
});
// //配列に格納
// ⑴最初にすでにグループに入っていないものを配列に格納する
// ⑵配列から、追加ボタンを押したものを削除し、グループに追加する。
// ⑶削除ボタンを押したものを配列から削除する
// ⑷保存する。
