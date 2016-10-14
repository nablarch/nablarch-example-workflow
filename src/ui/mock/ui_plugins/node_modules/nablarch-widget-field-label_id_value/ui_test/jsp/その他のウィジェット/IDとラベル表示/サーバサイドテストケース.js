runTest(
  value_idのテスト
);

var $all_nodes
  , assertAttr = function (testcase, attr, expect) {
    equal(testcase.field.attr(attr), expect, testcase.testcase + " [" + attr + "]");
  };

function setup() {
  $all_nodes = $('span.test-case, div.field');
}

function value_idのテスト() {
  setup();
  var value_id = {value: "valueの値", id: "IDの値"}
    , testcase = test_for('value_id-test')[0];

  equal($.trim(testcase.field.text()), value_id.id + ":" + value_id.value, testcase.testcase);
}

/**
 * ラベル表示のwidgetから出力されたテストケースの情報を取得する。
 * @param case_id テストケースのID
 * @returns テストケース内に定義された確認ボタン
 */
function test_for(case_id) {
  var $cases = $all_nodes.filter('span.test-case.' + case_id);
  return $cases.map(function () {
    var $e = $(this)
      , idx = $all_nodes.index($e)
      , $area = $($all_nodes[idx + 1]);
    return {
      testcase: $.trim($e.text()),
      area    : $area,
      field   : $area.find('div.field-content')
    };
  });
}
