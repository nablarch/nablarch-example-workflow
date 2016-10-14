runTest(
  require属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , cssClass属性のテスト
  , listFormat属性のテスト
  , sample属性のテスト
  , size属性のテスト
);

var $all_nodes;

function setup() {
  $all_nodes = $('span.test-case, div.field.radios, div.fielderror, div.note');
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
    , assertText = function (testcase, values) {
      var text = $.trim(testcase.area.find('div.field-content').text())
        , datalist = text.split(/\s/);
      $.each(datalist, function (i, e) {
        equal(e, values[i], testcase.testcase);
      });
    }
    , assertValues = function (testcase, values) {
      return function (i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      };
    }
    , assertReadOnly = function (testcase, values) {
      var $input = testcase.area.find('input:radio');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function () {
          ok($(this).prop('disabled'), testcase.testcase + "[prop disabled]");
          ok($(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
        });
    }
    , assertNotReadOnly = function (testcase, values) {
      var $input = testcase.area.find('input:radio');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function () {
          ok(!$(this).prop('disabled'), testcase.testcase + "[prop disabled]");
          ok(!$(this).is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
        });
    }
    , values = ["値1", "値2", "値3"]
    , labels = ["ラベル1", "ラベル2", "ラベル3"];

  if (isConfirmationPage()) {
    assertText(default_case, labels);
    assertText(blank_case, labels);
    assertText(true_case, labels);
    assertText(false_case, labels);
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
      var $input = testcase.area.find('input:radio');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function () {
          ok($(this).prop('disabled'), testcase.testcase + "[prop disabled]");
        });
    }
    , assertNotDisabled = function (testcase, values) {
      var $input = testcase.area.find('input:radio');
      equal($input.size(), 3, testcase.testcase + "[input size]");
      $input.each(assertValues(testcase, values))
        .each(function () {
          ok(!$(this).prop('disabled'), testcase.testcase + "[prop disabled]");
        });
    }
    , values = ["値1", "値2", "値3"];

  if (isConfirmationPage()) {
    assertText(default_case, "ラベル2");
    assertText(blank_case, "ラベル3");
    assertText(true_case, "");
    assertText(false_case, "ラベル1");
  } else {
    assertNotDisabled(default_case, values);
    assertNotDisabled(blank_case, values);
    assertDisabled(true_case, values);
    assertNotDisabled(false_case, values);
  }
}

function cssClass属性のテスト() {
  // 入力画面のみ検証
  if (isConfirmationPage()) {
    return ok(true, "確認画面ではテスト無し");
  }

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2];

  equal(default_case.area.find('input:radio').size(), 3, default_case.testcase);
  equal(default_case.area.find('input:radio.cssClass-test').size(), 0, default_case.testcase);

  equal(blank_case.area.find('input:radio').size(), 3, blank_case.testcase);
  equal(blank_case.area.find('input:radio.cssClass-test').size(), 0, blank_case.testcase);

  equal(set_case.area.find('input:radio.cssClass-test').size(), 3, set_case.testcase);
}

function listFormat属性のテスト() {

  setup();
  var cases = test_for('listFormat-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , br_case = cases[2]
    , div_case = cases[3]
    , span_case = cases[4]
    , ul_case = cases[5]
    , ol_case = cases[6]
    , sp_case = cases[7]
    , values = ["値1", "値2", "値3"]
    , labels = ["ラベル1", "ラベル2", "ラベル3"]
    , assertValuesFormat = function (testcase, formatSpec, values) { // 入力画面ではformat内にcheckboxがあることで検証
      var $input = testcase.area.find('div.field-content').find(formatSpec).find('input:radio');
      equal($input.size(), values.length, testcase.testcase + " formatspec = " + formatSpec);
      $input.each(function (i, e) {
        equal($(this).val(), values[i], testcase.testcase);
      });
    }
    , assertLabelFormat = function (testcase, formatSpec, label) { //確認画面ではformatの中にlabelのテキストがあることで検証する。
      var $label = testcase.area.find('div.field-content').find(formatSpec)
        , text = $.trim($label.text());
      equal($label.size(), 1, testcase.testcase);
      equal(text, label, testcase.testcase);
    }
    , assertTextFormat = function (testcase, formatSpec, labels) {
      var fieldInput = testcase.area.find('div.field-content').clone()
        , nodes;

      fieldInput.find('div.fielderror').remove();
      nodes = fieldInput.html().trim().toLocaleLowerCase().split(formatSpec).remove("");

      equal(nodes.length, labels.length, testcase.testcase);
      $.each(nodes, function (i, htmltext) {
        ok(htmltext.match('^\\s*<input.+<\/label>\\s*$'), testcase.testcase);
      });
    }
    , assertText = function (testcase, label) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, label, testcase.testcase);
    };

  if (isConfirmationPage()) {
    assertLabelFormat(default_case, "span", "ラベル2");
    assertLabelFormat(blank_case, "span", "ラベル1");
    assertText(br_case, "ラベル3");
    assertLabelFormat(div_case, "div", "ラベル3");
    assertLabelFormat(span_case, "span", "ラベル3");
    assertLabelFormat(ul_case, "ul > li", "ラベル3");
    assertLabelFormat(ol_case, "ol > li", "ラベル3");
    assertText(sp_case, "ラベル3");
  } else {
    assertValuesFormat(default_case, "span", values);
    assertValuesFormat(blank_case, "span", values);
    assertTextFormat(br_case, "<br>", labels);
    assertValuesFormat(div_case, "div", values);
    assertValuesFormat(span_case, "span", values);
    assertValuesFormat(ul_case, "ul > li", values);
    assertValuesFormat(ol_case, "ol > li", values);
    assertTextFormat(sp_case, "&nbsp;", labels);
  }

}

function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case = cases[1]
    , set_case = cases[2]
    , assert = function (testcase) {
      var text = testcase.area.find('div.field-content').text();
      ok(text.isBlank(), testcase.testcase);
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
}

function size属性のテスト() {
  setup();

  var cases = test_for('size-test'),
    assertNotSizeClass = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(!label.attr('class').has('grid-col'), testCase.testcase);
      ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase);
    },
    assertSize = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(label.hasClass('grid-col-3'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-10'), testCase.testcase);
    };

  assertNotSizeClass(cases[0]);     // size属性未指定
  assertNotSizeClass(cases[1]);     // size属性ブランク指定
  assertSize(cases[2]);             // size属性を指定
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
