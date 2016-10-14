runTest(
  require属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , id属性のテスト
  , cssClass属性のテスト
  , sample属性のテスト
  , withNoneOption属性のテスト
  , multiple属性のテスト
  , size属性のテスト
  , タイトルサイズと入力部サイズのテスト
  , pattern属性のテスト
  , optionColumnName属性のテスト
  , labelPattern属性のテスト
);

var $all_nodes
  , values = ["value1-1", "value1-2", "value1-3"]
  , labels = ["name1-1", "name1-2", "name1-3"];

function setup() {
  $all_nodes = $('span.test-case, div.field.pulldown, div.fielderror, div.note');
}

function require属性のテスト() {
  setup();
  var cases = test_for('required-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , false_case = cases[2]
    , true_case = cases[3]
    , required = 'span.required'
    , assertHas = function (testcase) {
      if (isConfirmationPage()) {
        assertNotHas(testcase);
      } else {
        equal(testcase.area.find(required).size(), 1, testcase.testcase);
        equal($.trim(testcase.area.find(required).text()), '*', testcase.testcase);
      }
    }
    , assertNotHas = function (testcase) {
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
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_hint_case = cases[2]
    , assertHasHint = function (testcase) {
      isConfirmationPage() ? equal(testcase.hint.size(), 0, testcase.testcase)
        : equal(testcase.hint.size(), 1, testcase.testcase);
    }
    , assertHasNotHint = function (testcase) {
      equal(testcase.hint.size(), 0, testcase.testcase);
    };

  assertHasNotHint(default_case);
  assertHasNotHint(blank_case);
  assertHasHint(set_hint_case);
}

function readonly属性のテスト() {
  setup();
  var cases = test_for('readonly-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , true_case = cases[2]
    , false_case = cases[3]
    , assertText = function (testcase, label) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, label, testcase.testcase);
    }
    , assertValues = function (testcase, values) {
      return function (i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      };
    }
    , assertReadOnly = function (testcase, values) {
      var $input = testcase.area.find('select');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function () {
          ok($(this).prop('disabled'), testcase.testcase + "[prop disabled]");
          ok($(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
        });
    }
    , assertNotReadOnly = function (testcase, values) {
      var $input = testcase.area.find('select');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      $input.each(function () {
        ok(!$(this).prop('disabled'), testcase.testcase + "[prop disabled]");
        ok(!$(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
      })
        .find('option').each(assertValues(testcase, values));
    };

  if (isConfirmationPage()) {
    assertText(default_case, "name1-1");
    assertText(blank_case, "name1-1");
    assertText(true_case, "name1-1");
    assertText(false_case, "name1-1");
  } else {
    assertNotReadOnly(default_case, values);
    assertNotReadOnly(blank_case, values);
    assertReadOnly(true_case, values);
    assertNotReadOnly(false_case, values);
  }
}

function disabled属性のテスト() {
  setup();
  var cases = test_for('disabled-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , true_case = cases[2]
    , false_case = cases[3]
    , assertText = function (testcase, label) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, label, testcase.testcase);
    }
    , assertValues = function (testcase, values) {
      return function (i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      };
    }
    , assertDisabled = function (testcase, values) {
      var $input = testcase.area.find('select');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      $input.each(function () {
        ok($(this).prop('disabled'), testcase.testcase + "[prop disabled]");
      })
        .find('option').each(assertValues(testcase, values));
    }
    , assertNotDisabled = function (testcase, values) {
      var $input = testcase.area.find('select');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      $input.each(function () {
        ok(!$(this).prop('disabled'), testcase.testcase + "[prop disabled]");
      })
        .find('option').each(assertValues(testcase, values));
    };

  if (isConfirmationPage()) {
    assertText(default_case, "name1-2");
    assertText(blank_case, "name1-3");
    assertText(true_case, "");
    assertText(false_case, "name1-2");
  } else {
    assertNotDisabled(default_case, values);
    assertNotDisabled(blank_case, values);
    assertDisabled(true_case, values);
    assertNotDisabled(false_case, values);
  }
}

function id属性のテスト() {
  if (isConfirmationPage()) {
    return ok(true, "確認画面ではテスト無し");
  }

  setup();
  var cases = test_for('id-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2];

  var default_input = default_case.area.find('select');
  equal(default_input.attr('id'), default_input.attr('name'), default_case.testcase);

  var blank_input = blank_case.area.find('select');
  equal(blank_input.attr('id'), blank_input.attr('name'), blank_case.testcase);

  var set_input = set_case.area.find('select');
  notEqual(set_input.attr('id'), set_input.attr('name'), set_case.testcase);
  equal(set_input.attr('id'), 'test-id', set_case.testcase);
}


function cssClass属性のテスト() {
  if (isConfirmationPage()) {
    return ok(true, "確認画面ではテスト無し");
  }

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2];

  equal(default_case.area.find('select').size(), 1, default_case.testcase);
  equal(default_case.area.find('select.cssClass-test').size(), 0, default_case.testcase);

  equal(blank_case.area.find('select').size(), 1, blank_case.testcase);
  equal(blank_case.area.find('select.cssClass-test').size(), 0, blank_case.testcase);

  equal(set_case.area.find('select.cssClass-test').size(), 1, set_case.testcase);
}

function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2]
    , assertText = function (testcase) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, "name1-1", testcase.testcase);
    }
    , assert = function (testcase) {
      if (isConfirmationPage()) {
        return assertText(testcase);
      }
      var $nodes = testcase.area.find('div.field-content').find('option');
      $nodes.each(function (i, e) {
        equal($(this).val(), values[i], testcase.testcase);
        equal($(this).text(), labels[i], testcase.testcase);
      });
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
}

