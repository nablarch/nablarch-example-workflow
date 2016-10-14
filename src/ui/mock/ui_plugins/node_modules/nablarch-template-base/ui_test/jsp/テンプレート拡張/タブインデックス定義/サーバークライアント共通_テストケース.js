require(['jquery', 'nablarch/ui/Widget'],
function($, Widget){
  runTest(
     tabindex未指定のテスト
   , tabindexを1つのコンテキストにのみ指定した場合のテスト
   , tabindexを2つのコンテキストに設定した場合のテスト
   , 打鍵テスト
  );

  var tabindexnodes = 'input, select, textarea, a, button';

  function tabindex未指定のテスト() {
    var testcase = test_for("non-order");
    testcase.$context.find(tabindexnodes).each(function(){
      ok(!this.tabindex, testcase.msg);
    });
  }

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

  function 打鍵テスト() {
    var newDefinition = $('<div>', {'class': 'nablarch_TabindexOrder -order area1,multi_area2,multi_area1'});
    $('.nablarch_TabindexOrder').removeClass('nablarch_TabindexOrder');
    $('div#content').append(newDefinition);
    Widget.init();
    ok(true, '打鍵テスト用にIndexを再定義してしまう。');
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
});