runTest(
  必須属性のテスト
  , cssClass属性のテスト_未指定
  , cssClass属性のテスト_ブランク指定
  , cssClass属性のテスト_class属性指定
  , disabled属性のテスト_未指定
  , disabled属性のテスト_ブランク指定
  , disabled属性のテスト_false指定
  , disabled属性のテスト_true指定
  , readonly属性のテスト_未指定
  , readonly属性のテスト_ブランク
  , readonly属性のテスト_false指定
  , readonly属性のテスト_true指定
  , width属性のテスト_未指定
  , width属性のテスト_ブランク
  , width属性のテスト_指定
  , valueとkey属性のテスト_未指定
  , valueとkey属性のテスト_ブランク
  , valueとkey属性のテスト_指定
  , colspan属性のテスト_未指定
  , colspan属性のテスト_ブランク
  , colspan属性のテスト_指定
  , rowspan属性のテスト_未指定
  , rowspan属性のテスト_ブランク
  , rowspan属性のテスト_指定
);

function 必須属性のテスト() {
  var test = findTest('必須属性指定');

  equal($(test.radioHeader).text().trim(), '必須属性をした場合のタイトル', 'title');
}

function cssClass属性のテスト_class属性ブランク(caseName) {
  var test = findTest(caseName);

  if (isConfirmationPage()) {
    ok(true, '確認画面でのアサート項目なし');
    return;
  }

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal($(test.radioHeader).attr('class').trim(), '', 'thのクラス属性');

  test.radioRows.each(function (index, row) {
    var $row = $(row);
    equal($row.attr('class').trim(), '', (index + 1) + "行目");
  });
}

function cssClass属性のテスト_未指定() {
  cssClass属性のテスト_class属性ブランク('cssClass属性未指定');
}

function cssClass属性のテスト_ブランク指定() {
  cssClass属性のテスト_class属性ブランク('cssClass属性ブランク');
}

function cssClass属性のテスト_class属性指定() {
  var test = findTest('cssClass属性指定');

  if (isConfirmationPage()) {
    ok(true, '確認画面でのアサート項目なし');
    return;
  }

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal($(test.radioHeader).attr('class').trim(), 'red-line', 'thのクラス属性');

  test.radioRows.each(function (index, row) {
    var $row = $(row);
    equal($row.attr('class').trim(), 'red-line', (index + 1) + "行目");
  });
}

function disabled属性のテスト_操作可能(testCase) {
  var test = findTest(testCase);

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {
    equal($(test.radioRows[0]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[1]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[2]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[3]).text().trim(), '●', '選択された項目の値がサーバに送信されること');
  } else {
    test.radioRows.each(function (index, row) {
      var $row = $(row)
        , $radio = $row.find('input[type=radio]')
        , rowNo = (index + 1);
      ok(!$radio.prop('disabled'), rowNo + "行目");

      ok(!$radio.prop('checked'), rowNo + "行目：未選択");
      $radio.click();
      ok($radio.prop('checked'), rowNo + "行目：チェックできること");
    });
  }
}

function disabled属性のテスト_未指定() {
  disabled属性のテスト_操作可能('disable未指定');
}

function disabled属性のテスト_ブランク指定() {
  disabled属性のテスト_操作可能('disableブランク');
}

function disabled属性のテスト_false指定() {
  disabled属性のテスト_操作可能('disable_false');
}

function disabled属性のテスト_true指定() {
  var test = findTest('disable_true');
  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {

    equal($(test.radioRows[0]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[1]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[2]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[3]).text().trim(), '', '選択状態の項目だが、disabledになっているので値はサーバに送信されない');
  } else {
    test.radioRows.each(function (index, row) {
      var $row = $(row)
        , $radio = $row.find('input[type=radio]')
        , rowNo = (index + 1);

      ok($radio.prop('disabled'), rowNo + "行目");

      ok(!$radio.prop('checked'), rowNo + "行目：未選択");
      $radio.click();
      ok(!$radio.prop('checked'), rowNo + "行目：チェックされないこと");

    });
    // サーバに値が送信されないことをテストするために先頭項目を無理やりチェック状態にする。
    $(test.radioRows[0]).find('input').prop('checked', 'checked');
  }
}

