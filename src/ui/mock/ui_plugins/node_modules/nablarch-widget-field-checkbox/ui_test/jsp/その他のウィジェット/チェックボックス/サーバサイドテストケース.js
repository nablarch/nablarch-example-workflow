runTest(
  必須属性テスト,
  nameAlias属性のテスト,
  elementLabelPattern属性のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {
  var target = find_test('required')
    , labels = ['ラベル1', 'ラベル2' , 'ラベル3' ]
    , values = ['値1', '値2', '値3'];

  equal(target.label.text().compact(), '必須属性を指定', 'タイトル属性が設定されること');

  if (isConfirmationPage()) {
    equal(target.input.text().compact(), 'ラベル1', 'divのボディ部に入力値が表示されていること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');
  } else {
    equal(target.input.find('input').length, 3, 'チェックボックスが3つ出力されること');

    values.each(function (value, index) {
      var $checkbox = $(target.input.find('input:checkbox')[index]);
      equal($checkbox.val(), value, 'value属性が正しく設定されていること');
      equal($checkbox.next('label').text().trim(), labels[index], 'labelが正しく設定されていること');
    });

    ok($(target.input.find("input:checkbox")[0]).attr('checked'), '値1のみチェック状態であること');
    ok(!target.error.find('div.nablarch_error').is('*'), 'エラーはないこと');
  }
}

/**
 * nameAlias属性のテスト
 */
function nameAlias属性のテスト() {
  var test = {
    nonNameAlias: function (testCase) {
      var target = find_test(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 3, 'nablarch_errorクラスが設定されること');
        equal(target.error.find('div.nablarch_error').length, 1, 'エラーメッセージが表示せれること');
      }
    },
    nameAlias   : function (testCase) {
      var target = find_test(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.is('*'), 'エラー表示領域そのものが存在しないこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 3, 'nablarch_errorクラスが設定されること');
        ok(!target.error.find('div.nablarch_error').is('*'), 'エラーメッセージは表示されないこと');
      }
    }
  };

  test.nonNameAlias('not-nameAlias');
  test.nonNameAlias('nameAlias-blank');
  test.nameAlias('nameAlias');
}

function elementLabelPattern属性のテスト() {
  var labels = ['ラベル1', 'ラベル2' , 'ラベル3' ]
    , formatLabels = ['値1 - ラベル1', '値2 - ラベル2' , '値3 - ラベル3' ]
    , values = ['値1', '値2', '値3']
    , assertLabel = function (testCase, expectedLabels) {
      var target = find_test(testCase)
        , $checkboxes = target.input.find('input:checkbox');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), expectedLabels.join(''), 'divのボディ部に入力値が表示されていること');
      } else {
        $checkboxes.each(function (index, checkbox) {
          var $checkbox = $(checkbox)
            , labelText = $checkbox.next('label').text().compact();

          equal($checkbox.val(), values[index], target.testCase + ':value属性が設定されていること');
          equal(labelText, expectedLabels[index], target.testCase + ':labelが正しく設定されていること');
        });
      }
    };

  assertLabel('elementLabelPattern-none', labels);
  assertLabel('elementLabelPattern-blank', labels);
  assertLabel('elementLabelPattern-not-blank', formatLabels);
}

function find_test(test_case) {
  var $test = $('span.test-case.' + test_case)
    , $text_div = $test.next('.field.checkboxes');

  return {
    testCase: $test.text(),
    label: $text_div.children('label'),
    input: $text_div.find('div.field-content'),
    error: $text_div.find('div.fielderror')
  }
}
