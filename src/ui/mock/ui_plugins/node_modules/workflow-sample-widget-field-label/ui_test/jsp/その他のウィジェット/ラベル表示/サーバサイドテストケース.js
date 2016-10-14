runTest(
  必須属性のテスト
  , valueFormat属性のテスト
);

var $all_nodes
  , assertAttr = function(testcase, attr, expect) {
    equal(testcase.field.attr(attr), expect, testcase.testcase + " [" + attr + "]");
  };

function setup() {
  $all_nodes = $('span.test-case, div.field');
}


function 必須属性のテスト() {
  setup();
  var testcase = test_for('require_val-test')[0];
  ok($.trim(testcase.area.find('label').text()).startsWith('タイトル'), testcase.testcase);
  ok($.trim(testcase.field.text()), '必須属性を指定', testcase.testcase);
}

function valueFormat属性のテスト() {
  setup();
  var cases = test_for('valueFormat-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , 年月日_case   = cases[2];

  equal($.trim(default_case.field.text()), '19700101', default_case.testacase);
  equal($.trim(blank_case.field.text()), '19700101', blank_case.testacase);
  equal($.trim(年月日_case.field.text()), '1970年01月01日', 年月日_case.testacase);
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