function withNoneOption属性のテスト() {
  if (isConfirmationPage()) {
    return ok(true, "確認画面では実施しない");
  }
  setup();
  var cases = test_for('withNoneOption-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , true_case = cases[2]
    , false_case = cases[3]
    , assertOptions = function (testcase, options) {
      var $input = testcase.area.find('select')
        , assert = function (i, e) {
          equal($(this).val(), options[i], testcase.testcase);
        };
      $input.find('option').each(assert);
    };

  assertOptions(default_case, values);
  assertOptions(blank_case, values);
  assertOptions(true_case, [""].union(values));
  assertOptions(false_case, values);
}

function size属性のテスト() {
  if (isConfirmationPage()) {
    return ok(true, "確認画面では検証しない");
  }
  setup();
  var cases = test_for('size-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2]
    , assert = function (testcase, size) {
      equal(testcase.area.find('select').attr('size'), size, testcase.testcase);
    };

  assert(default_case, 0);
  assert(blank_case, 0);
  assert(set_case, 5);
}

function multiple属性のテスト() {
  if (isConfirmationPage()) {
    return ok(true, "確認画面では実施しない");
  }
  setup();
  var cases = test_for('multiple-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , false_case = cases[2]
    , true_case = cases[3]
    , assertMultiple = function (testcase) {
      ok(testcase.area.find('select').attr('multiple'), testcase.testcase);
    }
    , assertNotMultiple = function (testcase) {
      ok(!testcase.area.find('select').attr('multiple'), testcase.testcase);
    };

  assertNotMultiple(default_case);
  assertNotMultiple(blank_case);
  assertNotMultiple(false_case);
  assertMultiple(true_case);
}

function タイトルサイズと入力部サイズのテスト() {
  setup();
  var cases = test_for('title-input-size'),
    assertNotSizeClass = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(!label.attr('class').has('grid-col'), testCase.testcase);
      ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase);
    },
    assertSize = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(label.hasClass('grid-col-8'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-20'), testCase.testcase);
    };

  assertNotSizeClass(cases[0]);     // size属性未指定
  assertNotSizeClass(cases[1]);     // size属性ブランク指定
  assertSize(cases[2]);             // size属性を指定
}

/**
 * pattern属性のテスト
 */
function pattern属性のテスト() {
  var pattern1 = [
      {label: 'name1-1', value: 'value1-1'},
      {label: 'name1-2', value: 'value1-2'},
      {label: 'name1-3', value: 'value1-3'}
    ]
    , pattern2 = [
      {label: 'name1-2', value: 'value1-2'}
    ]
    , assert = function (testCase, expected, confirmExpected) {
      var target = findTest(testCase)
        , $options = target.input.find('select > option');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), confirmExpected, 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $option = $($options[index])
            , label = $option.text().trim();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($option.val(), code.value, target.testCase + ': value属性が正しいこと');
        });
      }
    };

  assert('pattern-none', pattern1, 'name1-1');
  assert('pattern-blank', pattern1, 'name1-1');
  assert('pattern-not-blank', pattern2, 'name1-2');
}

