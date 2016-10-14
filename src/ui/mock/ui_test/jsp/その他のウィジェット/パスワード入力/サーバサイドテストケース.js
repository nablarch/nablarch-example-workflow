runTest(
  必須属性テスト,
  nameAlias属性のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {

  var target = find_text('required');

  equal(target.label.text().compact(), '必須属性を指定', 'タイトル属性が設定されること');

  if (isConfirmationPage()) {
    equal($.trim(target.input.html()), '*****', '確認画面は*表示されること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');
  } else {
    equal($.trim(target.input.find('input').val()), '', 'password入力欄は空で表示されること');
    ok(!target.error.find('div.nablarch_error').is('*'), 'エラーはないこと');

    // 確認画面の表示テスト用に、パスワード入力欄に自動的に値を設定しておく
    // 確認画面のテストでは、この値がマスクされて表示されることをアサートする。
    target.input.find('input').val('12345');
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
        equal(target.input.find('input.nablarch_error').length, 1, 'nablarch_errorクラスが設定されること');
        ok(target.error.find('div.nablarch_error').is('*'), 'エラーメッセージが表示せれること');
      }
    },
    nameAlias: function(testCase) {
      var target = find_text(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 1, 'nablarch_errorクラスが設定されること');
        ok(!target.error.find('div.nablarch_error').is('*'), 'エラーメッセージは表示されないこと');
      }
    }
  };

  test.nonNameAlias('not-nameAlias');
  test.nonNameAlias('nameAlias-blank');
  test.nameAlias('nameAlias');
}

function find_text(test_case) {
  var $test = $('span.test-case.' + test_case)
    , $text_div = $test.next('.field.password');

  return {
    label: $text_div.find('label'),
    input: $text_div.find('div.field-content'),
    error: $text_div.find('div.fielderror')
  }
}
