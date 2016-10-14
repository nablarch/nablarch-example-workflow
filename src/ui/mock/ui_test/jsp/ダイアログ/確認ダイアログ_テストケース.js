require(['jquery'],
function($){
  var _confirm = window.confirm
    , $all_nodes = [];

  runTest(
      必須属性のみのテスト
    , 条件指定のテスト
    , 表示条件を別の要素を条件判定にするテスト
    , stop属性のテスト
    , revert属性のテスト
    , restore
  );

  $(function() {
    $all_nodes = $('span.test-case, div.field');
  });

  function 必須属性のみのテスト() {
    var testcase = test_for("require-only")[0]
      , caseMsg  = testcase.testcase
      , $node   = testcase.area.find('input')
      , samples = ['nablarch', 'ssd', 'data', '', '  '] //いずれでも動作すること。
      , preval = $node.val();

    equal($node.size(), 1, testcase.testcase + " 要素数が異なる(事前条件の確認)");
    doCancelTest();
    // 状態が変わらないcancelのテストから実行する。
    // doCancel の再起呼び出しが修了したら doOkを実行する。
    function doCancelTest(no) {
      var caseNo   = no || 0
        , sample   = samples[caseNo]
        , results  = mockConfirm(false);
      $node.val(sample);
      doChange($node);
      delay(function(){
        equal($node.val(), preval, caseMsg + " 復元の確認。");
        equal(results.length, 1 , caseMsg + " 呼び出し回数の確認。");
        if(samples.length > caseNo + 1) {
          doCancelTest(caseNo + 1);
        } else {
          doOkTest();
        }
      });
    }

    function doOkTest(no) {
      var caseNo   = no || 0
        , sample   = samples[caseNo]
        , results  = mockConfirm(true);
      $node.val(sample);
      doChange($node);
      delay(function(){
        equal($node.val(), sample, caseMsg + " 復元の確認。");
        equal(results.length, 1 , caseMsg + " 呼び出し回数の確認。");
        if(samples.length > caseNo + 1) {
          doOkTest(caseNo + 1);
        }
      });
    }
  }

  function 条件指定のテスト() {
    var testcase = test_for('conditional')[0]
      , caseMsg  = testcase.testcase
      , $node = testcase.area.find('input')
      , samples  = ['ssd', ' ', '', 'match']
      , results;

    equal($node.size(), 1, caseMsg + " 要素数の確認。");

    // 条件に一致しないため、確認ダイアログは表示されない。
    doCancelTest();
    function doCancelTest(no) {
      var caseNo = no || 0
        , sample = samples[caseNo]
        , results = mockConfirm(false);
      $node.val(sample);
      doChange($node);
      delay(function() {
        equal(results.length, 0, caseMsg + ' [呼び出し回数の確認]');
        equal($node.val(), sample, caseMsg + ' [メッセージの確認]');
        if (samples.length > caseNo + 1) {
          doCancelTest(caseNo+1);
        } else {
          doOkTest();
        }
      });
    }
    function doOkTest(no) {
      var caseNo = no || 0
        , sample = samples[caseNo]
        , results = mockConfirm(true);
      $node.val(sample);
      doChange($node);
      delay(function() {
        equal(results.length, 0, caseMsg + ' [呼び出し回数の確認]');
        equal($node.val(), sample, caseMsg + ' [メッセージの確認]');
        if (samples.length > caseNo + 1) {
          doOkTest(caseNo+1);
        } else {
          doConditionMatch();
        }
      });
    }
    function doConditionMatch() {
      // 初期化
      $node.val('reset_val');
      doChange($node); // データ保存
      delay(function(){
        results = mockConfirm(false);
        $node.val('nablarch');
        doChange($node);
        delay(function(){
          equal(results.length, 1, caseMsg + " [条件に一致した場合の確認]");
          equal(results[0].param, "条件を指定した場合は一致した場合のみ、ダイアログが表示される。", caseMsg + " [メッセージの確認]");
          equal($node.val(), 'reset_val', caseMsg + " [復元の確認]");

          // OKの場合
          results = mockConfirm(true);
          $node.val('nablarch');
          doChange($node);
          delay(function(){
            equal(results.length, 1, caseMsg + " [条件に一致した場合の確認]");
            equal(results[0].param, "条件を指定した場合は一致した場合のみ、ダイアログが表示される。", caseMsg + " [メッセージの確認]");
            equal($node.val(), 'nablarch', caseMsg + " [変更の確認]");
          });
        });
      });
    }
  }

  function 表示条件を別の要素を条件判定にするテスト() {
    var testcase = test_for('otherTarget')[0]
      , caseMsg  = testcase.testcase
      , $trigger = testcase.area.find('input')
      , $condition = $('input#target')
      , firstval = $trigger.val()
      , results;

    // テストの事前条件の確認
    equal($trigger.size(), 1, caseMsg + " triggerの要素数が異なる。");
    equal($condition.size(), 1, caseMsg + " conditionの要素数が異なる。");
    notEqual($condition.attr('id'), $trigger.attr('id'), "トリガーと条件の要素が異なること。");

    // 表示される条件の設定
    $condition.val('');
    // cancel case
    results = mockConfirm(false);
    doChange($condition);
    delay(function() {
      equal(results.length, 0, caseMsg + ":条件が変更されても呼び出されない。");

      //ok case
      results = mockConfirm(false);
      $trigger.val(firstval + ' modify');
      doChange($trigger);
      delay(function() {
        equal(results.length, 1, caseMsg + ":トリガーが変更されれば呼び出される。");
        equal($trigger.val(), firstval, caseMsg + ':キャンセルされた場合はtriggerが戻る');

        // トリガーの値を変更しても関係ない。
        results = mockConfirm(true);
        $trigger.val(firstval + ' modify');
        doChange($trigger);
        delay(function() {
          equal(results.length, 1, caseMsg + ":トリガーが変更されれば呼び出される。");
          equal($trigger.val(), firstval + ' modify', caseMsg + ':OKであれば変更される');
          // 表示されない条件の設定
          $condition.val('nablarch');

          // cancel case
          results = mockConfirm(false);
          $trigger.val(firstval + ' modify');
          doChange($trigger);
          delay(function() {
            equal(results.length, 0, caseMsg + ":条件が違うので呼び出されない");
            equal($trigger.val(), firstval + ' modify', caseMsg + ":ダイアログが出ないので変更される。");

            // ok case
            results = mockConfirm(true);
            $trigger.val(firstval + ' no_revert');
            doChange($trigger);
            delay(function() {
              equal(results.length, 0, caseMsg + ":条件が違うので呼び出されない");
              equal($trigger.val(), firstval + ' no_revert', caseMsg + ":ダイアログが出ないので変更される。");
            });
          });
        });
      });
    });
  }

  function stop属性のテスト() {
    ok(false, "自動テストが壊れてしまうので打鍵での確認をしてください。");
    return;
    var testcases = test_for('stop')
      , default_case = testcases[0]
      , true_case    = testcases[1]
      , false_case   = testcases[2]
      , testTable    = [ [default_case, '総務', ''   , ["stopを指定していないため、キャンセルされた場合、動作確認用のメッセージは表示されない"]                               , false]
                       , [default_case, '総務', '総務', ["stopを指定していないため、キャンセルされた場合、動作確認用のメッセージは表示されない", "動作確認用のメッセージです。"]      , true]
                       , [default_case, '経理', '経理', ["動作確認用のメッセージです。"] /*条件に一致しない場合のテスト*/                                              , true]
                       , [true_case   , '総務', ''   , ["stopにtrueを指定しているため、このメッセージが表示されれば、表示されない。"]                                      , false]
                       , [true_case   , '総務', '総務', ["stopにtrueを指定しているため、このメッセージが表示されれば、表示されない。", "動作確認用のメッセージです。"]              , true]
                       , [true_case   , '経理', '経理', ["動作確認用のメッセージです。"] /*条件に一致しない場合のテスト*/                                              , true]
                       , [false_case  , '総務', ''    , ["stopにfalseを指定しているため、このメッセージが表示されても、必ず後続のメッセージが表示される", "動作確認用のメッセージです。"], false]
                       , [false_case  , '総務', '総務', ["stopにfalseを指定しているため、このメッセージが表示されても、必ず後続のメッセージが表示される", "動作確認用のメッセージです。"] , true]
                       , [false_case  , '経理', '経理', ["動作確認用のメッセージです。"] /*条件に一致しない場合のテスト*/                                               , true]
                       ];
    doTest();
    function doTest(no) {
      var caseNo = no || 0
        , testDef   = testTable[caseNo]
        , testcase  = testDef[0]
        , setval    = testDef[1]
        , expectval = testDef[2]
        , messages  = testDef[3]
        , ok_or_cancel = testDef[4]
        , caseMsg   = testcase.testcase
        , $node     = testcase.area.find('select')
        , results   = mockConfirm(ok_or_cancel)
        , callcount = messages.length;

      equal($node.size(), 1, "要素数の確認。");
      $node.val(setval);
      doChange($node);
      delay(function() {
        equal(results.length, callcount, caseMsg + " [呼び出し回数の確認]");
        for (var i = 0; callcount > i; i++) {
          equal(results[i].param, messages[i], caseMsg + " [メッセージの確認]");
        }
        equal($node.val(), expectval, caseMsg + " [値の確認]");
        $node.val(''); // 値の復元。
        doChange($node);
        delay(function(){
          if(testTable.length > caseNo + 1) {
            doTest(caseNo + 1);
          }
        });
      });
    }

      function a(testcase, setval, expectval, messagelist, ok_or_cancel) {
          var caseMsg = testcase.testcase
            , $node  = testcase.area.find('select')
            , preval = $node.val()
            , callcount = messagelist.length
            , results = mockConfirm(ok_or_cancel);

          equal($node.size(), 1, "要素数の確認。");
          $node.val(setval);
          doChange($node);
          equal(results.length, callcount, caseMsg + " [呼び出し回数の確認]");
          for (var i = 0; callcount > i; i++) {
            equal(results[i].param, messagelist[i], caseMsg + " [メッセージの確認]");
          }
          equal($node.val(), expectval, caseMsg + " [値の確認]");

          $node.val(preval); // 値の復元。
          doChange($node);
      };

  }

  function revert属性のテスト(){
    var testcases = test_for('revert')
      , default_case = testcases[0]
      , true_case    = testcases[1]
      , false_case   = testcases[2]
      , testTable    = [ [default_case, "nablarch", ""        , ["revertがデフォルトなので、ダイアログ表示後にキャンセルすれば、データが戻る"], false]
                       , [default_case, "nablarch", "nablarch", ["revertがデフォルトなので、ダイアログ表示後にキャンセルすれば、データが戻る"], true]
                       , [default_case, "nab"     , "nab"     , [/* 確認が出なければそのまま。*/]                               , false]
                       , [true_case,    "nablarch", ""        , ["revertがtrueなので、ダイアログ表示後、キャンセルすれば、データが戻る"]   , false]
                       , [true_case,    "nablarch", "nablarch", ["revertがtrueなので、ダイアログ表示後、キャンセルすれば、データが戻る"]   , true]
                       , [true_case,    "nab"     , "nab"     , [/* 確認が出なければそのまま。*/]                               , false]
                       , [false_case,   "nablarch", "nablarch", ["revertがfalseなので、ダイアログ表示後、キャンセルしてもデータが戻らない"] , false]
                       , [false_case,   "ssd"     , "ssd"     , ["revertがfalseなので、ダイアログ表示後、キャンセルしてもデータが戻らない"] , true]
                       , [false_case,   "nab"     , "nab"     , [/* 確認が出なければそのまま。*/]                               , false]
                       ];
    doTest();
    function doTest(no) {
      var caseNo    = no || 0
        , testDef   = testTable[caseNo]
        , testcase  = testDef[0]
        , setval    = testDef[1]
        , expectval = testDef[2]
        , messages  = testDef[3]
        , ok_or_cancel = testDef[4]
        , caseMsg   = testcase.testcase
        , $node     = testcase.area.find('input')
        , results   = mockConfirm(ok_or_cancel)
        , callcount = messages.length;
      equal($node.size(), 1, "要素数の確認。");
      $node.val(setval);
      doChange($node);
      delay(function(){
        equal(results.length, callcount, caseMsg + "[呼び出し回数の確認]");
        for (var i =0; callcount > i; i++) {
          equal(results[i].param, messages[i], caseMsg + " [メッセージの確認]");
        }
        equal($node.val(), expectval, caseMsg + " [値の確認]");
        if(testTable.length > caseNo + 1) {
          doTest(caseNo + 1);
        }
      });
    }
  }

  /**
   * window.confirmをデフォルトに戻す。
   */
  function restore() {
    setTimeout(function(){
      window.confirm = _confirm ? _confirm : window.confirm;
    }, 2000);
    ok(true, 'restore ready!');
  }

  /**
   * テストを中断してしまうwindow.confirmをモックに差し替え、呼び出し状況を記録する。
   */
  function mockConfirm(ret) {
    var results = [];
    window.confirm = function(message) {
      results.add({called : true, param : message});
      return ret;
    };
    return results;
  }

  function delay(fn, delayTime) {
    var time = delayTime || 10;
    QUnit.stop();
    setTimeout(function() {
      fn();
      QUnit.start();
    }, time);
  }

  function test_for(caseid) {
    var $cases = $all_nodes.filter('span.test-case.' + caseid);
    return $cases.map(function() {
      var $e = $(this)
       ,  idx = $all_nodes.index($e);
      return {
         testcase : $.trim($e.text()),
         area     : $($all_nodes[idx + 1]),
      };
    });
  }
  function doChange($node) {
    $node.change();
  }

});

