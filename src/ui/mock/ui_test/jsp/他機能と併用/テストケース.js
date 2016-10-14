"use strict";
  var duration = 200;
  runTest(
     カレンダーの日付を変更した場合に変更イベントが発生すること
   , 入力された日付と同じ日付を選択した場合は変更イベントが発生しないこと
   , 入力値が不正な場合のケース
   , フォーマットが発生する場合のケース
  );

  function カレンダーの日付を変更した場合に変更イベントが発生すること() {
    var $to       = $("input#to")
      , $input    = $("input#calendar")
      , $calendar = $("div.calendar")
      , $button   = $('button.nablarch_DatePicker')
      , called    = false
      //eventを定義しておかないとテストコードでエラーが発生し、処理が停止してしまうので、アサートエラーになるようにする。
      , event     = {currentTarget:{}};

    // ともに初期化
    $to.val("");
    $input.val("2012/01/01");
    $input.on("change", function(e) {
      called = true;
      event = e;
    });
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      ok($calendar.is(":visible"), "ボタンをクリックするとカレンダーが開く");
      $calendar.find("td.thisMonth:contains('10')").click(); //10日をクリック

      setTimeout(function(){
        equal($input.val(), "2012/01/10", "選択した日付が入力される");
        equal(event.currentTarget.id, "calendar", "入力フィールドがイベント発火のトリガー");
        equal($to.val(), "2012/01/10", "選択した日付が反映される");
        ok(called, "changeイベントに登録したハンドラが呼び出される。");
        QUnit.start();
      }, duration);
    }, duration);
  }

  function 入力された日付と同じ日付を選択した場合は変更イベントが発生しないこと() {
    var $to       = $("input#to")
      , $input    = $("input#calendar")
      , $calendar = $("div.calendar")
      , $button   = $('button.nablarch_DatePicker')
      , called    = false;
    // ともに初期化
    $to.val("");
    $input.val("2012/01/10");
    $input.on("change", function() {
      called = true;
    });
    $button.click();
    QUnit.stop();
    setTimeout(function() {
      ok($calendar.is(":visible"), "ボタンをクリックするとカレンダーが開く");
      $calendar.find("td.thisMonth:contains('10')").click(); //入力値と同じ日をクリック

      setTimeout(function(){
        equal($input.val(), "2012/01/10", "選択前と同じ日付");
        equal($to.val(), "", "changeイベントが発生しないので反映されない。");
        ok(!called, "changeイベントに登録したハンドラが呼び出されない。");
        QUnit.start();
      }, duration);
    }, duration);
  }

  function 入力値が不正な場合のケース() {
    var $to       = $("input#to")
      , $input    = $("input#calendar")
      , $button   = $('button.nablarch_DatePicker')
      , called    = false;

    $to.val("2011/1/1");
    $input.val("illegalDate");
    $input.on("change", function() {
      called=true;
    });
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      // calendar以外の要素をクリックしてカレンダーを閉じる。
      $button.click();
      setTimeout(function(){
        equal($input.val(), "", "不正な値の場合は空文字になる。");
        ok(called, "値が変更されたため、changeイベントが発火");
        equal($to.val(), "", "空文字が反映される。");
        QUnit.start();
      }, duration);
    }, duration);
  }

  function フォーマットが発生する場合のケース() {
    var $to       = $("input#to")
      , $input    = $("input#calendar")
      , $button   = $('button.nablarch_DatePicker')
      , called    = false;

    $to.val("20141010");
    $input.val("20141010");
    $input.on("change", function() {
      called=true;
    });
    $button.click();
    QUnit.stop();

    setTimeout(function() {
      // calendar以外の要素をクリックしてカレンダーを閉じる。
      $button.click();
      setTimeout(function(){
        equal($input.val(), "2014/10/10", "yyyy/MM/DDにフォーマットされる。");
        ok(called, "値が変更されたため、changeイベントが発火");
        equal($to.val(), "2014/10/10", "フォーマット後の値が入る。");
        QUnit.start();
      }, duration);
    }, duration);
  }

