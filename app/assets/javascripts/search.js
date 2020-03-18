$(function() {
  var search_title = $(".entries__latest-title");
  var search_list = $(".entries__latest-tiles");

  function appendEntry(entry) {

    if ( entry.image ){
      var thumbnail = `<img class="tile__image" src="${entry.image}">`
    } else {
      var thumbnail = `<div class="tile__noimage"></div>`
    }
    var html = `<a href="/entries/${entry.id}" class="tile">
                ${thumbnail}
                <div class="tile__title">${entry.title}</div>
                <div class="tile__user-name">${entry.name}</div>
              </a>`
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-words").on("keyup", function() {
    var input = $(".search-words").val();
    $.ajax({
      type: 'GET',
      url: '/entries/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(entries) {
      $(".entries__latest-tiles").empty();
      if (entries.length !== 0) {
        entries.forEach(function(entry){
          appendEntry(entry);
        });
      } else {
        appendErrMsgToHTML("一致する投稿がありません");
      }
      search_title.empty();
      var search_count = entries.length;
      var s_title =
        `<div class="entries__latest-title">
          <div class="title-box">
            <h2>キーワード検索</h2>
            <h4>検索結果： ${search_count}件</h4>
          </div>
        </div>`
      search_title.append(s_title);

      // 検索フォームを空にした時最新投稿のタイトル表示
      $(function() {
        var form_null = $.isEmptyObject(input);
        if (form_null == true){
          search_title.empty();
          var title =
            `<div class="entries__latest-title">
              <h2>最新投稿</h2>
            </div>`
          search_title.append(title);
        }
      });
    })
    .fail(function() {
      alert('error');
    });
  });
});