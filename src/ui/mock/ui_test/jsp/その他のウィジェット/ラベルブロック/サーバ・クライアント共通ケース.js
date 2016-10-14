runTest(
  label_blockのテスト
  , タイトルサイズと入力部サイズのテスト
);

var $all_nodes
  , assertAttr = function(testcase, attr, expect) {
    equal(testcase.field.attr(attr), expect, testcase.testcase + " [" + attr + "]");
  };

function setup() {
  $all_nodes = $('span.test-case, div.field');
}

function label_blockのテスト() {
  setup();
  var cases = test_for("label_block-test")
    , require_case = cases[0]
    , body_case    = cases[1];
  ok($.trim(require_case.area.find('label').text()).startsWith('タイトル'), require_case.testcase);
  ok($.trim(body_case.area.find('label').text()).startsWith('body'), body_case.testcase);
  ok($.trim(body_case.field.text()), 'この内容がラベルとして表示されること。', body_case.testcase);
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
      ok(fieldContent.hasClass('grid-col-12'), testCase.testcase);
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
