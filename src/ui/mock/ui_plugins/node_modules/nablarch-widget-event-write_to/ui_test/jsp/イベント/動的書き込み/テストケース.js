  runTest(
    必須属性のみ動作確認
  , format属性のテスト
  );

  function 必須属性のみ動作確認() {'use strict';
    var testcase = test_for('requireTest')[0]
      , msg    = testcase.msg
      , $input = testcase.area.find('input.from')
      , $to    = testcase.area.find('div.to')
      , blurCase   = 'set value onBlur'
      , changeCase = 'not set to label onChange';
    $input.val('');
    $to.text('');
    // emulate user's operation.
    $input.val(blurCase);
    equal($to.text(), '', msg + " (blur前は値がないこと。)");
    $input.blur();
    equal($to.text(), blurCase, msg + " (blur後に値が設定されること。)");

    $to.text('');
    $input.val(changeCase);
    $input.change();
    equal($to.text(), '', msg + " (changeでは値が変更されないこと。)");
  }

  function format属性のテスト() {
    var testcase = test_for("formatTest")[0]
      , $context = testcase.area
      , msg      = testcase.msg
      , $to_default = $context.find("span.to.default")
      , $to_blank   = $context.find("span.to.blank")
      , $to_first   = $context.find("span.to.first")
      , $to_second  = $context.find("span.to.second")
      , $to_multi   = $context.find("span.to.multi")
      , $first      = $context.find("input.first")
      , $second     = $context.find("input.second")
      , $third      = $context.find("input.third")
      , inputs      = [$first, $second, $third]
      , texts       = [$to_default, $to_blank, $to_first, $to_second, $to_multi];

    init();
    // firstの要素の値を変更してイベントを発火
    $first.val("100").change();
    equal($to_default.text(), "", "format属性がなければ反映されない");
    equal($to_blank.text(),   "",   "format属性がブランクでは反映されない");
    equal($to_first.text(), "100", "format属性に{input.first}が指定されているので反映される");
    equal($to_second.text(), "", "format属性に{input.second}が指定されているので反映されない");
    equal($to_multi.text() , "100--", "format属性に{input.first}を含んでいるので反映される");


    init();
    $second.val("200").change();
    equal($to_default.text(), "", "format属性がなければ反映されない");
    equal($to_blank.text(),   "",   "format属性がブランクでは反映されない");
    equal($to_first.text(), "", "format属性に{input.first}が指定されているので反映される");
    equal($to_second.text(), "200", "format属性に{input.second}が指定されているので反映されない");
    equal($to_multi.text() , "-200-", "format属性に{input.first}を含んでいるので反映される");

    init();
    $first.val("100");
    $second.val("200");
    $third.val("300").change();
    equal($to_default.text(), "", "format属性がなければ反映されない");
    equal($to_blank.text(),   "",   "format属性がブランクでは反映されない");
    equal($to_first.text(), "100", "format属性に{input.first}が指定されているので反映される");
    equal($to_second.text(), "200", "format属性に{input.second}が指定されているので反映されない");
    equal($to_multi.text() , "100-200-300", "format属性に{input.first}を含んでいるので反映される");

    function init() {
      inputs.each(function(node) {node.val("");});
      texts.each(function(text) {text.text("");}).each(function(text) {
        equal(text.text(), "", msg + "初期値は空になっていること");
      });
    }
  }

  function test_for(caseId) {'use strict';
    var $cases = $('span.testcase.' + caseId);
    return $cases.map(function(){
      var $case = $(this)
        , $area = $case.closest('div');
      return {
          msg  : $case.text().trim()
        , area : $area
      };
    });
  }