function readonly属性のテスト_編集可能(testCase) {
  var test = findTest(testCase);

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {
    equal($(test.radioRows[0]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[1]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[2]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[3]).text().trim(), '●', '選択された項目の値がサーバに送信されること');
  } else {
    test.radioRows.each(function (index, row) {
      var $row = $(row)
        , $radio = $row.find('input[type=radio]')
        , rowNo = (index + 1);

      equal($radio.attr('class').trim(), '', '行目：nablarch_readonlyクラスは設定されないこと');
      ok(!$radio.prop('disabled'), rowNo + "行目：disableではないこと");

      ok(!$radio.prop('checked'), rowNo + "行目：未選択");
      $radio.click();
      ok($radio.prop('checked'), rowNo + "行目：チェックされること");
    });
  }
}

function readonly属性のテスト_未指定() {
  readonly属性のテスト_編集可能('readonly未指定');
}

function readonly属性のテスト_ブランク() {
  readonly属性のテスト_編集可能('readonlyブランク');
}

function readonly属性のテスト_false指定() {
  readonly属性のテスト_編集可能('readonly_false');
}

function readonly属性のテスト_true指定() {
  var test = findTest('readonly_true');

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {
    equal($(test.radioRows[0]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[1]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
    equal($(test.radioRows[2]).text().trim(), '●', '選択された項目の値がサーバに送信されること');
    equal($(test.radioRows[3]).text().trim(), '', '選択されていない項目の値はサーバに送信されないこと');
  } else {
    test.radioRows.each(function (index, row) {
      var $row = $(row)
        , $radio = $row.find('input[type=radio]')
        , rowNo = (index + 1);

      equal($radio.attr('class').trim(), 'nablarch_readonly', '行目：nablarch_readonlyクラスが設定されること');
      ok($radio.prop('disabled'), rowNo + "行目：disabledであること");
      if ($radio.val() === '1003') {
        ok($radio.prop('checked'), rowNo + "行目：選択状態");
        $radio.click();
        ok($radio.prop('checked'), rowNo + "行目：チェックされた状態であること");
      } else {
        ok(!$radio.prop('checked'), rowNo + "行目：未選択");
        $radio.click();
        ok(!$radio.prop('checked'), rowNo + "行目：チェックされないこと");
      }
    });
  }
}

function width属性のテスト_width属性ブランク(testCase) {
  var test = findTest(testCase)
    , style = $(test.radioHeader).attr('style') || '';

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  ok(!style.has('width'), 'width属性は設定されないこと');

  test.radioRows.each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1)
      , style = $row.attr('style') || '';

    ok(!style.has('width'), rowNo + '行目：style属性にwidthは設定されないこと');
  });
}

function width属性のテスト_未指定() {
  width属性のテスト_width属性ブランク('width未指定');
}

function width属性のテスト_ブランク() {
  width属性のテスト_width属性ブランク('widthブランク');
}

function width属性のテスト_指定() {
  var test = findTest('width指定');

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  equal($(test.radioHeader).css('width'), '123px');

  test.radioRows.each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1);

    equal($row.css('width'), '123px', rowNo + '行目：style属性にwidthが設定されること');
  });
}


function value属性のテスト_resultSetからvalue値が設定されるパターン(testCase) {
  var test = findTest(testCase);

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {
    return;
  }

  test.radioRows.each(function (index, row) {
    var $radio = $(row).find('input[type=radio]')
      , expected = $(test.labelRows[index]).text().trim()
      , rowNo = (index + 1);

    equal($radio.val(), expected, rowNo + '行目：keyに対応する値がvalueに設定されること');
  });
}

