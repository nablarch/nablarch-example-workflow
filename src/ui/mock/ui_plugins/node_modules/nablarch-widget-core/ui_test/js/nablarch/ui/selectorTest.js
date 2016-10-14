require(['jquery', 'sugar', 'nablarch/ui/selector'],
function($){

  module("nablarch/ui/selector");

  test(":is-blankのテスト", function() {
    var testTable = [
        // [case, expected, input.val, text.html]
        ["emptyの場合", true, "", ""],
        ["blankの場合", true, " ", " "],
        ["nbspの場合", true, "\xA0", "&nbsp;"],
        ["値がある場合", false, "dummy", "text"],
      ]
      , inputTag = $('<input>')
      , textNode = $('<span>');

    testTable.each(function(testcase) {
      var description = testcase[0]
        , expected    = testcase[1];
      inputTag.val(testcase[2]);
      textNode.html(testcase[3]);
      equal(inputTag.is(':is-blank'), expected, description);
      equal(textNode.is(':is-blank'), expected, description);
    });
  });

  test(":is-not-blankのテスト", function() {
    var testTable = [
        // [case, expected, input.val, text.html]
        ["emptyの場合", false, "", ""],
        ["blankの場合", false, " ", " "],
        ["nbspの場合", false, "\xA0", "&nbsp;"],
        ["値がある場合", true, "dummy", "text"],
      ]
      , inputTag = $('<input>')
      , textNode = $('<span>');

    testTable.each(function(testcase) {
      var description = testcase[0]
        , expected    = testcase[1];
      inputTag.val(testcase[2]);
      textNode.html(testcase[3]);
      equal(inputTag.is(':is-not-blank'), expected, description);
      equal(textNode.is(':is-not-blank'), expected, description);
    });
  });

  test(':is-valueのテスト', function(){
    var testTable = [
       // [case, expected, selector, val]
       ["マッチする", true, ':is-value(dummy)', "dummy"],
       ["マッチしない",  false, ':is-value(money)', "dummy"],
       ["複数設定し、マッチする", true, ":is-value(money, dummy)", "dummy"],
       ["複数設定し、マッチする", true, ":is-value(money, dummy)", "money"],
       ["複数設定し、マッチしない", false, ":is-value(money, dummy)", "none"],
     ]
     , inputTag = $('<input>')
     , textNode = $('<span>');
    testTable.each(function(testcase) {
      var description = testcase[0]
        , expected    = testcase[1]
        , selector    = testcase[2]
        , val         = testcase[3];
      inputTag.val(val);
      textNode.html(val);
      equal(inputTag.is(selector), expected, description);
      ok(!textNode.is(selector), description + " [textには利用できない]");
    });
  });

});