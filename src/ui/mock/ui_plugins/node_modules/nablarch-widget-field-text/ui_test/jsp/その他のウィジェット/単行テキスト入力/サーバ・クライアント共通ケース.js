runTest(
  require属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , id属性のテスト
  , cssClass属性のテスト
  , maxlength属性のテスト
  , example属性のテスト
  , valueFormat属性のテスト
  , sample属性のテスト
  , unit属性のテスト
  , titleSizeとinputSizeのテスト
);

var $all_nodes;

function setup() {
  $all_nodes = $('span.test-case, div.field.text, div.fielderror, div.note');
}

function require属性のテスト() {
  setup();
  var cases = test_for('required-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  false_case   = cases[2]
    ,  true_case    = cases[3]
    ,  required     = 'span.required'
    ,  assertHas    = function(testcase) {
      if(isConfirmationPage()) { assertNotHas(testcase);
      } else{
        equal(testcase.area.find(required).size(), 1, testcase.testcase);
        equal($.trim(testcase.area.find(required).text()), '*', testcase.testcase);
      }
    }
    , assertNotHas  = function(testcase) {
      equal(testcase.area.find(required).size(), 0, testcase.testcase);
    };

  assertNotHas(default_case);
  assertNotHas(blank_case);
  assertNotHas(false_case);
  assertHas(true_case);
}

function hint属性のテスト() {
  setup();
  var cases = test_for('hint-test')
    , default_case  = cases[0]
    , blank_case    = cases[1]
    , set_hint_case = cases[2]
    , assertHasHint = function(testcase) {
      isConfirmationPage() ? equal(testcase.hint.size(), 0, testcase.testcase)
        : equal(testcase.hint.size(), 1, testcase.testcase);
    }
    , assertHasNotHint = function(testcase) {
      equal(testcase.hint.size(), 0, testcase.testcase);
    };

  assertHasNotHint(default_case);
  assertHasNotHint(blank_case);
  assertHasHint(set_hint_case);
}

function readonly属性のテスト() {
  setup();
  var cases = test_for('readonly-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  true_case    = cases[2]
    ,  false_case   = cases[3]
    ,  assertText   = function (testcase, value) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, value, testcase.testcase);
    }
    ,  assertReadOnly = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase, value);}
      var $input = testcase.area.find('input:text');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok($input.prop('disabled'), testcase.testcase +  "[prop disabled]");
      ok($input.is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
    }
    ,  assertNotReadOnly = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase, value); }
      var $input = testcase.area.find('input:text');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok(!$input.prop('disabled'), testcase.testcase +  "[prop disabled]");
      ok(!$input.is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
    };

  assertNotReadOnly(default_case, "readonly属性指定なし");
  assertNotReadOnly(blank_case, "readonly属性に空");
  assertReadOnly(true_case, "編集不可");
  assertNotReadOnly(false_case, "編集可能");
}

function disabled属性のテスト() {
  setup();
  var cases = test_for('disabled-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  true_case    = cases[2]
    ,  false_case   = cases[3]
    ,  assertText   = function (testcase, value) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, value, testcase.testcase);
    }
    ,  assertDisabled = function(testcase, value) {
      if(isConfirmationPage()) { return  assertText(testcase, ""); }// 確認画面では表示無し
      var $input = testcase.area.find('input:text');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok($input.prop('disabled'), testcase.testcase +  "[prop disabled]");
    }
    ,  assertNotDisabled = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase, value); }
      var $input = testcase.area.find('input:text');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok(!$input.prop('disabled'), testcase.testcase +  "[prop disabled]");
    };

  assertNotDisabled(default_case, "disabled属性指定なし");
  assertNotDisabled(blank_case, "disabled属性に空");
  assertDisabled(true_case, "サーバに値が送信されない");
  assertNotDisabled(false_case, "サーバに値が送信される");
}

function id属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('id-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  var default_input = default_case.area.find('input:text');
  equal(default_input.attr('id'), default_input.attr('name'), default_case.testcase);

  var blank_input = blank_case.area.find('input:text');
  equal(blank_input.attr('id'), blank_input.attr('name'), blank_case.testcase);

  var set_input = set_case.area.find('input:text');
  notEqual(set_input.attr('id'), set_input.attr('name'), set_case.testcase);
  equal(set_input.attr('id'), 'test-id', set_case.testcase);
}

function cssClass属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  ok(!default_case.area.find('input:text').is('.cssClass-test'), default_case.testcase);
  ok(!blank_case.area.find('input:text').is('.cssClass-test'), blank_case.testcase);
  ok(set_case.area.find('input:text').is('.cssClass-test'), set_case.testcase);
}