/**
 * optionColumnName属性のテスト
 */
function optionColumnName属性のテスト() {
  var defaultOption = [
      {label: 'name1-1 column:OPTION01', value: 'value1-1'},
      {label: 'name1-2 column:OPTION01', value: 'value1-2'},
      {label: 'name1-3 column:OPTION01', value: 'value1-3'}
    ]
    , specifiedOption = [
      {label: 'name1-1 column:OPTION03', value: 'value1-1'},
      {label: 'name1-2 column:OPTION03', value: 'value1-2'},
      {label: 'name1-3 column:OPTION03', value: 'value1-3'}
    ]
    , assert = function (testCase, expected, confirmExpected) {
      var target = findTest(testCase)
        , $options = target.input.find('select > option');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), confirmExpected, 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $option = $($options[index])
            , label = $option.text().compact();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($option.val(), code.value, target.testCase + ': value属性が正しいこと');
        });

      }
    }
    ;

  assert('option-none', defaultOption, 'name1-2 column:OPTION01');
  assert('option-blank', defaultOption, 'name1-3 column:OPTION01');
  assert('option-not-blank', specifiedOption, 'name1-1 column:OPTION03');
}

/**
 * labelPattern属性のテスト
 */
function labelPattern属性のテスト() {
  var defaultLabel = [
      {label: 'name1-1', value: 'value1-1'},
      {label: 'name1-2', value: 'value1-2'},
      {label: 'name1-3', value: 'value1-3'}
    ]
    , specifiedPattern = [
      {label: 'name1-1 - short:name1-1 - name1-1 column:OPTION03 - value1-1', value: 'value1-1'},
      {label: 'name1-2 - short:name1-2 - name1-2 column:OPTION03 - value1-2', value: 'value1-2'},
      {label: 'name1-3 - short:name1-3 - name1-3 column:OPTION03 - value1-3', value: 'value1-3'}
    ]
    , assert = function (testCase, expected, confirmExpected) {
      var target = findTest(testCase)
        , $options = target.input.find('select > option');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), confirmExpected, 'divのボディ部に入力値が表示されていること');
      } else {
        expected.each(function (code, index) {
          var $option = $($options[index])
            , label = $option.text().compact();

          equal(label, code.label, target.testCase + ': ラベル表示が正しいこと');
          equal($option.val(), code.value, target.testCase + ': value属性が正しいこと');
        });
      }
    };

  assert('labelPattern-none', defaultLabel, 'name1-2');
  assert('labelPattern-blank', defaultLabel, 'name1-3');
  assert('labelPattern-not-blank', specifiedPattern, 'name1-1 - short:name1-1 - name1-1 column:OPTION03 - value1-1');
}


/**
 * 単行テキストのwidgetから出力されたテストケースの情報を取得する。
 * @param case_id テストケースのID
 * @returns テストケース内に定義された確認ボタン
 */
function test_for(case_id) {
  var $cases = $all_nodes.filter('span.test-case.' + case_id);
  return $cases.map(function () {
    var $e = $(this)
      , idx = $all_nodes.index($e)
      , $area = $($all_nodes[idx + 1])
      , $options = $all_nodes.filter(':eq(' + (idx + 2) + '), :eq(' + (idx + 3) + ')')
      , error = $options.filter('div.fielderror')
      , note = $options.filter('div.note');
    return {
      testcase: $.trim($e.text()),
      area    : $area,
      error   : error,
      hint    : note
    };
  });
}

  function findTest(testCase) {
    var $test = $('span.test-case.' + testCase)
      , $text_div = $test.next('.field.pulldown');

    return {
      testCase: $test.text(),
      label: $text_div.find('label'),
      input: $text_div.find('div.field-content'),
      error: $text_div.find('div.fielderror')
    }
  }
