runTest(
  必須属性テスト,
  nameAlias属性のテスト,
  elementLabelPattern属性のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {
  var target = findTest('required')
    , labels = ['ラベル1', 'ラベル2' , 'ラベル3' ]
    , values = ['値1', '値2', '値3']
    , checked = [false, true, false];

  equal(target.label.text().compact(), '必須属性を指定', 'タイトル属性が設定されること');

  if (isConfirmationPage()) {

    equal(target.input.text().compact(), 'ラベル2', 'divのボディ部に入力値が表示されていること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');

  } else {
    equal(target.input.find('input').length, 3, 'ラジオボタンが3つ出力されること');

    values.each(function (value, index) {
      var $radio = $(target.input.find('input:radio')[index]);

      equal($radio.val(), value, 'value属性が正しく設定されていること');
      equal($radio.next('label').text().trim(), labels[index], 'labelが正しく設定されていること');
      equal($radio.prop('checked'), checked[index], 'チェック状態')
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
        equal(target.input.find('input.nablarch_error').length, 3, 'nablarch_errorクラスが設定されること');
        equal(target.error.find('div.nablarch_error').length, 1, 'エラーメッセージが表示せれること');
      }
    },
    nameAlias   : function (testCase) {
      var target = findTest(testCase);
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
    , assertLabel = function (testCase, expectedLabels, confirmExpectedLabel) {
      var target = findTest(testCase)
        , $radios = target.input.find('input:radio');

      if (isConfirmationPage()) {
        equal(target.input.text().compact(), confirmExpectedLabel, 'divのボディ部に入力値が表示されていること');
      } else {
        $radios.each(function (index, radio) {
          var $radio = $(radio)
            , labelText = $radio.next('label').text().compact();

          equal($radio.val(), values[index], target.testCase + ':value属性が設定されていること');
          equal(labelText, expectedLabels[index], target.testCase + ':labelが正しく設定されていること');
        });
      }
    };

  assertLabel('elementLabelPattern-none', labels, 'ラベル1');
  assertLabel('elementLabelPattern-blank', labels, 'ラベル2');
  assertLabel('elementLabelPattern-not-blank', formatLabels, '値3 - ラベル3');
}

function findTest(testCase) {
  var $test = $('span.test-case.' + testCase)
    , $text_div = $test.next('.field.radios');

  return {
    testCase: $test.text(),
    label: $text_div.children('label'),
    input: $text_div.find('div.field-content'),
    error: $text_div.find('div.fielderror')
  }
}

