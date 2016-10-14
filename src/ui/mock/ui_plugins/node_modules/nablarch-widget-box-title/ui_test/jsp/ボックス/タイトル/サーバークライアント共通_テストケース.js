runTest(
    必須属性のみのテスト
  , cssClass属性のテスト
  , id属性のテスト
);


  function 必須属性のみのテスト() {
    var testcase = test_for('requireOnly')[0]
      , node = testcase.node
      , msg  = testcase.msg;

    ok(node.is('.box'), msg + "class = boxがあること");
    ok(node.is('.titleBox'), msg + "class = titleBoxがあること");
    equal(node.text().trim(), "記載した内容がメッセージが出力されること。" ,msg + "内容の検証");
  }

  function cssClass属性のテスト() {
    var testcases = test_for('css-test')
      , default_case = testcases[0]
      , blank_case   = testcases[1]
      , underline_case = testcases[2];

    ok(!default_case.node.is('.cssUnderline'), default_case.msg);
    ok(!blank_case.node.is('.cssUnderline'), blank_case.msg);
    ok(underline_case.node.is('.cssUnderline'), underline_case.msg);
  }

  function id属性のテスト() {
    var testcases = test_for('id-test')
      , default_case = testcases[0]
      , blank_case   = testcases[1]
      , set_case     = testcases[2];
    ok(!default_case.node.attr('id'), default_case.msg);
    ok(!blank_case.node.attr('id'),   blank_case.msg);
    ok(set_case.node.is('#idTest'), set_case.msg);
  }

  function test_for(case_id) {
    var $all_node = $('span.test-case, div.box')
     ,  $cases  = $all_node.filter('.test-case.' + case_id);

    return $cases.map(function(i){
      var $case = $(this)
        , index = $all_node.index($case)
        , node = $all_node.get(index + 1);
      return {
         msg : $case.text().trim()
       , node : $(node)
      };
    });
  }