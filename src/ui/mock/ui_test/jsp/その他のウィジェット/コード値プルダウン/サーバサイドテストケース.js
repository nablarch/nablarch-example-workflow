runTest(
  必須属性テスト,
  nameAlias属性のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {
  var target = findTest('required')
    , labels = ['name1-1', 'name1-2' , 'name1-3' ]
    , values = ['value1-1', 'value1-2', 'value1-3']
    , selected = [false, true, false];

  equal(target.label.text().compact(), '必須属性を指定', 'タイトル属性が設定されること');

  if (isConfirmationPage()) {
    equal(target.input.text().compact(), 'name1-2', 'divのボディ部に入力値が表示されていること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');

  } else {
    equal(target.input.find('select > option').length, 3, '要素数がが3つ出力されること');

    values.each(function (value, index) {
      var $option = $(target.input.find('select > option')[index]);
      equal($option.val(), value, 'value属性が正しく設定されていること');
      equal($option.text().trim(), labels[index], 'labelが正しく設定されていること');
      equal($option.prop('selected'), selected[index], 'チェック状態が正しく設定されること')
    });

    ok(!target.error.find('div.nablarch_error').is('*'), 'エラーはないこと');
  }
}

/**
 * nameAlias属性のテスト
 */
function nameAlias属性のテスト() {
  var test = {
    nonNameAlias: function (testCase) {
      var target = findTest(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('select.nablarch_error').length, 1, 'nablarch_errorクラスが設定されること');
        equal(target.error.find('div.nablarch_error').length, 1, 'エラーメッセージが表示せれること');
      }
    },
    nameAlias   : function (testCase) {
      var target = findTest(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('select.nablarch_error').length, 1, 'nablarch_errorクラスが設定されること');
        ok(!target.error.find('div.nablarch_error').is('*'), 'エラーメッセージは表示されないこと');
      }
    }
  };

  test.nonNameAlias('not-nameAlias');
  test.nonNameAlias('nameAlias-blank');
  test.nameAlias('nameAlias');
}


function findTest(testCase) {
  var $test = $('span.test-case.' + testCase)
    , $text_div = $test.next('.field.pulldown');

  return {
    testCase: $test.text(),
    label   : $text_div.find('label'),
    input   : $text_div.find('div.field-content'),
    error   : $text_div.find('div.fielderror')
  }
}
