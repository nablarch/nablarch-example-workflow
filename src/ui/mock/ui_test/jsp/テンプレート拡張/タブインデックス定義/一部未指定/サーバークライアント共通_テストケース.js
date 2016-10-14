  runTest(
    指定と未指定領域が混在する場合のテスト
  );

  var tabindexnodes = 'input, select, textarea, a, button';

  function 指定と未指定領域が混在する場合のテスト() {
    var non_order = test_for('non-order')
      , second    = test_for('second')
      , first     = test_for('first')
      , assertTabindex = function(testcase) {
         var $context = testcase.$context;
         testcase.datalist.each(function(data){
           var selector = data[0]
             , expects = to_a(data[1])
             , $nodes   = $context.find(selector);
           equal($nodes.length, expects.length, testcase.msg + " testの検証。サイズの確認 [" + selector + "]");
           $nodes.each(function(i) {
             var node = this
               , expect = expects[i];
             equal(node.tabIndex, expect, testcase.msg + " selector => " + selector);
           });
         });

      };
    // expected = [[selector, [tabindex, tabindex]]
    first.datalist = [
          ['select', 1]
        , ['input:radio', [2,3,4,5]]
        , ['input:checkbox', [6,7,8, 9]]
        , ['button', 10]
        , ['input:text', 11]
        , ['textarea', 12]
        , ['input:file', 13]
        , ['a', 14]];

    second.datalist = [
          ['input:text', 15]
        , ['textarea', 16]
        , ['input:file', 17]
        , ['select', 18]
        , ['input:radio', [19, 20, 21, 22]]
        , ['input:checkbox', [23, 24, 25, 26]]
        , ['a', 27]
        , ['button', 28]];

    assertTabindex(first);
    assertTabindex(second);
    non_order.$context.find(tabindexnodes).each(function() {
      ok(!this.tabIndex, non_order.msg + " : " + this.name );
    });
  }

  function to_a(index) {
    return [].slice.call(arguments).flatten();
  }

  function test_for(context_id) {
    var $context = $("#" + context_id)
     ,  msg      = $context.find('.test-case').text();
    return {
      $context : $context
     , msg      : msg
    };
  }
