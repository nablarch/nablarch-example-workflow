  runTest(
     assertTestCode
   , nablarchのデフォルトで動作させる
   , イベント定義の確認
   , revert
  );


  // window close のバックアップ
  var _window_Close = window.close;

  /**
   * テスト用のコードが期待した通りに動作しているか検証する。
   */
  function assertTestCode() {
    var spy = proxy();
    equal(spy.callCount, 0, "proxy の呼び出し回数の初期値は0。");
    window.close();
    equal(spy.callCount, 1, "proxy オブジェクトの呼び出し回数が増加すること。");
    window.close();
    equal(spy.callCount, 2, "proxy オブジェクトの呼び出し回数が増加すること。");
    window.close();
    window.close();
    equal(spy.callCount, 4, "proxy オブジェクトの呼び出し回数が増加すること。");
    spy = proxy();
  }

  function nablarchのデフォルトで動作させる() {
    var testcases = test_for('default')
     ,  no_close = testcases[0]
     ,  with_close =  testcases[1]
     ,  spy ;
    spy = proxy();
    no_close.area.find('button, a').each(function(){
      $(this).click(function(event){event.preventDefault();}).click();
      equal(spy.callCount, 0 , no_close.msg);
    });

    spy = proxy();
    with_close.area.find('button, a').each(function(i){
      $(this).click(function(event){event.preventDefault();}).click();
      equal(spy.callCount, i + 1, with_close.msg);
    });

  }

  function イベント定義の確認() {
    var no_close = test_for("eventDef")[0]
      ,  spy ;
    spy = proxy();
    no_close.area.find('button, a').each(function(){
      $(this).click(function(event){event.preventDefault();}).click();
      equal(spy.callCount, 0 , no_close.msg);
    });
  }


  /**
   * テストケースの情報を取得する。
   */
  function test_for(case_id) {
    var $cases = $('.testcase.' + case_id);
    return $cases.map(function(){
       return {
          msg : $(this).text()
        , area : $(this).closest('div')
       };
    });
  }

  function proxy() {
    var proxy = {callCount : 0};
    mock(function(e) {
      proxy.callCount++;
      return false;
    });
    return proxy;
  }

  function mock(fn) {
    window.close = fn;
    if (window.close == _window_Close) {
      throw "can't override!";
    }
  }

  function revert() {
    window.close = _window_Close;
    ok(window.close, 'windowCloseを復元');
  }
