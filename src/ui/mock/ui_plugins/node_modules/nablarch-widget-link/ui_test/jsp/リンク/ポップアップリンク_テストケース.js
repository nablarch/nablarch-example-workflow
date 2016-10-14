  runTest(
      id属性のテスト
    , cssClass属性のテスト
    , popupOption属性のテスト
    , 必須属性のみ指定した場合のテスト
  );

  function id属性のテスト() {
    var cases = test_for('id-test')
      , id_default = cases[0]
      , id_blank   = cases[1]
      , id_set     = cases[2];

    ok(!id_default.link.attr('id'), id_default.testcase);
    ok(!id_blank.link.attr('id'),   id_blank.testcase);
    ok(id_set.link.attr('id'),      id_set.testcase);
    equal(id_set.link.attr('id'), "link-id", id_set.testcase);
  }

  function cssClass属性のテスト() {
    var cases = test_for('cssClass-test')
      , cssclass_default = cases[0]
      , cssclass_blank   = cases[1]
      , cssclass_set     = cases[2]
      , test_css   = ".style";

    ok(!cssclass_default.link.is(test_css), cssclass_default.testcase);
    ok(!cssclass_blank.link.is(test_css)  , cssclass_blank.testcase);
    ok(cssclass_set.link.is(test_css)     , cssclass_set.testcase);
  }

  function popupOption属性のテスト() {
     var cases = test_for('popupOption-test')
       , popup_default = cases[0]
       , popup_blank   = cases[1]
       , popup_set     = cases[2]
       , popupOption   = function(link) {
           var $link = $(link)
             , name = $link.attr('name')
             , $form = $link.parents('form')
             , formName = $form.attr('name');
           if (nablarch_submission_info[formName]) {
             return nablarch_submission_info[formName][name]['popupOption'];
           }
         }
       , assert = function (testcase, option) {
           equal(popupOption(testcase.link), option, testcase.testcase);
         };

     assert(popup_default, "");
     assert(popup_blank, "");
     assert(popup_set, "menubar=no, width=100, height=100");
  }

  function 必須属性のみ指定した場合のテスト() {
     var cases = test_for('default_value-test')
      ,  require_only = cases[0];

     equal($.trim(require_only.label.text()), "金融機関検索", require_only.testcase + "[label]");
     ok(isAllowedDoubleSubmit(require_only),    require_only.testcase + "[doubleSubmit]");
     ok(!require_only.link.attr('disabled'), require_only.testcase + "[disabled]");
  }

  /**
   * リンクのwidgetから出力されたテストケースの情報を取得する。
   * @param case_id テストケースのID
   * @returns テストケース内に定義された確認ボタン
   */
  function test_for(case_id) {
    var $nodes =  $('span.test-case.' + case_id + ' + div.control')
      , $cases =  $('span.test-case.' + case_id);
    return $nodes.map(function(i, e) {
      return { testcase : $.trim($($cases.get(i)).text()),
               label    : $(e).find('a').first(),
               link   : $(e).find('a').first()};
    });
  }

  function isAllowedDoubleSubmit(testcase) {
      var $link = testcase.link
        , name = $link.attr('name')
        , formName = $link.closest('form').attr('name');
      if (nablarch_submission_info[formName]) {
        return nablarch_submission_info[formName][name]['allowDoubleSubmission'];
      }
      throw Error('can\'t get submmision info');
  }
