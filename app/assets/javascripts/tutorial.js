$(function(){
  if ($.cookie('TutorialFlg') != 'on') {
    tutorial();
  }
});

// Cookieがなければ（初回又は一ヶ月以上空いていれば）チュートリアルを表示

function tutorial(){
  introJs().setOptions({
    'nextLabel': 'next →',
    'prevLabel': '← prev',
    'skipLabel': 'skip',
    'doneLabel': 'finish',
    'exitOnOverlayClick': false,
    'showStepNumbers': false,
    steps: [
      {
        intro: "<b>Have a Nice Day !</b><br>趣味投稿アプリへようこそ！<br>まずは簡単に機能のご紹介をします"
      },
      {
        element: '.side__header__system-menu',
        intro: "左が新規登録、真ん中がログイン、製作者のTwitterとなります<br>ログインすると、左はマイページ、真ん中は新規投稿に変わります"
      },
      {
        element: '.entries__latest-title',
        intro: "投稿していただいた記事は、最新順でこちらに表示されます！"
      },
      {
        element: '.tile',
        intro: "記事をクリックしていただくと詳細なページに行けます<br>更にページ内のユーザー名をクリックすると<br>そのユーザーさんの投稿一覧も見られるようになります"
      },
      {
        element: '.side__box__keyword-search',
        intro: "特定のキーワードを含む記事をお探しの方は、こちらからどうぞ"
      },
      {
        element: '.side__box__tags',
        intro: "以下はタグの一覧となります！<br>使う時間や場所、どんな気分や雰囲気になりたいか<br>お好みでお探しください"
      },
      {
        intro: "好きなものを広めたい方、新しい趣味を探したい方<br>時間を持て余している方<br>さまざまな方に親しんでいただけると幸いです！"
      },
    ]
  }).start().onexit(function() {
    $.cookie('TutorialFlg', 'on', { expires: 30, path: '/' });
  });
};