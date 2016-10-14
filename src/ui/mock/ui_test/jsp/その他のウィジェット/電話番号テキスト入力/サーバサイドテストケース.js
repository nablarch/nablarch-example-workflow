runTest(
  必須属性テスト
  , nameAlias属性のテスト
  , 編集仕様のテスト
);

/**
 * 必須属性のテスト
 */
function 必須属性テスト() {

  var target = findTestCase('required');

  equal(target.label.text().compact(), '必須属性のテスト', 'タイトル属性が設定されること');

  if (isConfirmationPage()) {
    ok(target.field.html().indexOf('03 - 1234 - 5678') != -1, '入力画面で入力した値が表示されること');
    equal(target.error.length, 0, 'エラー表示領域そのものが存在しないこと');
  } else {
    equal($.trim(target.input.find('input[type=text]').length), 3, '市外、市内、加入者の3つの入力欄が表示されること');
    equal($(target.input.find('input[type=text]')[0]).val(), '03', 'areaName属性に指定した値に対応する市外局番が表示されていること');
    equal($(target.input.find('input[type=text]')[1]).val(), '1234', 'localName属性に指定した値に対応する市内局番が表示されていること');
    equal($(target.input.find('input[type=text]')[2]).val(), '5678', 'subscriberName属性に指定した値に対応する加入者番号が表示されていること');
    ok(!target.error.find('div.nablarch_error').is('*'), 'エラーはないこと');
  }
}

/**
 * nameAlias属性のテスト
 */
function nameAlias属性のテスト() {
  var assertNotNameAlias = function (testCase) {
      var target = findTestCase(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.find('div.nablarch_error').is('*'), testCase + ':確認画面なのでエラー表示はされいこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 3, testCase + ':入力欄がそれぞれエラー表示となること');
        equal(target.error.find('div.nablarch_error').length, 3, testCase + ':それぞれの入力欄に対応する3つのエラーが出力されること');
      }
    },
    assertNameAlias = function (testCase) {
      var target = findTestCase(testCase);
      if (isConfirmationPage()) {
        ok(!target.error.find('div.nablarch_error').is('*'), testCase + ':確認画面なのでエラー表示はされいこと');
      } else {
        equal(target.input.find('input.nablarch_error').length, 3, testCase + ':入力欄がそれぞれエラー表示となること');
        equal(target.error.find('div.nablarch_error').length, 1, testCase + ':nameAliasと一致する単一のエラーメッセージのみ表示されること');

      }
    };
  assertNotNameAlias('nameAlias-nothing');
  assertNotNameAlias('nameAlias-blank');
  assertNameAlias('nameAlias');
}

/**
 * 確認画面での編集仕様のテストを実施する。
 *
 * <ul>
 *   <li>全ての項目入力->ハイフン区切りでフォーマット</li>
 *   <li>入力されていない項目がある->確認画面には何も表示しない</li>
 * </ul>
 */
function 編集仕様のテスト() {
  var assert = function (testCase) {
      var target = findTestCase(testCase);
      if (isConfirmationPage()) {
        ok(target.field.html().indexOf('03 - 1234 - 5678') != -1, testCase + ':入力画面で入力した値が表示されること');
      } else {
        // 入力画面では特に確認は行わない
        ok(true);
      }
    },
    assertBlank = function (testCase, inputTel) {
      var target = findTestCase(testCase);
      if (isConfirmationPage()) {
        equal(target.input.text().compact(), '', ':入力画面で入力された値やハイフンは表示されないこと');
      } else {
        // 入力画面では特に確認は行わない
        ok(true);
      }
    };

  assert('format-all');
  assertBlank('format-all-blank', '-');
  assertBlank('format-area', '03');
  assertBlank('format-local', '1234');
}

function findTestCase(test_case) {
  var $test = $('span.test-case.' + test_case)
    , $text_div = $test.next('.field');

  return {
    field: $text_div,
    label: $text_div.find('label'),
    input: $text_div.find('div.field-content'),
    error: $text_div.find('div.fielderror')
  }
}