function valueとkey属性のテスト_未指定() {
  value属性のテスト_resultSetからvalue値が設定されるパターン('value未指定');
}

function valueとkey属性のテスト_ブランク() {
  value属性のテスト_resultSetからvalue値が設定されるパターン('valueブランク');
}

function valueとkey属性のテスト_指定() {
  var test = findTest('value指定');

  equal($(test.radioHeader).text().trim(), '選択', 'title');

  if (isConfirmationPage()) {
    return;
  }

  test.radioRows.each(function (index, row) {
    var $radio = $(row).find('input[type=radio]')
      , rowNo = (index + 1);

    equal($radio.val(), 'abcdefg', rowNo + '行目：value属性に指定した値がvalue値となること');
  });
}

function colspan属性のテスト_colspanがブランクとなるパターン(testCase) {
  var test = findTest(testCase)
    colspan = $(test.radioHeader).attr('colspan').trim() || '1';

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal(colspan, '1', 'タイトル部のcolspanは"1"になること');

  test.radioRows.each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1)
      , colspan = $row.attr('colspan').trim() || '1';

    equal(colspan, '1', rowNo + '行目：のcolspanは"1"になること');
  });
}

function colspan属性のテスト_未指定() {
  colspan属性のテスト_colspanがブランクとなるパターン('colspan未指定');
}

function colspan属性のテスト_ブランク() {
  colspan属性のテスト_colspanがブランクとなるパターン('colspanブランク');
}

function colspan属性のテスト_指定() {
  var test = findTest('colspan指定');

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal($(test.radioHeader).attr('colspan').trim(), '123', 'タイトル部のcolspanは指定した値になること');

  test.radioRows.each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1);

    equal($row.attr('colspan').trim(), '123', rowNo + '行目：のcolspanは指定した値になること');
  });
}

function rowspan属性のテスト_rowspanがブランクとなるパターン(testCase) {
  var test = findTest(testCase)
    rowspan = $(test.radioHeader).attr('rowspan').trim() || '1';

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal(rowspan, '1', 'タイトル部のrowspanは"1"になること');

  test.radioRows.each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1)
      , rowspan = $row.attr('rowspan').trim() || '1';

    equal(rowspan, '1', rowNo + '行目：のrowspanは"1"になること');
  });
}

function rowspan属性のテスト_未指定() {
  rowspan属性のテスト_rowspanがブランクとなるパターン('rowspan未指定')
}

function rowspan属性のテスト_ブランク() {
  rowspan属性のテスト_rowspanがブランクとなるパターン('rowspanブランク')
}

function rowspan属性のテスト_指定() {
  var test = findTest('rowspan指定');

  equal($(test.radioHeader).text().trim(), '選択', 'title');
  equal($(test.radioHeader).attr('rowspan').trim(), '2', 'タイトル部のrowspanが設定されること');


  test.radioRows.filter(function() { return $(this).find('input').is('*')}).each(function (index, row) {
    var $row = $(row)
      , rowNo = (index + 1);

    equal($row.attr('rowspan').trim(), '2', rowNo + '行目：のrowspanが設定されること');
  });
}

/**
 * テスト対象のテーブルの情報を取得する。
 *
 * @param caseName ケース名
 * @returns {{table: *, radioHeader: *, radioRows: *}}
 */
function findTest(caseName) {
  var $testCase = $('.test-case.' + caseName)
    , $table = $testCase.nextAll('div.nablarch_listSearchResultWrapper').first().find('table')
    , $radioCol = $table.find('tr').not('.nablarch_AdditionalColumnInlay').find('td:nth-child(1), th:nth-child(1)')
    , $labelCol = $table.find('tr').not('.nablarch_AdditionalColumnInlay').find('td:nth-child(2), th:nth-child(2)');

  return {
    table      : $table,
    radioHeader: $radioCol[0],
    radioRows  : $radioCol.slice(1),
    labelRows  : $labelCol.slice(1)
  };
}

