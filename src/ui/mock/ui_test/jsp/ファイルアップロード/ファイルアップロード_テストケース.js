  runTest(
      require属性のテスト
    , disabled属性のテスト
    , id属性のテスト
    , cssClass属性のテスト
    , hint属性のテスト
    , nameAlias属性のテスト
    , タイトルサイズと入力部サイズのテスト
  );

  var $all_nodes;

  function setup() {
    $all_nodes = $('span.test-case, div.field.file, div.fielderror, div.note');
  }

  function require属性のテスト() {
    setup();
    var cases = test_for('required-test')
     ,  default_case = cases[0]
     ,  blank_case   = cases[1]
     ,  false_case   = cases[2]
     ,  true_case    = cases[3]
     ,  required     = 'span.required'
     ,  assertHas    = function(testcase) {
        if(isConfirmationPage()) { assertNotHas(testcase);
        } else{
          equal(testcase.area.find(required).size(), 1, testcase.testcase);
          equal($.trim(testcase.area.find(required).text()), '*', testcase.testcase);
        }
     }
     , assertNotHas  = function(testcase) {
        equal(testcase.area.find(required).size(), 0, testcase.testcase);
     };

    assertNotHas(default_case);
    assertNotHas(blank_case);
    assertNotHas(false_case);
    assertHas(true_case);
  }

  function hint属性のテスト() {
    setup();
    var cases = test_for('hint-test')
      , default_case  = cases[0]
      , blank_case    = cases[1]
      , set_hint_case = cases[2]
      , assertHasHint = function(testcase) {
        isConfirmationPage() ? equal(testcase.hint.size(), 0, testcase.testcase)
                             : equal(testcase.hint.size(), 1, testcase.testcase);
      }
      , assertHasNotHint = function(testcase) {
        equal(testcase.hint.size(), 0, testcase.testcase);
      };

      assertHasNotHint(default_case);
      assertHasNotHint(blank_case);
      assertHasHint(set_hint_case);
  }

  function disabled属性のテスト() {
    setup();
    var cases = test_for('disabled-test')
     ,  default_case = cases[0]
     ,  blank_case   = cases[1]
     ,  false_case   = cases[2]
     ,  true_case    = cases[3]
     ,  assertText   = function (testcase, value) {
        var text = $.trim(testcase.area.find('div.field-content').text());
        equal(text, value, testcase.testcase);
     }
     ,  assertDisabled = function(testcase, value) {
        if(isConfirmationPage()) { return  assertText(testcase, ""); }// 確認画面では表示無し
        var $input = testcase.area.find('input:file');
        equal($input.size(), 1, testcase.testcase + "[input size]");
        equal($input.val(), value, testcase.testcase + "[input value]");
        ok($input.prop('disabled'), testcase.testcase +  "[prop disabled]");
     }
     ,  assertNotDisabled = function(testcase, value) {
        if(isConfirmationPage()) { return assertText(testcase, value); }
        var $input = testcase.area.find('input:file');
        equal($input.size(), 1, testcase.testcase + "[input size]");
        equal($input.val(), value, testcase.testcase + "[input value]");
        ok(!$input.prop('disabled'), testcase.testcase +  "[prop disabled]");
     };

     assertNotDisabled(default_case, "");
     assertNotDisabled(blank_case, "");
     assertDisabled(true_case, "");
     assertNotDisabled(false_case, "");
  }

  function id属性のテスト() {
    // 入力画面のみ検証
    if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

    setup();
    var cases = test_for('id-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_case     = cases[2];

    var default_input = default_case.area.find('input:file');
    equal(default_input.attr('id'), default_input.attr('name'), default_case.testcase);

    var blank_input = blank_case.area.find('input:file');
    equal(blank_input.attr('id'), blank_input.attr('name'), blank_case.testcase);

    var set_input = set_case.area.find('input:file');
    notEqual(set_input.attr('id'), set_input.attr('name'), set_case.testcase);
    equal(set_input.attr('id'), 'id.hoge', set_case.testcase);
  }

  function cssClass属性のテスト() {
    // 入力画面のみ検証
    if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

    setup();
    var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

    ok(!default_case.area.find('input:file').is('.border-blue'), default_case.testcase);
    ok(!blank_case.area.find('input:file').is('.border-blue'), blank_case.testcase);
    ok(set_case.area.find('input:file').is('.border-blue'), set_case.testcase);
  }

  function nameAlias属性のテスト() {
    if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

    setup();
    var cases = test_for('nameAlias-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_case     = cases[2]
      , assertHighLight = function(testcase) {
          ok(testcase.area.find('input:file').is('.nablarch_error'), testcase.testcase);
        }
      , assertNotHighLight = function(testcase) {
          ok(!testcase.area.find('input:file').is('.nablarch_error'), testcase.testcase);
        }
      , assertNotHasErrMsg = function(i, testcase) {
          ok(testcase.error.text().isBlank(), testcase.testcase);
        };

      $.each(cases, assertNotHasErrMsg);
      assertNotHighLight(default_case);
      assertNotHighLight(blank_case);
      assertHighLight(set_case);
  }

  function タイトルサイズと入力部サイズのテスト() {
    setup();
    var cases = test_for('title-input-size'),
      assertNotSizeClass = function(testCase) {
        var label = testCase.area.find('label'),
          fieldContent = testCase.area.find('div.field-content');

        ok(!label.attr('class').has('grid-col'), testCase.testcase);
        ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase);
      },
      assertSize = function(testCase) {
        var label = testCase.area.find('label'),
          fieldContent = testCase.area.find('div.field-content');

        ok(label.hasClass('grid-col-10'), testCase.testcase);
        ok(fieldContent.hasClass('grid-col-18'), testCase.testcase);
      };

    assertNotSizeClass(cases[0]);     // size属性未指定
    assertNotSizeClass(cases[1]);     // size属性ブランク指定
    assertSize(cases[2]);             // size属性を指定
  }

  /**
   * 単行テキストのwidgetから出力されたテストケースの情報を取得する。
   * @param case_id テストケースのID
   * @returns テストケース内に定義された確認ボタン
   */
  function test_for(case_id) {
    var $cases = $all_nodes.filter('span.test-case.' + case_id);
    return $cases.map(function() {
       var $e = $(this)
        ,  idx   = $all_nodes.index($e)
        ,  $area = $($all_nodes[idx + 1])
        ,  $options = $all_nodes.filter(':eq(' + (idx + 2) + '), :eq(' + (idx + 3) + ')')
        ,  error    = $options.filter('div.fielderror')
        ,  note     = $options.filter('div.note');
       return {
           testcase : $.trim($e.text()),
           area     : $area,
           error    : error,
           hint     : note
       };
    });
  }
