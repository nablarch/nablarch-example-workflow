runTest(
  maskingのテスト
  , require属性のテスト
  , hint属性のテスト
  , readonly属性のテスト
  , disabled属性のテスト
  , id属性のテスト
  , cssClass属性のテスト
  , maxlength属性のテスト
  , example属性のテスト
  , sample属性のテスト
  , size属性のテスト
);

var $all_nodes
  ,  initialized = false
  ,  asterisks    = "********";

function setup() {
  $all_nodes = $('span.test-case, div.field.password, div.fielderror, div.note');
}

function dummyData(cases) {
  $.each(cases, function(i, testcase){
    testcase.area.find('input:password').val('password');
  });
}

function maskingのテスト() {
  setup();
  var cases = test_for('masking-test')
    , masking = cases[0];

  dummyData(cases);

  if (isConfirmationPage()) {
    var text = masking.area.find('div.field-content').text().trim();
    equal(text, "********", masking.testcase); // password は8文字
  } else {
    var $input = masking.area.find('input');
    $input.each(function(){
      ok($(this).is(':password'), masking.testcase);
    });
  }
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

  dummyData(cases);

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

  dummyData(cases);

  assertHasNotHint(default_case);
  assertHasNotHint(blank_case);
  assertHasHint(set_hint_case);
}

function readonly属性のテスト() {
  setup();
  var cases = test_for('readonly-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  true_case    = cases[2]
    ,  false_case   = cases[3]
    ,  assertText   = function (testcase) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, asterisks, testcase.testcase);
    }
    ,  assertReadOnly = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase);}
      var $input = testcase.area.find('input:password');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok($input.prop('disabled'), testcase.testcase +  "[prop disabled]");
      ok($input.is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
    }
    ,  assertNotReadOnly = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase); }
      var $input = testcase.area.find('input:password');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok(!$input.prop('disabled'), testcase.testcase +  "[prop disabled]");
      ok(!$input.is('.nablarch_readonly'), testcase.testcase + "[marker readonly]");
    };

  dummyData(cases);

  assertNotReadOnly(default_case, "password");
  assertNotReadOnly(blank_case, "password");
  assertReadOnly(true_case, "password");
  assertNotReadOnly(false_case, "password");
}

function disabled属性のテスト() {
  setup();
  var cases = test_for('disabled-test')
    ,  default_case = cases[0]
    ,  blank_case   = cases[1]
    ,  true_case    = cases[2]
    ,  false_case   = cases[3]
    ,  assertText   = function (testcase, value) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, value, testcase.testcase);
    }
    ,  assertDisabled = function(testcase, value) {
      if(isConfirmationPage()) { return  assertText(testcase, ""); }// 確認画面では表示無し
      var $input = testcase.area.find('input:password');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok($input.prop('disabled'), testcase.testcase +  "[prop disabled]");
    }
    ,  assertNotDisabled = function(testcase, value) {
      if(isConfirmationPage()) { return assertText(testcase, asterisks); }
      var $input = testcase.area.find('input:password');
      equal($input.size(), 1, testcase.testcase + "[input size]");
      equal($input.val(), value, testcase.testcase + "[input value]");
      ok(!$input.prop('disabled'), testcase.testcase +  "[prop disabled]");
    };

  dummyData(cases);

  assertNotDisabled(default_case, "password");
  assertNotDisabled(blank_case, "password");
  assertDisabled(true_case, "password");
  assertNotDisabled(false_case, "password");
}

function id属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('id-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  dummyData(cases);

  var default_input = default_case.area.find('input:password');
  equal(default_input.attr('id'), default_input.attr('name'), default_case.testcase);

  var blank_input = blank_case.area.find('input:password');
  equal(blank_input.attr('id'), blank_input.attr('name'), blank_case.testcase);

  var set_input = set_case.area.find('input:password');
  notEqual(set_input.attr('id'), set_input.attr('name'), set_case.testcase);
  equal(set_input.attr('id'), 'test-id', set_case.testcase);
}

function cssClass属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('cssClass-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  dummyData(cases);

  ok(!default_case.area.find('input:password').is('.cssClass-test'), default_case.testcase);
  ok(!blank_case.area.find('input:password').is('.cssClass-test'), blank_case.testcase);
  ok(set_case.area.find('input:password').is('.cssClass-test'), set_case.testcase);
}

function maxlength属性のテスト() {
  // 入力画面のみ検証
  if(isConfirmationPage()) { return ok(true, "確認画面ではテスト無し");}

  setup();
  var cases = test_for('maxlength-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2];

  dummyData(cases);

  ok(!default_case.area.find('input:password').attr('maxlength'), default_case.testcase);
  ok(!blank_case.area.find('input:password').attr('maxlength'), blank_case.testcase);
  ok(set_case.area.find('input:password').attr('maxlength'), set_case.testcase);
  equal(set_case.area.find('input:password').attr('maxlength'), 5, set_case.testcase);
}

function example属性のテスト() {
  setup();
  var cases = test_for('example-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    ,  assertText   = function (testcase) {
      var text = $.trim(testcase.area.find('div.field-content').text());
      equal(text, "", testcase.testcase);
    }
    , assertHasPlaceholder = function assertExample(testcase, placeholder) {
      if(isConfirmationPage()) {return assertText(testcase);}
      var $input = testcase.area.find('input:password');
      equal($input.val(), "", testcase.testcase + "[val()]");
      equal($input.attr('placeholder'), placeholder, testcase.testcase);
    }
    , assertNotHasPlaceholder = function(testcase) {
      if(isConfirmationPage()) {return assertText(testcase);}
      var $input = testcase.area.find('input:password');
      equal($input.val(), "", testcase.testcase + "[val()]");
      ok(!$input.attr('placeholder'), testcase.testcase);
    };

  // placeholderが重要なので値は設定しない。
  assertNotHasPlaceholder(default_case);
  assertNotHasPlaceholder(blank_case);
  assertHasPlaceholder(set_case, "サンプル");

}

function sample属性のテスト() { // server にて出力される場合は無効であることを確認する。
  setup();
  var cases = test_for('sample-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , set_case     = cases[2]
    , assert       = function(testcase) {
      if (isConfirmationPage()) {
        var text = $.trim(testcase.area.find('div.field-content').text());
        equal(text, "", testcase.testcase);
      } else {
        equal(testcase.area.find('input:password').val(), "", testcase.testcase);
      }
    };

  assert(default_case);
  assert(blank_case);
  assert(set_case);
}

function size属性のテスト() {
  setup();

  var cases = test_for('size-test'),
    assertNotSizeClass = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(!label.attr('class').has('grid-col'), testCase.testcase);
      ok(!fieldContent.attr('class').has('grid-col'), testCase.testcase);
    },
    assertSize = function(testCase) {
      var label = testCase.area.find('label'),
        fieldContent = testCase.area.find('div.field-content');

      ok(label.hasClass('grid-col-8'), testCase.testcase);
      ok(fieldContent.hasClass('grid-col-12'), testCase.testcase);
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
