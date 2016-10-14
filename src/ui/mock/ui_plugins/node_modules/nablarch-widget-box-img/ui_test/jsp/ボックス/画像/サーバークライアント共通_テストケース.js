runTest(
    必須属性のみのテスト
  , cssClass属性のテスト
  , file属性のテスト
);

  function 必須属性のみのテスト() {
    var testcase = test_for('requireTest')[0]
      , msg      = testcase.msg
      , wrapper  = testcase.node
      , imgNode  = wrapper.find('div');
    ok(wrapper.is('#logo_test')    , msg + " wrapper に IDが設定されること。");
    ok(wrapper.is('.box.imgWrapper') , msg + " wrapper にはclassにbox, imgWrapperが出力される。");
    ok(imgNode.is('.nablarch_ResponsibleImage'), msg + "img node にはclassにnablarch_ResponsibleImageが出力される。");
  }

  function cssClass属性のテスト() {
    var testcases = test_for('cssClassTest')
      , default_case = testcases[0]
      , blank_case   = testcases[1]
      , set_case     = testcases[2]
      , testCss   = '.cssBorder';

    ok(!default_case.node.is(testCss), default_case.msg);
    ok(!blank_case.node.is(testCss), blank_case.msg);
    ok(set_case.node.is(testCss), set_case.msg);
  }

  function file属性のテスト() {
    var testcase = test_for('fileTest')[0]
      , imgNode  = testcase.node.find('div');
    ok(imgNode.is('[class*="test_owner.png"]'), testcase.msg + " " + imgNode.attr('class'));
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