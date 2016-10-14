  runTest(エラー時の再描画でプレースホルダが表示されること);
  
  var isSupportsNativePlaceholder
    , $text1
    , $text2
    , $text3
    , $textarea1
    , $textarea2
    , $textarea3;

  /**
   * 変数の初期化。
   */
  function setupVariables() {
    isSupportsNativePlaceholder = "placeholder" in document.createElement("input");
    $text1 = $("#text1");
    $text2 = $("#text2");
    $text3 = $("#text3");
    $textarea1 = $("#textarea1");
    $textarea2 = $("#textarea2");
    $textarea3 = $("#textarea3");
  }

  function エラー時の再描画でプレースホルダが表示されること() {
    setupVariables();

    if (isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしているブラウザがテスト対象のため常にテスト成功とする。");
      return;
    }

    equal($text1.val(), "", "placeholder属性の値が表示されているので、jQuery#val()は空文字列を返す。");
    ok($text1.hasClass("nablarch_placeholder"), "プレースホルダが表示される場合(text1)は、プレースホルダ用のclass属性が追加される。");
    equal($text2.val(), "１２３４５６７８９０１２３４５６７８９０１", "value属性が空でない場合(text2)は、value属性の値が表示される。");
    ok(!$text2.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(text2)は、プレースホルダ用のclass属性が追加されない。");
    equal($text3.val(), "", "value属性が空かつplaceholder属性の指定がない場合(text3)は、空文字が表示される。");
    ok(!$text3.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(text3)は、プレースホルダ用のclass属性が追加されない。");
    equal($textarea1.val(), "", "placeholder属性の値が表示されているので、jQuery#val()は空文字列を返す。");
    ok($textarea1.hasClass("nablarch_placeholder"), "プレースホルダが表示される場合(textarea1)は、プレースホルダ用のclass属性が追加される。");
    equal($textarea2.val(), "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１", "value属性が空でない場合(textarea2)は、value属性の値が表示される。");
    ok(!$textarea2.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(textarea2)は、プレースホルダ用のclass属性が追加されない。");
    equal($textarea3.val(), "", "value属性が空かつplaceholder属性の指定がない場合(textarea3)は、空文字が表示される。");
    ok(!$textarea3.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(textarea3)は、プレースホルダ用のclass属性が追加されない。");
  }
  