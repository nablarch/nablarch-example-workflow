  runTest(
    tabindexを1つのコンテキストにのみ指定した場合のテスト
  );

  var tabindexnodes = 'input, select, textarea, a, button';

  function tabindexを1つのコンテキストにのみ指定した場合のテスト() {
    var testcase = test_for('order')
      , $context = testcase.$context
      , msg      = testcase.msg
      , testTable = [
          ['input:text', 1]
        , ['textarea', 2]
        , ['input:file', 3]
        , ['select', 4]
        , ['input:radio', [5, 6, 7, 8]]
        , ['input:checkbox', [9, 10, 11, 12]]
        , ['a', 13]
        , ['button', 14]
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
