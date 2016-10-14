  runTest(
    ネイティブでplaceholder属性をサポートしている場合はPlaceholderが適用されないこと,
    ネイティブでplaceholder属性をサポートしていない場合はPlaceholderが適用されること,
    プレースホルダが表示されること,
    値を入力フィールドに入力した場合はプレースホルダが消えること,
    サブミット時にプレースホルダが送信されないこと
  );
  
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

  /**
   * 変数のデフォルト値設定。
   */
  function setupDefaultValues() {
    $text1.val("");
    $text2.val("あいうえお");
    $text3.val("");
    $textarea1.val("");
    $textarea2.val("かきくけこ");
    $textarea3.val("");
  }

  function ネイティブでplaceholder属性をサポートしている場合はPlaceholderが適用されないこと() {
    setupVariables();
    setupDefaultValues();
    
    if (!isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしていないブラウザがテスト対象のため、常にテスト成功とする。");
      return;
    }
    
    // Placeholderが適用されないことの確認
    ok(!$text1.attr("class").has("nablarch_placeholder"),     "ネイティブでplaceholderをサポートしているので、text1にPlaceholderクラスが適用されない。");
    ok(!$text2.attr("class").has("nablarch_placeholder"),     "ネイティブでplaceholderをサポートしているので、text2にPlaceholderクラスが適用されない。");
    ok(!$text3.attr("class").has("nablarch_placeholder"),     "ネイティブでplaceholderをサポートしているので、text3にPlaceholderクラスが適用されない。");
    ok(!$textarea1.attr("class").has("nablarch_placeholder"), "ネイティブでplaceholderをサポートしているので、textarea1にPlaceholderクラスが適用されない。");
    ok(!$textarea2.attr("class").has("nablarch_placeholder"), "ネイティブでplaceholderをサポートしているので、textarea2にPlaceholderクラスが適用されない。");
    ok(!$textarea3.attr("class").has("nablarch_placeholder"), "ネイティブでplaceholderをサポートしているので、textarea3にPlaceholderクラスが適用されない。");

    // $.val()がオーバーライドされないことの確認
    $text1.val("10文字まで入力できます。");
    equal($text1.val(), "10文字まで入力できます。", "placeholder属性と同じ値をvalue属性に設定した場合(text1)は、$.val()呼び出しでvalue属性の値が返される。");
  }

  function ネイティブでplaceholder属性をサポートしていない場合はPlaceholderが適用されること() {
    setupVariables();
    setupDefaultValues();

    if (isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしているブラウザがテスト対象のため常にテスト成功とする。");
      return;
    }

    // Placeholderが適用されることの確認
    equal($text1.attr("class").trim(), "nablarch_placeholder", "ネイティブでplaceholderをサポートしていないので、text1にPlaceholderクラスが適用される。");
    equal($text2.attr("class").trim(), "", "値が設定されているので、Placeholderクラスは適用されない。");
    equal($text3.attr("class").trim(), "", "placeholder属性を指定していないので、text3にPlaceholderクラスが適用されない。");
    equal($textarea1.attr("class").trim(), "nablarch_placeholder", "ネイティブでplaceholderをサポートしていないので、textarea1にPlaceholderクラスが適用される。");
    equal($textarea2.attr("class").trim(), "", "値が設定されているので、Placeholderクラスは適用されない。");
    equal($textarea3.attr("class").trim(), "", "placeholder属性を指定していないので、textarea3にPlaceholderクラスが適用されない。");

    // $.val()がオーバーライドされることの確認
    $text1.val("");
    ok($text1.hasClass("nablarch_placeholder"), "空文字を設定した場合、プレースホルダーを示すclassが設定される");
    equal($text1.val(), "", "空文字列を設定しているので空文字列が取得出来る");
    equal($text1.originalVal(), "10文字まで入力できます。", "空文字列を設定しているので空文字列が取得出来る");
  }

  function プレースホルダが表示されること() {
    setupVariables();
    setupDefaultValues();

    if (isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしているブラウザがテスト対象のため常にテスト成功とする。");
      return;
    }
    
    equal($text1.val(), "", "placeholder属性の値が表示されているので、jQuery#val()は空文字列を返す。");
    ok($text1.hasClass("nablarch_placeholder"), "プレースホルダが表示される場合(text1)は、プレースホルダ用のclass属性が追加される。");
    equal($text2.val(), "あいうえお", "value属性が空でない場合(text2)は、value属性の値が表示される。");
    ok(!$text2.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(text2)は、プレースホルダ用のclass属性が追加されない。");
    equal($text3.val(), "", "value属性が空かつplaceholder属性の指定がない場合(text3)は、空文字が表示される。");
    ok(!$text3.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(text3)は、プレースホルダ用のclass属性が追加されない。");
    equal($textarea1.val(), "", "placeholder属性の値が表示されているので、jQuery#val()は空文字列を返す。");
    ok($textarea1.hasClass("nablarch_placeholder"), "プレースホルダが表示される場合(textarea1)は、プレースホルダ用のclass属性が追加される。");
    equal($textarea2.val(), "かきくけこ", "value属性が空でない場合(textarea2)は、value属性の値が表示される。");
    ok(!$textarea2.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(textarea2)は、プレースホルダ用のclass属性が追加されない。");
    equal($textarea3.val(), "", "value属性が空かつplaceholder属性の指定がない場合(textarea3)は、空文字が表示される。");
    ok(!$textarea3.hasClass("nablarch_placeholder"), "プレースホルダが表示されない場合(textarea3)は、プレースホルダ用のclass属性が追加されない。");
  }

  function 値を入力フィールドに入力した場合はプレースホルダが消えること() {
    setupVariables();
    setupDefaultValues();

    if (isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしているブラウザがテスト対象のため常にテスト成功とする。");
      return;
    }

    $text1.val("text1に値を設定する。");
    equal($text1.val(), "text1に値を設定する。", "value属性に値を設定した場合(text1)は、value属性の値が表示される。");
    ok(!$text1.hasClass("nablarch_placeholder"), "value属性に値を設定した場合(text1)は、プレースホルダ用のclass属性が削除される。");

    $textarea1.val("textarea1に値を設定する。");
    equal($textarea1.val(), "textarea1に値を設定する。", "value属性に値を設定した場合(textarea1)は、value属性の値が表示される。");
    ok(!$textarea1.hasClass("nablarch_placeholder"), "value属性に値を設定した場合(textarea1)は、プレースホルダ用のclass属性が削除される。");

  }

  function サブミット時にプレースホルダが送信されないこと() {
    setupVariables();
    setupDefaultValues();

    if (isSupportsNativePlaceholder) {
      ok(true, "ネイティブでplaceholder属性をサポートしているブラウザがテスト対象のため常にテスト成功とする。");
      return;
    }

    $(document).one("beforeSubmit", function (event, submitName, form) {
      equal($(form["formdata.text1"]).val(), "", "プレースホルダが表示された項目(text1)は、空文字が送信される。");
      equal($(form["formdata.text2"]).val(), "あいうえお", "プレースホルダが表示されてない項目(text2)は、そのまま送信される。");
      equal($(form["formdata.text3"]).val(), "", "プレースホルダが表示されてない項目(text3)は、そのまま送信される。");
      equal($(form["formdata.textarea1"]).val(), "", "プレースホルダが表示された項目(textarea1)は、空文字が送信される。");
      equal($(form["formdata.textarea2"]).val(), "かきくけこ", "プレースホルダが表示されてない項目(textarea2)は、そのまま送信される。");
      equal($(form["formdata.textarea3"]).val(), "", "プレースホルダが表示されてない項目(textarea3)は、そのまま送信される。");
      return false;
    });
    $("#check").click(); // 「確認」ボタンをクリック
  }
  