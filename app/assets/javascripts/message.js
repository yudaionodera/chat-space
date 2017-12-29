$(function(){
  //html(メッセージ部分)を作成するメソッド
  function buildHTML(comment){
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
  $( '#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this); //formのデータの送信に使うことができる。(FormData
  //  var url = $(this).attr(`action`) //attrは要素がもつ指定属性を返す。ここでは、urlを返している。
  //  var group_id = $('.group_id').attr('value');
    var href = window.location.href + '/messages'
    //var href = '/groups/' + group_id + '/messages.json'
    $.ajax({
      url: href,
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