function maxlength属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('maxlength-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  ok(!default_case.area.find('input:text').attr('maxlength'), default_case.testcase);
  ok(!blank_case.area.find('input:text').attr('maxlength'), blank_case.testcase);
  ok(set_case.area.find('input:text').attr('maxlength'), set_case.testcase);
  equal(set_case.area.find('input:text').attr('maxlength'), 5, set_case.testcase);
}

function example属性のテスト() {
  setup();
  var cases = test_for('example-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    ,  assertText   = function (testcase) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, "", testcase.testcase);
    }
    , assertHasPlaceholder = function assertExample(testcase, placeholder) {
      if(isConfirmationPage()) {return assertText(testcase);}
      var $input = testcase.area.find('input:text');
      equal($input.val(), "", testcase.testcase + "[val()]");
      equal($input.attr('placeholder'), placeholder, testcase.testcase);
    }
    , assertNotHasPlaceholder = function(testcase) {
      if(isConfirmationPage()) {return assertText(testcase);}
      var $input = testcase.area.find('input:text');
      equal($input.val(), "", testcase.testcase + "[val()]");
      ok(!$input.attr('placeholder'), testcase.testcase);
    };

  assertNotHasPlaceholder(default_case);
  assertNotHasPlaceholder(blank_case);
  assertHasPlaceholder(set_case, "サンプル");

}
function valueFormat属性のテスト() {
  setup();
  var cases = test_for('valueFormat-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assertText   = function (testcase, value) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, value, testcase.testcase);
    }
    , assertValue = function (testcase, value) {
      if (isConfirmationPage()) {return assertText(testcase, value);}
      equal(testcase.area.find('input:text').val(), value, testcase.testcase);
    };

  assertValue(default_case, "20131007");
  assertValue(blank_case, "20131007");
  assertValue(set_case, "2013年10月07日");

}
function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assert       = function(testcase) {
      if (isConfirmationPage()) {
        var text = $.trim(testcase.area.find('div.field-content').text());
        equal(text, "", testcase.testcase);
      } else {
        equal(testcase.area.find('input:text').val(), "", testcase.testcase);
      }
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
}

function unit属性のテスト() {
  setup();
  var cases = test_for('unit-test')
    , assertUnitNothing = function (testCase) {
      ok(!testCase.area.find('span.unit').is('*'), testCase.testcase);
    }
    , assert = function (testCase, expected) {
      equal($.trim(testCase.area.find('span.unit').html()), expected, testCase.testcase);
    }
    , assertValueEmpty = function (testCase, expected) {
      if (isConfirmationPage()) {
        ok(!testCase.area.find('span.unit').is('*'), expected, testCase.testcase);
      } else {
        equal($.trim(testCase.area.find('span.unit').html()), expected, testCase.testcase);
      }
    };

  assertUnitNothing(cases[0]);    // unit属性未指定
  assertUnitNothing(cases[1]);    // unit属性ブランク
  assert(cases[2], '円');         // unit指定(円)
  assert(cases[3], '千円');       // unit指定(千円)
  assert(cases[4], '万円');       // unit指定(万円)
  assert(cases[5], '百万円');     // unit指定(百万円)
  assertValueEmpty(cases[6], '万円'); // 値がブランク（確認画面では単位が出力されない）
}

function titleSizeとinputSizeのテスト() {
  setup();

  var cases = test_for('size-test'),
    assertSizeNone = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(!label.attr('class').has('grid-col'), testCase.testcase + '：タイトル部(label)にgrid-col系クラスが設定されていないこと');
      ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase + '：入力部(fieldContent)にgrid-col系クラスが設定されていないこと');
    },
    assertSize = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(label.hasClass('grid-col-13'), testCase.testcase + '：タイトル部(label)に指定したサイズ - 2のグリッド数が指定されること');
      ok(fieldContent.hasClass('grid-col-20'), testCase.testcase + '：入力部(div.field-content)に指定したサイズのグリッド数が指定されること');
    }
    ;

  assertSizeNone(cases[0]);     // size未指定
  assertSizeNone(cases[1]);     // sizeブランク
  assertSize(cases[2]);         // size指定
}


/**
 * 単行テキストのwidgetから出力されたテストケースの情報を取得する。
 * @param case_id テストケースのID
 * @returns テストケース内に定義された確認ボタン
 */
function test_for(case_id) {
  var $cases = $all_nodes.filter('span.test-case.' + case_id);
  return $cases.map(function() {
    var $e = $(this)
      ,  idx   = $all_nodes.index($e)
      ,  $area = $($all_nodes[idx + 1])
      ,  $options = $all_nodes.filter(':eq(' + (idx + 2) + '), :eq(' + (idx + 3) + ')')
      ,  error    = $options.filter('div.fielderror')
      ,  note     = $options.filter('div.note');
    return {
      testcase : $.trim($e.text()),
      area     : $area,
      error    : error,
      hint     : note
    };
  });
}

