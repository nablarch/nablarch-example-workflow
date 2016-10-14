  runTest(
      必須属性のみ指定した場合のテスト
    , resultSetCss属性のテスト
    , id属性のテスト
  );

  var $all_nodes
    , paging_navi_area = "div.nablarch_paging"
    , result_set_class = "nablarch_resultSet"
    ,  label = 'h2';

  function setup() {
    $all_nodes = $('span.test-case, div.title, div.nablarch_listSearchResultWrapper');
  }

  function 必須属性のみ指定した場合のテスト() {
     setup();
     var cases = test_for('require_only-test')
      ,  require_only = cases[0];

     equal($.trim(require_only.title.find(label).text()), "必須属性", require_only.testcase + " [title label]");
     ok(hasOnlyClass(require_only, [result_set_class]), require_only.testcase + "[result set class]");
  }

  function resultSetCss属性のテスト() {
    setup();
    var cases = test_for('resultSetCss-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_css_case = cases[2];

    ok(hasOnlyClass(default_case, [result_set_class]), default_case.testcase);
    ok(hasOnlyClass(blank_case, [result_set_class]), blank_case.testcase);
    ok(hasOnlyClass(set_css_case, [result_set_class, 'border-blue']), set_css_case.testcase);
  }

  function id属性のテスト() {
    setup();
    var cases = test_for('id-test')
      , not_id = cases[0]
      , blank_id = cases[1]
      , set_id = cases[2];

    equal(not_id.table.attr('id'), '', 'ID属性は空であること');
    equal(blank_id.table.attr('id'), '', 'ID属性は空であること');
    equal(set_id.table.attr('id'), 'hogefuga', '指定したid属性が設定されること');
  }

  /**
   * 一覧テーブルのwidgetから出力されたテストケースの情報を取得する。
   * @param case_id テストケースのID
   * @returns テストケース内に定義された確認ボタン
   */
  function test_for(case_id) {
    var $cases = $all_nodes.filter('span.test-case.' + case_id);
    return $cases.map(function() {
       var $e = $(this)
        ,  idx = $all_nodes.index($e);
       return {
           testcase : $.trim($e.text()),
           title    : $($all_nodes[idx + 1]),
           table    : $($all_nodes[idx + 2])
       };
    });
  }

  /**
   * テストケースのtableプロパティからdiv要素のclassが指定されたものだけか判定する。
   *
   * @param testcase tableプロパティにNodeが設定されているテストケース
   * @param classを指定する配列
   * @returns 指定したクラスのみであればtrue, それ以外のものがあればfalse
   * @throws 指定したクラスが1つでもない場合
   */
  function hasOnlyClass(testcase, classtexts) {
    var node = testcase.table.find('.' + classtexts[0])
      , node_classtext =  $(node).attr('class');
    $.each(classtexts, function(_, classtext){
       if (node_classtext.has(classtext)) {
         node_classtext = node_classtext.remove(classtext);
       } else {
         throw Error('node does\'t has class [ ' + classtext + " ]");
       }
    });
    return node_classtext.isBlank();
  }

