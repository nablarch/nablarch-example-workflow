  runTest(
      label属性のテスト
    , id属性のテスト
    , cssClass属性のテスト
    , size属性のテスト
    , disabled属性のテスト
    , allowDoubleSubmmision属性のテスト
    , 必須属性のみ指定した場合のテスト
  );

  var size_prefix = ".grid-col-"
    , defaults = {
        label : "戻る",
        size  : ":not([class *= grid-col-])"
    };

  function label属性のテスト() {
    var cases = test_for('label-test')
      , label_default = cases[0]
      , label_blank   = cases[1]
      , label_set     = cases[2];
    equal($.trim(label_default.label.text()), defaults.label, label_default.testcase);
    equal($.trim(label_blank.label.text()),   defaults.label, label_blank.testcase);
    equal($.trim(label_set.label.text()),     "前の画面へ",     label_set.testcase);
  }

  function id属性のテスト() {
    var cases = test_for('id-test')
      , id_default = cases[0]
      , id_blank   = cases[1]
      , id_set     = cases[2];

    ok(!id_default.button.attr('id'), id_default.testcase);
    ok(!id_blank.button.attr('id'),   id_blank.testcase);
    ok(id_set.button.attr('id'),      id_set.testcase);
    equal(id_set.button.attr('id'), "back-id", id_set.testcase);
  }

  function cssClass属性のテスト() {
    var cases = test_for('cssClass-test')
      , cssclass_default = cases[0]
      , cssclass_blank   = cases[1]
      , cssclass_set     = cases[2]
      , test_css   = ".button-white";

    ok(!cssclass_default.button.is(test_css), cssclass_default.testcase);
    ok(!cssclass_blank.button.is(test_css)  , cssclass_blank.testcase);
    ok(cssclass_set.button.is(test_css)     , cssclass_set.testcase);
  }

  function size属性のテスト() {
    var cases = test_for('size-test')
      , size_default = cases[0]
      , size_blank   = cases[1]
      , size_set     = cases[2];

    ok(size_default.button.is(defaults.size), size_default.testcase);
    ok(size_blank.button.is(defaults.size),   size_blank.testcase);
    ok(size_set.button.is(size_prefix + '6'), size_set.testcase);
  }

  function disabled属性のテスト() {
    var cases = test_for('disabled-test')
      , disabled_default = cases[0]
      , disabled_blank   = cases[1]
      , disabled_false   = cases[2]
      , disabled_true    = cases[3];

    ok(!disabled_default.button.attr('disabled'), disabled_default.testcase);
    ok(!disabled_blank.button.attr('disabled'),   disabled_blank.testcase);
    ok(!disabled_false.button.attr('disabled'),   disabled_false.testcase);
    ok(disabled_true.button.attr('disabled'),     disabled_true.testcase);
  }

  function allowDoubleSubmmision属性のテスト() {
     var cases = test_for('allowDoubleSubmission-test')
       , double_submit_default = cases[0]
       , double_submit_blank   = cases[1]
       , double_submit_true    = cases[2]
       , double_submit_false   = cases[3];

     ok(isAllowedDoubleSubmit(double_submit_default), double_submit_default.testcase);
     ok(isAllowedDoubleSubmit(double_submit_blank),   double_submit_blank.testcase);
     ok(isAllowedDoubleSubmit(double_submit_true),     double_submit_true.testcase);
     ok(!isAllowedDoubleSubmit(double_submit_false),   double_submit_false.testcase);
  }

  function 必須属性のみ指定した場合のテスト() {
     var cases = test_for('default_value-test')
      ,  require_only = cases[0];

     equal($.trim(require_only.label.text()), defaults.label, require_only.testcase + "[label]");
     ok(require_only.button.is(defaults.size), require_only.testcase + "[size]");
     ok(isAllowedDoubleSubmit(require_only),    require_only.testcase + "[doubleSubmit]");
     ok(!require_only.button.attr('disabled'), require_only.testcase + "[disabled]");
  }

  /**
   * confirm用buttonのwidgetから出力されたテストケースの情報を取得する。
   * @param case_id テストケースのID
   * @returns テストケース内に定義された確認ボタン
   */
  function test_for(case_id) {
    var $nodes =  $('span.test-case.' + case_id + ' + div.control')
      , $cases =  $('span.test-case.' + case_id);
    return $nodes.map(function(i, e) {
      return { testcase : $.trim($($cases.get(i)).text()),
               label    : $(e).find('div.buttonWrapper'),
               button   : $(e).find('button').first()};
    });
  }

  function isAllowedDoubleSubmit(testcase) {
      var $button = testcase.button
        , name = $button.attr('name')
        , formName = $button.closest('form').attr('name');
      if (nablarch_submission_info[formName]) {
        return nablarch_submission_info[formName][name]['allowDoubleSubmission'];
      }
      throw Error('can\'t get submmision info');
  }
