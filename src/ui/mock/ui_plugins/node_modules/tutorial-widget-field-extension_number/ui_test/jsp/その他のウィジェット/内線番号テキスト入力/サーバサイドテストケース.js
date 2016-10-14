runTest(
  必須属性テスト,
  nameAlias属性のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {

  var target = find_text('required')
    , $build = $(target.input.find('input:text')[0])
    , $personal = $(target.input.find('input:text')[1]);

  equal(target.label.text().compact(), '必須テスト', 'タイトル属性が設定されること');
  if (isConfirmationPage()) {
    ok(target.field.text().indexOf('99 - 9898') != -1, 'divのボディ部に入力値が表示されていること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');
  } else {
    equal($build.val(), '99', '内線番号：ビル番号のvalue属性が設定されること');
    equal($personal.val(), '9898', '内線番号：個人番号のvalue属性が設定されること');
    ok(!target.error.find('div.nablarch_error').is('*'), 'エラーはないこと');
  }
}

/**
 * nameAlias属性のテスト
 */
function nameAlias属性のテスト() {
  var test = {
    nonNameAlias: function (testCase) {
      var target = find_text(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 2, '各入力欄にnablarch_errorクラスが設定されること');
        equal(target.error.find('div.nablarch_error').length, 2, '各入力欄に対応するエラーメッセージが表示されること');
      }
    },
    nameAlias: function(testCase) {
      var target = find_text(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 2, 'nablarch_errorクラスが設定されること');
        equal(target.error.find('div.nablarch_error').length, 1, testCase + ':nameAliasと一致する単一のエラーメッセージのみ表示されること');
      }
    }
  };

  test.nonNameAlias('not-nameAlias');
  test.nonNameAlias('nameAlias-blank');
  test.nameAlias('nameAlias-test');
}

/**
 * テストケースの内容を取得する。
 *
 * @param test_case テストケース名
 * @returns {{label: (*|Mixed), input: (*|Mixed), error: (*|Mixed)}}
 */
function find_text(test_case) {
  var $test = $('span.test-case.' + test_case)
    , $text_div = $test.next('.field');

  return {
    field: $text_div,
    label: $text_div.find('label'),
    input: $text_div.find('div.field-content'),
    error: $text_div.find('div.fielderror')
  }
}
