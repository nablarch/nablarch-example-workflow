runTest(
  id属性のテスト
  , cssClass属性のテスト
  , domain属性のテスト
  , sample属性のテスト
  , sample属性のテスト
  , unit属性のテスト
  , タイトルサイズと入力部サイズのテスト
);

var $all_nodes
  , assertAttr = function(testcase, attr, expect) {
    equal(testcase.field.attr(attr), expect, testcase.testcase + " [" + attr + "]");
  };

function setup() {
  $all_nodes = $('span.test-case, div.field');
}

function id属性のテスト() {
  setup();
  var cases = test_for('id-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assertId     = function(testcase, id) {
      assertAttr(testcase, 'id', id);
    };

  assertId(default_case, "server.id-none");
  assertId(blank_case, "server.id-blank");
  assertId(set_case, "test-id");
}

function cssClass属性のテスト() {
  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  ok(!default_case.field.is('.cssClass-test'), default_case.testcase);
  ok(!blank_case.field.is('.cssClass-test'), blank_case.testcase);
  ok(set_case.field.is('.cssClass-test'), set_case.testcase);
}

function domain属性のテスト() {
  setup();
  var cases = test_for('domain-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];
  ok(!default_case.area.is('.cssClass-test'), default_case.testcase);
  ok(!blank_case.area.is('.cssClass-test'), blank_case.testcase);
  ok(set_case.area.is('.domain-test'), set_case.testcase);
}

function sample属性のテスト() {
  setup();
  var cases = test_for('sample-test');
  cases.each(function(){
    ok(this.field.text().isBlank(), this.testcase);
  });
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

      ok(label.hasClass('grid-col-4'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-7'), testCase.testcase);
    };

  assertNotSizeClass(cases[0]);     // size属性未指定
  assertNotSizeClass(cases[1]);     // size属性ブランク指定
  assertSize(cases[2]);             // size属性を指定
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
