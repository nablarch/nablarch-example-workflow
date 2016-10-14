"use strict";
  var animatingDuration = 1000
    , $button, $button2, $button3
    , $input, $input2, $input3
    , $calendar, $calendar2, $calendar3;

  runTest(
        カレンダーの日付をクリックすることで日付が入力されること
      , サブミット時に選択した日付が送信されること
      , カレンダーはボタンを押すと開き_カレンダーの外をクリックすると閉じること
      , カレンダーを開いたときは入力欄の日付を含む月を表示すること
      , 入力欄が空の状態でカレンダーを開いた場合は現在の月を表示すること
      , カレンダーの表示を1ヶ月単位に移動できること
      , カレンダーの表示を1年単位で移動できること
      , 複数のカレンダーを使用しても正しく動作すること
      , 別ロケール_フォーマットを使用できること
      , 日付を直接入力後にフォーカスが外れると入力値を自動的にフォーマットすること
  );

//  runTest(
        //精査エラー時に前回選択した項目が保持されていること
      //, 精査エラー後に再送信した場合に正しく送信できること
//  );

  function setup() {
    $button    = $("button.nablarch_DatePicker").first();
    $input     = $("input[name='formdata.effectiveDate']");
    $calendar  = $("div.calendar").first();

    $button2   = $("button.nablarch_DatePicker").eq(1);
    $input2    = $("input[name='formdata.lastEffectiveDate']");
    $calendar2 = $("div.calendar").eq(1);

    $button3   = $("button.nablarch_DatePicker").eq(2);
    $input3    = $("input[name='formdata.anotherLocaleSample']");
    $calendar3 = $("div.calendar").eq(2);
  }

  function reset() {
    setup();
    $("div.calendar").hide();
    $("input").val("");
  }

  function カレンダーの日付をクリックすることで日付が入力されること() {
    setup();
    equal($input.val(), "2012/10/20", "リクエストパラメータに設定された日付を表示する");
    ok($calendar.is(":hidden"), "初期表示ではカレンダーは非表示");
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      ok($calendar.is(":visible"), "ボタンをクリックするとカレンダーが開く");
      equal($calendar.find(".weekday0").text(), "日曜日", "jaロケールでの曜日表示(日曜)");
      equal($calendar.find(".weekday3").text(), "水曜日", "jaロケールでの曜日表示(水曜)");

      $calendar.find("td.thisMonth:contains('10')").click(); //10日をクリック
      equal($input.val(), "2012/10/10", "選択した日付が入力される");
    }, animatingDuration);

    setTimeout(function() {
      ok($calendar.is(":hidden"), "日付を入力するとカレンダーは閉じる");
      QUnit.start();
    }, animatingDuration *2);
  }

  function サブミット時に選択した日付が送信されること() {
    reset();
    $input.val("2012/10/10");
    $(document).one("beforeSubmit", function(event, submitName, form) {
      equal(
        $(form["formdata.effectiveDate"]).val()
      , "2012/10/10", "選択した日付が送信される"
      );

      form.reset();
      return false;
    });
    $("#check").click(); // 「確認」ボタンをクリック
  }

  function カレンダーはボタンを押すと開き_カレンダーの外をクリックすると閉じること() {
    reset();
    ok($calendar.is(":hidden"), "カレンダーは閉じている");
    if ('ontouchstart' in window) {
      ok(false, "タッチデバイスではエミュレーションできないので打鍵確認してください。");
      return; //タッチデバイスではtouchstartで制御を行い、エミュレーションできないので打鍵確認
    }
    $button.click();
    ok($calendar.is(":visible"), "ボタンをクリックすると表示される");
    $("div#brand_logo").click();
    QUnit.stop();
    setTimeout(function() {
      ok($calendar.is(":hidden"), "カレンダーの外側をクリックすると閉じる");
      $button.click();
      setTimeout(function() { $button.click(); }, animatingDuration);
      setTimeout(function() {
        ok($calendar.is(":hidden"), "カレンダーが開いている状態でボタンを再度押しても閉じる");
        QUnit.start();
      }, animatingDuration *2);
    }, animatingDuration);
  }

  function カレンダーを開いたときは入力欄の日付を含む月を表示すること() {
    reset();
    $input.val("2011/09/20");    // 入力欄の日付は2012/10/20
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      equal($calendar.find(".year .value").text(), "2011", "入力欄の日付を含む年を表示");
      equal($calendar.find(".month .value").text(), "9月", "入力欄の日付を含む月を表示");
      ok($calendar.find("table.dates td")
                  .filter(function() {return $(this).text() == "20";})
                  .is(".selected")
      , "入力欄の日付をハイライト表示(.selected)する"
      );
      QUnit.start();
    }, animatingDuration);
  }

  function 入力欄が空の状態でカレンダーを開いた場合は現在の月を表示すること() {
    var today = new Date();
    reset();  // 入力欄は空
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      equal($calendar.find(".year .value").text(), today.format("{yyyy}", "ja"), "現在の年を表示");
      equal($calendar.find(".month .value").text(), today.format("{Month}", "ja"),  "現在の月を表示");
      ok($calendar.find("table.dates td")
                  .filter(function() {return $(this).text() == today.format("{d}");})
                  .is(".today")
      , "当日日付は枠線が表示される(.today)"
      );
      QUnit.start();
    }, animatingDuration);
  }

  function 日付を直接入力後にフォーカスが外れると入力値を自動的にフォーマットすること() {
    var today = new Date();
    reset();  // 入力欄は空
    $input.val("19770202");
    $input.blur();
    equal($input.val(), "1977/02/02", "blur時に入力値をフォーマットして表示する。");

    $input.val("Feb 2, 1977");
    $input.blur();
    equal($input.val(), "", "入力値が不正であった場合は空になる。");
  }

  function カレンダーの表示を1ヶ月単位に移動できること() {
    reset();
    $input.val("2011/12/20");
    $button.click();
    QUnit.stop();

    setTimeout(nextMonth, animatingDuration);

    function nextMonth() {
      $calendar.find(".nextMonth").click();
      equal($calendar.find(".year .value").text(), "2012", "翌月の年を表示");
      equal($calendar.find(".month .value").text(), "1月", "翌月を表示");
      $calendar.find("td.thisMonth").filter(function(){return $(this).text() == "1";})
               .click(); // 1日を選択
      equal($input.val(), "2012/01/01", "翌月の一日が選択される");

      $button.click();
      setTimeout(lastMonth, animatingDuration);
    }

    function lastMonth() {
      $calendar.find(".lastMonth").click();
      equal($calendar.find(".year .value").text(), "2011", "前月の年を表示");
      equal($calendar.find(".month .value").text(), "12月", "前月を表示");
      $calendar.find("td.thisMonth").filter(function(){return $(this).text() == "1";})
               .click(); // 1日を選択
      equal($input.val(), "2011/12/01", "翌月の一日が選択される");

      QUnit.start();
    }
  }

  function カレンダーの表示を1年単位で移動できること() {
    reset();
    $input.val("2011/12/20");
    $button.click();
    QUnit.stop();

    setTimeout(nextMonth, animatingDuration);

    function nextMonth() {
      $calendar.find(".nextYear").click();
      equal($calendar.find(".year .value").text(),  "2012", "翌年の年を表示");
      equal($calendar.find(".month .value").text(), "12月", "月は変わらず");
      $calendar.find("td.thisMonth").filter(function(){return $(this).text() == "1";})
               .click(); // 1日を選択
      equal($input.val(), "2012/12/01", "翌年の一日が選択される");

      $button.click();
      setTimeout(lastMonth, animatingDuration);
    }

    function lastMonth() {
      $calendar.find(".lastYear").click();
      equal($calendar.find(".year .value").text(), "2011", "前年の年を表示");
      equal($calendar.find(".month .value").text(), "12月", "月は変わらず");
      $calendar.find("td.thisMonth").filter(function(){return $(this).text() == "1";})
               .click(); // 1日を選択
      equal($input.val(), "2011/12/01", "前年の一日が選択される");

      QUnit.start();
    }
  }

  function 複数のカレンダーを使用しても正しく動作すること() {
    reset();
    $input.val("1912/12/20");
    $input2.val("2012/12/20");

    $button2.click();
    QUnit.stop();

    setTimeout(function() {
      ok($calendar2.is(":not(:hidden)"), "2つめカレンダーを開く");
      ok($calendar.is(":hidden"),        "1つめのカレンダーはそのまま");

      $calendar2.find(".nextMonth").click();
      $calendar2.find("td:contains(20)").click();

      equal($input2.val(), "2013/01/20", "2つめのカレンダーで翌月の日付を選択");
      equal($input.val(),  "1912/12/20", "1つめの日付の値はそのまま");

      QUnit.start();

    }, animatingDuration);
  }

  function 別ロケール_フォーマットを使用できること() {
    reset();
    $input3.val("12.20,13");

    $button3.click();
    QUnit.stop();

    setTimeout(function() {
      equal($calendar3.find(".year .value").text(), "2013", "別フォーマットの読み込み(yy)");
      equal($calendar3.find(".month .value").text(), "December", "別フォーマットの読み込み(M)");
      ok($calendar3.find("td:contains(20)").is(".selected"), "別フォーマットの読み込み(d)");

      $calendar3.find(".nextMonth").click();
      $calendar3.find("td:contains(10)").click();

      equal($input3.val(), "1.10,14", "別フォーマットでの出力");

      equal($calendar3.find(".weekday0").text(), "sun", "enロケールでの曜日表示(日曜)");
      equal($calendar3.find(".weekday3").text(), "wed", "enロケールでの曜日表示(水曜)");

      QUnit.start();
    }, animatingDuration);
  }

  function 精査エラー時に前回選択した項目が保持されていること() {
    setup();
    equal($input.val()
        , ""
        , "未入力項目は未入力のまま。");
    equal($input2.val()
        , "2012/11/10"
        , "前回入力した値が復帰している。");
  }

  function 精査エラー後に再送信した場合に正しく送信できること() {
    setup();
    $input.val("2012/10/10");
    $(document).one("beforeSubmit", function(event, submitName, form) {
      equal($(form["formdata.effectiveDate"]).val()
      , "2012/10/10"
      , "精査エラー後に再編集した項目の送信が正しく行われる。"
      );
      equal($(form["formdata.lastEffectiveDate"]).val()
      , "2012/11/10"
      , "精査エラー時に復帰した項目の再送信が正しく行われる。"
      );
      form.reset();
      return false;
    });
    $("button[name='check']").click();
  }

