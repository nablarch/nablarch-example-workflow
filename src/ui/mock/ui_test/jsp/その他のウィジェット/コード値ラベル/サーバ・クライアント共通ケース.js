runTest(
  sample属性のテスト
  , listFormat属性のテスト
  , タイトルサイズと入力部サイズのテスト
  , pattern属性のテスト
  , optionColumnName属性のテスト
  , labelPattern属性のテスト
);

var $all_nodes
  , assertAttr = function(testcase, attr, expect) {
    equal(testcase.field.attr(attr), expect, testcase.testcase + " [" + attr + "]");
  };

function setup() {
  $all_nodes = $('span.test-case, div.field');
}

function sample属性のテスト() {
  setup();
  test_for('sample-test').each(function(){
    ok(this.field.text().isBlank(), this.testcase);
  });
}

function unit属性のテスト() {
  setup();
  var cases = test_for('unit-test'),
    assertUnitEmpty = function (testCase) {
      equal($.trim(testCase.area.find('span.unit').html()), '', testCase.testcase);
    },
    assertUnit = function (testCase) {
      equal($.trim(testCase.area.find('span.unit').html()), '万円', testCase.testcase);
    };

  assertUnitEmpty(cases[0]);    // unit未指定
  assertUnitEmpty(cases[1]);    // unitブランク
  assertUnitEmpty(cases[2]);    // unit指定だが値が空
  assertUnit(cases[3]);         // unit指定
}

function listFormat属性のテスト() {
  setup();
  var cases = test_for('listFormat-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , ul_case      = cases[2]
    , labels       = ["name1-1", "name1-2"]
    , assertLabels = function(testcase, formatSpec) {
      var assert =  function(i, e) {
        equal($.trim($(e).text()), labels[i], testcase.testcase);
      };
      equal(testcase.field.find(formatSpec).size(), 2, testcase.testcase);
      testcase.field.find(formatSpec).each(assert);
    }
    , assertNbspText = function(testcase) {
      var text = $.trim(testcase.field.text());
      equal(text, labels.join("\xA0"), testcase.testcase);
    };

  assertNbspText(default_case);
  assertNbspText(blank_case);
  assertLabels(ul_case, 'ul > li');
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

      ok(label.hasClass('grid-col-13'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-8'), testCase.testcase);
    };

  assertNotSizeClass(cases[0]);     // size属性未指定
  assertNotSizeClass(cases[1]);     // size属性ブランク指定
  assertSize(cases[2]);             // size属性を指定
}

function pattern属性のテスト() {
  setup();
  var cases = test_for('pattern-test')
    , default_case  = cases[0]
    , blank_case    = cases[1]
    , pattern2_case = cases[2];

  equal($.trim(default_case.field.text().compact()), 'name1-1name1-2name1-3', default_case.testcase);
  equal($.trim(blank_case.field.text().compact()), 'name1-1name1-2name1-3', blank_case.testcase);
  equal($.trim(pattern2_case.field.text().compact()), 'name1-2', pattern2_case.testcase);
}

function optionColumnName属性のテスト() {
  setup();
  var cases = test_for('optionColumnName-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_opt_case = cases[2];

  equal($.trim(default_case.field.text().compact()), 'name1-2 column:OPTION01' ,default_case.testcase);
  equal($.trim(blank_case.field.text().compact()), 'name1-2 column:OPTION01' ,blank_case.testcase);
  equal($.trim(set_opt_case.field.text().compact()), 'name1-2 column:OPTION03' ,set_opt_case.testcase);
}

function labelPattern属性のテスト() {
  setup();
  var cases = test_for('labelPattern-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , short_case   = cases[2];

  equal($.trim(default_case.field.text()), 'name1-2' ,default_case.testcase);
  equal($.trim(blank_case.field.text()), 'name1-2' ,blank_case.testcase);
  equal($.trim(short_case.field.text().compact()), 'name1-2 - short:name1-2 - name1-2 column:OPTION01 - value1-2' ,short_case.testcase);
}

/**
 * ラベル表示のwidgetから出力されたテストケースの情報を取得する。
 * @param case_id テストケースのID
 * @returns テストケース内に定義された確認ボタン
 */
function test_for(case_id) {
  var $cases = $all_nodes.filter('span.test-case.' + case_id);
  return $cases.map(function() {
    var $e = $(this)
      ,  idx   = $all_nodes.index($e)
      ,  $area = $($all_nodes[idx + 1]);
    return {
      testcase : $.trim($e.text()),
      area     : $area,
      field    : $area.find('div.field-content')
    };
  });
}
