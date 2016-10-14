require(['jquery'],
function($){
  var _alert = window.alert
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
      , samples = ['nablarch' , 'ssd', 'data', '', '  '] //いずれでも動作すること。
      , firstval = $node.val()
      , results = {};

    equal($node.size(), 1, testcase.testcase + " 要素数が異なる(事前条件の確認)");
    doTest(samples.first(), 0);

    // setTimeoutを利用する機能に対してテストするため、再起呼び出しでシーケンシャルに処理する。
    function doTest(sample, i) {
      results = mockAlert();
      $node.val(sample);
      // 変更イベントをトリガーする。
      doChange($node);
      delay(function(){
        var testInfo = [' input is', sample].join(" ");
        equal($node.val(), firstval, caseMsg + testInfo + " 復元の確認。");
        equal(results.length, 1 , caseMsg + testInfo + " 呼び出し回数の確認。");
        if (samples.length > i+1) {
          doTest(samples.at(i+1), i+1);
        }
      });
    }
  }

  function 条件指定のテスト() {
    var testcase = test_for("conditional")[0]
      , caseMsg  = testcase.testcase
      , $node   = testcase.area.find('input')
      , init = $node.val()
      , results
      , testTable = {
              input     : ['nablarch', 'ssd', ' ', '', 'match']
            , callcount : [ 1        , 0    , 0  , 0 , 0]
            , afterVal  : [init      , 'ssd', ' ', '', 'match']
        };

    equal($node.size(), 1, testcase.testcase + " 要素数が異なる(事前条件の確認)");
    // alertが呼ばれる条件を設定

    doTest();
    function doTest(no) {
      var caseNo = no || 0
        , input = testTable.input[caseNo]
        , afterVal = testTable.afterVal[caseNo]
        , count    = testTable.callcount[caseNo]
        , testInfo = ["input =[", input, "]"].join(" ");
      $node.val(testTable.input[caseNo]);
      results = mockAlert();
      doChange($node);
      delay(function(){
        equal(results.length, count, caseMsg + testInfo + " [呼び出し回数の確認]");
        equal($node.val(), afterVal, caseMsg + testInfo + " [復元状態の確認。]");
        if (testTable.input.length > caseNo + 1) {
          doTest(caseNo + 1);
        }
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

    results = mockAlert();
    // case 1 /////////////////////
    delay(function(){
      doChange($condition);
      equal(results.length, 0, caseMsg + " :条件が変更されても呼び出されない。");
      // case2 /////////////////////
      results = mockAlert();
      $trigger.val(firstval + ' modify');
      doChange($trigger);
      delay(function(){
        equal(results.length, 1, caseMsg + " :トリガーが変更されれば呼び出される。");
        equal($trigger.val(), firstval, caseMsg + ' :呼び出された場合はtriggerが戻る');
        // case3 /////////////////////
        // 表示されない条件の設定
        $condition.val('nablarch');
        results = mockAlert();
        doChange($condition);
        delay(function(){
          equal(results.length, 0, caseMsg + " :条件が変更されても呼び出されない。");

          // case4 /////////////////////
          results = mockAlert();
          doChange($trigger);
          delay(function(){
            equal(results.length, 0, caseMsg + " :トリガーが変更されても条件が一致しなければ呼び出されない。");
            // 打鍵用に戻す。
            $condition.val('');
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
      , testTable    = [ [default_case, '総務', ["stopを指定していないため、このメッセージが表示された場合、動作確認用のメッセージは表示されない"]]
                       , [default_case, '経理', ["動作確認用のメッセージです。"]]
                       , [true_case   , '総務', ["stopにtrueを指定しているため、このメッセージが表示されれば、動作確認メッセージは表示されない。"]]
                       , [true_case   , '経理', ["動作確認用のメッセージです。"]]
                       , [false_case  , '総務', ["stopにfalseを指定しているため、このメッセージが表示されても、必ず後続のメッセージが表示される", "動作確認用のメッセージです。"]]
                       , [false_case  , '経理', ["動作確認用のメッセージです。"]]
                     ];
    doTest();
    function doTest(no) {
      var caseNo   = no || 0
        , testDef  = testTable[caseNo]
        , testcase  = testDef[0]
        , setval    = testDef[1]
        , messages  = testDef[2]
        , $node     = testcase.area.find('select')
        , caseMsg   = testcase.testcase
        , results   = mockAlert()
        , callcount = messages.length;

      $node.val(setval);
      doChange($node);
      delay(function() {
        equal(results.length, callcount, caseMsg + " [呼び出し回数の確認。]");
        for (var i =0; callcount > i; i++) {
          equal(results[i].param, messages[i], caseMsg + " [メッセージの確認]");
        }
        if (testTable.length > caseNo + 1) {
          doTest(caseNo + 1);
        }
      });
    }
  }

  function revert属性のテスト() {
    var testcases = test_for('revert')
      , default_case = testcases[0]
      , true_case    = testcases[1]
      , false_case   = testcases[2]
      , testTable = [ [default_case, 'nablarch', 'no_revert', ["revertがデフォルトなので、ダイアログ表示後にデータが戻る"]]
                    , [default_case, 'sample1' , 'sample1'  , [/* alertがなければデータは変更される。*/]]
                    , [true_case,    'nablarch', 'no_revert', ["revertがtrueなので、ダイアログ表示後にデータが戻る"]]
                    , [true_case,    'sample2' , 'sample2'  , [/* alertがなければデータは変更される。*/]]
                    , [false_case,   'nablarch', 'nablarch' , ["revertがfalseなので、ダイアログ表示後にデータが戻らない"]]
                    , [false_case,   'sample3' , 'sample3'  , [/* alertがなければデータは変更される。*/]]];
    doTest();
    function doTest(no) {
      var caseNo = no || 0
        , testDef   = testTable[caseNo]
        , testcase  = testDef[0]
        , setval    = testDef[1]
        , expectval = testDef[2]
        , messages  = testDef[3]
        , $node     = testcase.area.find('input')
        , caseMsg   = testcase.testcase
        , results   = mockAlert()
        , callcount = messages.length;
      $node.val(setval);
      doChange($node);
      delay(function(){
        equal(results.length, callcount, caseMsg + " [呼び出し回数の確認。]");
        for (var i =0; callcount > i; i++) {
          equal(results[i].param, messages[i], caseMsg + " [メッセージの確認]");
        }
        equal($node.val(), expectval, caseMsg + " [値の確認]");
        if (testTable.length > caseNo + 1) {
          doTest(caseNo + 1);
        }
      });
    }
  }

  /**
   * window.alertをデフォルトに戻す。
   */
  function restore() {
    delay(function() {;
      window.alert = _alert ? _alert : window.alert;
      ok(true, 'restore done!');
    }, 100);
  }

  function delay(fn, delayTime) {
    var time = delayTime || 100;
    QUnit.stop();
    setTimeout(function() {
      fn();
      QUnit.start();
    }, time);
  }
  /**
   * テストを中断してしまうwindow.alertをモックに差し替え、呼び出し状況を記録する。
   */
  function mockAlert() {
    var results = [];
    window.alert = function(message) {
      results.add({called : true, param : message});
      return false;
    };
    return results;
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

