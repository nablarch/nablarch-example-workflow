runTest(
  required属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , id属性のテスト
  , cssClass属性のテスト
  , sample属性のテスト
);

var $all_nodes
  , field_count = 2; // 内線は2フィールド

function setup() {
  $all_nodes = $('span.test-case, div.field, div.fielderror, div.note');
}

function required属性のテスト() {
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
    ,  false_case   = cases[2]
    ,  true_case    = cases[3]
    ,  assertText   = function (testcase, value) {
      var text = $.trim(testcase.area.text());
      ok(text.endsWith(value), testcase.testcase + " text=>[" + text + "]");
    }
    , assertValues = function(testcase, values) {
      return function(i, e) { equal($(e).val(), values[i], testcase.testcase + " value[" + i + "]");};
    }
    , assertNotReadOnly = function(testcase, values) {
      var $input = testcase.area.find('input:text');
      equal($input.size(), field_count, testcase.testcase + "[input size is 2]");
      equal($input.filter(':disabled').size(), 0, testcase.testcase + " [disabled] ");
      equal($input.filter('.nablarch_readonly').size(), 0, testcase.testcase + " [readonly] ");
      $input.each(assertValues(testcase, values));
    }
    , assertReadOnly    = function(testcase, values) {
      var $input = testcase.area.find('input:text');
      equal($input.size(), field_count, testcase.testcase + "[input size is 2]");
      equal($input.filter(':disabled').size(), field_count, testcase.testcase + " [disabled] ");
      equal($input.filter('.nablarch_readonly').size(), field_count, testcase.testcase + " [readonly] ");
      $input.each(assertValues(testcase, values));
    }
    , values = {
      defaults : ['01', '1111'],
      blanks   : ['02', '2222'],
      falses   : ['03', '3333'],
      trues    : ['04', '4444']
    };
  // 確認画面はラベルの確認
  if (isConfirmationPage()) {
    assertText(default_case, values.defaults.join(' - '));
    assertText(blank_case, values.blanks.join(' - '));
    assertText(false_case, values.falses.join(' - '));
    assertText(true_case, values.trues.join(' - '));
  } else {
    assertNotReadOnly(default_case, values.defaults);
    assertNotReadOnly(blank_case, values.blanks);
    assertNotReadOnly(false_case, values.falses);
    assertReadOnly(true_case, values.trues);
  }
}

function disabled属性のテスト() {
  setup();
  var cases = test_for('disabled-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  false_case   = cases[2]
    ,  true_case    = cases[3]
    ,  assertText   = function (testcase, value) {
      var text = testcase.area.text().compact();
      ok(text.endsWith(value), testcase.testcase + " text=>[" + text + "]");
    }
    , assertValues = function(testcase, values) {
      return function(i, e) { equal($(e).val(), values[i], testcase.testcase + " value[" + i + "]");};
    }
    ,  assertDisabled = function(testcase, values) {
      var $input = testcase.area.find('input:text');
      equal($input.size(), field_count, testcase.testcase + "[input size]");
      equal($input.filter(':disabled').size(), field_count, testcase.testcase +  " [disabled] ");
      $input.each(assertValues(testcase, values));
    }
    ,  assertNotDisabled = function(testcase, values) {
      var $input = testcase.area.find('input:text');
      equal($input.size(), field_count, testcase.testcase + "[input size]");
      equal($input.filter(':disabled').size(), 0, testcase.testcase +  " [disabled] ");
      $input.each(assertValues(testcase, values));
    }
    , values = {
      defaults : ['12', '1234'],
      blanks   : ['99', '9999'],
      falses   : ['88', '8888'],
      trues    : ['11', '2222']
    };

  if (isConfirmationPage()) {
    assertText(default_case, values.defaults.join(' - '));
    assertText(blank_case, values.blanks.join(' - '));
    assertText(false_case, values.falses.join(' - '));
    assertText(true_case, 'disabled[true] ：');// ラベルのみで終わるはずなのでlabelを期待値に入れる
  } else {
    assertNotDisabled(default_case, values.defaults);
    assertNotDisabled(blank_case, values.blanks);
    assertNotDisabled(false_case, values.falses);
    assertDisabled(true_case, values.trues);
  }

}

function id属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('id-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assertIds    = function(testcase, values) {
      return function(i, e) {
        equal($(e).attr('id'), values[i], testcase.testcase);
      };
    }
    , assertNotIds = function(testcase, values) {
      return function(i, e) {
        notEqual($(e).attr('id'), values[i], testcase.testcase);
      };
    }
    , names = function($input) {return $input.map(function(){return $(this).attr('name');});};

  var default_inputs = default_case.area.find('input:text');
  default_inputs.each(assertIds(default_case, names(default_inputs)));

  var blank_inputs = blank_case.area.find('input:text');
  blank_inputs.each(assertIds(blank_case, names(blank_inputs)));

  var set_inputs = set_case.area.find('input:text');
  set_inputs.each(assertNotIds(set_case, names(set_inputs)));
  set_inputs.each(assertIds(set_case, ['test-id-bldg', 'test-id-personal']));
}

function cssClass属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  equal(default_case.area.find('input:text.border-blue').size(), 0, default_case.testcase);
  equal(blank_case.area.find('input:text.border-blue').size(), 0, blank_case.testcase);
  equal(set_case.area.find('input:text.border-blue').size(), field_count, set_case.testcase);
}

function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assert       = function(testcase) {
      if (isConfirmationPage()) {
        var text = $.trim(testcase.area.find('div.field').text());
        equal(text, "", testcase.testcase);
      } else {
        var size = testcase.area.find('input:text').each(function(e,i) {
          equal($(this).val(), "", testcase.testcase);
        }).size();
        equal(size, 2, testcase.testcase + " [size]");
      }
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
}


function nameAlias属性のテスト() {
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('nameAlias-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assertHighLight = function(i, testcase) {
      equal(testcase.area.find('input:text.nablarch_error').size(), 2, testcase.testcase);
    }
    , assertEachErrMsg = function(testcase) {
      equal(testcase.error.find('div.nablarch_error').size(), 2, testcase.testcase);
    }
    , assertSingleErrMsg = function(testcase) {
      equal(testcase.error.find('div.nablarch_error').size(), 1, testcase.testcase);
    };

  $.each(cases, assertHighLight);
  assertEachErrMsg(default_case);
  assertEachErrMsg(blank_case);
  assertSingleErrMsg(set_case);
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
