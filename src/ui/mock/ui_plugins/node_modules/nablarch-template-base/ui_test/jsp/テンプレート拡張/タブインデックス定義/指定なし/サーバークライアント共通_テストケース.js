  runTest(
     tabindex未指定のテスト
  );

  var tabindexnodes = 'input, select, textarea, a, button';

  function tabindex未指定のテスト() {
    var testcase = test_for("non-order");
    testcase.$context.find(tabindexnodes).each(function(){
      ok(!this.tabindex, testcase.msg);
    });
  }

  function test_for(case_id) {
    var $context = $("#" + case_id)
     ,  msg      = $context.find('.test-case').text();
    return {
       $context : $context
     , msg      : msg
    };
  }
