$(function() {
  var search_list = $(".js-user-seaerch-result");
  var search_result = $(".chat-group-user.clearfix.js-chat-member");
  var chat_members = $(".chat-group-users.js-add-user");

  function appendUser(user){
    var html =`<div class = "chat-group-user clearfix",id="chat-group-user-${user.id}">
                  <p class = "chat-group-user__name" >
                     ${user.name}
                  </p>
                  <a class = "user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn",data-user-id: "${user.id}",data-user-name: "${user.name}">
                    追加
                  </a>
              </div>`
              //rubyコード使えない？
    // var html =`.chat-group-user.clearfix
    //             - @users.each do |user|
    //               %p.chat-group-user__name
    //                 = user.name
    //               %a.user-search-add.chat-group-user__btn.chat-group-user__btn--add.js-add-btn
    //                 追加`
    //現在所属しているグループの編集に使う

    search_list.append(html); //htmlの要素を追加する
    // search_result.append(html2);//
  }

  function appendUserToMember(user){
    var html2 = `<div class="chat-group-user clearfix js-chat-member",id="chat-group-user-${user.id}">
                  <input type="hidden",name = "group[user_ids][]",value = "${user.id}">
                    <p class = "chat-group-user__name">
                      ${user.name}
                    </p>
                    <a class = "user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn,"data-user-id": "${user.id}","data-user-name": "${user.name}">
                      削除
                    </a>
                  </input>
                </div>`
    chat_members.append(html2);
  }

  function appendNoUser(user) {
   var html = `%li
                 .listview__element--right-icon ${user.name}`
   search_list.append(html); //search_listの子要素に変数htmlを追加する。
  }
//-----------------------以上、関数定義----------------------


  //⑴検索の部分
 $(".chat-group-form__input").on("keyup", function(){
    var input = $(".chat-group-form__input").val();//inputに、ゆーざーが入力した文字を代入。
    //ajax処理
    $.ajax({//HTTPメソッドはGETで、/groups/searchのURLに{ keyword: input }を送信する。
      type: 'GET',
      url: '/groups/search', ///groups/searchにリクエストが飛ぶ
      data: { keyword: input }, //keywordとinputをキーとバリューの関係でいれる。
      dataType: 'json'
      timeout: 500;
    })
    .done(function(users){//detaには@usersが入っている。
      $(".js-user-seaerch-result").empty(); //追加のボタンが該当するdiv idの要素が削除される。
      //$("#chat-group-user-${uesr.id}").append();  //
      if (users.length !== 0){
        users.forEach(function(user){ //与えられた関数を配列に含まれる各要素に対して一度ずつ呼び出す。
          appendUser(user);//#user-search-resultの子要素に変数htmlを追加する。
        });
      }
      else{
        appendNoUser("一致するものはありません");
      }
    })
  });

  //⑵追加ボタンを押したら、追加されるコード
  $(document).on("click","#chat-group-user-#{user.id}",function(){
    //chat_members.append();
    $("chat-group-user-#{user.id}").remove();//追加ボタンを押したユーザーを消す処理
    appendUserToMember(user);
  });
  //⑶削除ボタンを押したら、削除ボタンが含まれる親要素を消す。
  $(document).on("click","#chat-group-user-#{user.id}",function(){
    $("#{user.id}").remove();
    save();
  });
 });
});
//必要な実装
//⑴追加ボタンを押したら、js-user-seaerch-resultクラスから要素が削除され、同時にchat-group-users js-add-userクラスに要素が追加される。
//- 非同期通信の結果を得て、HTMLを作成する
//ここにおいて、実装する。
// -
// -
// -
//⑵削除ボタンを押したら、chat-group-users js-add-userクラスから要素が削除される。
