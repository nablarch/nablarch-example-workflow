  runTest(
   tabindexを2つのコンテキストに設定した場合のテスト
  );

  var tabindexnodes = 'input, select, textarea, a, button';

  function tabindexを2つのコンテキストに設定した場合のテスト() {
    var testcase = test_for('multi_order')
      , $context = testcase.$context
      , msg      = testcase.msg
      , testTable = [
        // node, index @area1, index @area2
          ['input:text', 11]
        , ['textarea', 12]
        , ['input:file', 13]
        , ['a', 14]
        , ['select', 1]
        , ['input:radio', [2, 3, 4, 5]]
        , ['input:checkbox', [6, 7, 8, 9]]
        , ['button', 10]
     ];
    testTable.each(function(e){
      var selector = e[0]
        , expected = to_a(e[1])
        , node     = $context.find(selector);
      expected.each(function(expect, i){
        equal(node.filter(':eq(' + i + ")").attr('tabindex'), expect, [msg, " [", selector, "]" ].join(""));
      });
    });
  }

  function to_a(index) {
    return [].slice.call(arguments).flatten();
  }

  function test_for(case_id) {
    var $context = $("#" + case_id)
     ,  msg      = $context.find('.test-case').text();
    return {
       $context : $context
     , msg      : msg
    };
  }
