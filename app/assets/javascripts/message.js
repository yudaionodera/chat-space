$(function(){
  //html(メッセージ部分)を作成するメソッド
  function buildHTML(message){
    var html = `- @messages.each do |message|
                  %p.p5<
                    = message.user_name
                  %h2.h1
                    = message.created_at.strftime('%Y年%m月%d日 %H:%M')
                  %p.p6
                    = message.body
                  %p.p6
                    = image_tag message.image if message.image.present?`
    return html;
  }
  $( 'form.js-content').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this); //formのデータの送信に使うことができる。(FormData
  //  var url = $(this).attr(`action`) //attrは要素がもつ指定属性を返す。ここでは、urlを返している。
  //  var group_id = $('.group_id').attr('value');
    var href = window.location.href + '/messages';
    //var href = '/groups/' + group_id + '/messages.json'
    $.ajax({
      url: '/groups/:group_id/messages',
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: 'false',
      contentType: 'false'
      // success : function(data) {
      // //APIとの通信に成功してデーターが取得できた場合に実行される
      // alert('メッセージ送信成功');
// return;
})
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html); //apendメソッド　$(‘セレクタ’).append(‘追加するもの’);　→アクションが起きたら、htmlメソッドが追加される仕組み。
      $('.form__message').val(''); //どこからこのテキストボックスは来ているのか。
      $('.main__contents__second').animate({
         'marginTop': '200px'
      });
    })
    // .fail(function({
    //   alert('error');
    // }))
  })
})

//自動更新分
$(function(){
  function buildMessage(message) {
    var html3 = `- @messages.each do |message|
                  %p.p5<
                    = message.user_name
                  %h2.h1
                    = message.created_at.strftime('%Y年%m月%d日 %H:%M')
                  %p.p6
                    = message.body
                  %p.p6
                    = image_tag message.image if message.image.present?`
    return html3;
  }
  $(function(){
    setInterval(update, 100); //5秒ごとにupdateする
  });
  function update(){
    var message_id = $('.js-messages:last').data("id");
    $.ajax({
      url: '/groups/:group_id/messages', //URL
      type: 'GET', //getメソッド
      data:{  //railsに送るデータ
        message: {id: message_id }
      },
      dataType: "json" //json形式
    })
    .always(function(data){ //index.json.jbuilderから受け取ったデータ(@new_message)を引数にとる
      $.each(data, function(i, data){ //
        buildMessage(data);
      });
    });
  }
});
