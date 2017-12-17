$(function(){
  $( '#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this); //formのデータの送信に使うことができる。(FormData
    var url = $(this).attr(`action`) //attrは要素がもつ指定属性を返す。ここでは、urlを返している。
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: 'false',
      contentType: 'false'
    })
  })
})
