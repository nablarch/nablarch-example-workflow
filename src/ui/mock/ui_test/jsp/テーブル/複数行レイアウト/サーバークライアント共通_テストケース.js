  runTest(
     必須属性のテスト
   , rowspan属性のテスト_blank
   , rowspan属性のテスト_set_one
   , rowspan属性のテスト_checkbox
   , rowspan属性のテスト_code
   , rowspan属性のテスト_radio
   , rowspan属性のテスト_label
   , rowspan属性のテスト_link
   , colspan属性のテスト_blank
   , colspan属性のテスト_set_one
   , colspan属性のテスト_checkbox
   , colspan属性のテスト_code
   , colspan属性のテスト_radio
   , colspan属性のテスト_label
   , colspan属性のテスト_link
  );

  var $all_nodes
   ,  paging_navi_area = "div.nablarch_paging"
   ,  label = 'h2'
   ,  visible = {
        tr : 'tr:not(.nablarch_AdditionalColumnInlay)'
      , td : 'td:not(.nablarch_AdditionalColumnInlayToggle)'
      , th : 'th:not(.nablarch_AdditionalColumnInlayToggle)'
      };

  function setup() {
    $all_nodes = $('span.test-case, div.title, div.nablarch_listSearchResultWrapper');
  }

  function 必須属性のテスト() {
    setup();
    var testcase = test_for('require-test')[0]
      , $records = testcase.table.find(visible.tr)
      , msg      = testcase.msg
      , $ths        = $records.find(visible.th)
      , $checkboxes = $records.find(visible.td+":eq(0)")
      , $codes      = $records.find(visible.td+":eq(1)")
      , $labels     = $records.find(visible.td+":eq(2)")
      , $radios     = $records.find(visible.td+":eq(3)")
      , $links      = $records.find(visible.td+":eq(4)");

    // table header
    equal(collect($ths, 'rowspan'), '1,1,1,1,1', msg + " [th].rowspan");
    equal(collect($ths, 'colspan'), '1,1,1,1,1', msg + " [th].colspan");
    // column:checkbox
    equal(collect($checkboxes, 'rowspan'), '1,1,1,1', msg + " [col:checkbox.rowspan]");
    equal(collect($checkboxes, 'colspan'), '1,1,1,1', msg + " [col:checkbox.colspan]");
    // column:code
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + " [col:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + " [col:code.colspan]");
    // column:label
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + " [col:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + " [col:label.colspan]");
    // column:radio
    equal(collect($radios, 'rowspan'), '1,1,1,1', msg + " [col:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + " [col:radio.colspan]");
    // column:link
    equal(collect($links, 'rowspan'), '1,1,1,1', msg + " [col:link.rowspan]");
    equal(collect($links, 'colspan'), '1,1,1,1', msg + " [col:link.colspan]");
  }

  function rowspan属性のテスト_blank() {
    var testcase = test_for("rowspan-blank-test")[0]
      , $records = testcase.table.find(visible.tr)
      , msg      = testcase.msg
      , $ths        = $records.find(visible.th)
      , $checkboxes = $records.find(visible.td+":eq(0)")
      , $codes      = $records.find(visible.td+":eq(1)")
      , $labels     = $records.find(visible.td+":eq(2)")
      , $radios     = $records.find(visible.td+":eq(3)")
      , $links      = $records.find(visible.td+":eq(4)");

    // table header
    equal(collect($ths, 'rowspan'), '1,1,1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1,1,1', msg + "[th.colspan]");
    // column:checkbox
    equal(collect($checkboxes, 'rowspan'), '1,1,1,1', msg + "[td:checkbox.rowspan]");
    equal(collect($checkboxes, 'colspan'), '1,1,1,1', msg + "[td:checkbox.colspan]");
    // column:code
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");
    // column:label
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
    // column:radio
    equal(collect($radios, 'rowspan'), '1,1,1,1', msg + "[td:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + "[td:radio.colspan]");
    // column:link
    equal(collect($links, 'rowspan'), '1,1,1,1', msg + "[td:link.rowspan]");
    equal(collect($links, 'colspan'), '1,1,1,1', msg + "[td:link.colspan]");
  }

  function rowspan属性のテスト_set_one() {
    var testcase = test_for("rowspan-set-one-test")[0]
      , $records = testcase.table.find(visible.tr)
      , msg      = testcase.msg
      , $ths        = $records.find(visible.th)
      , $checkboxes = $records.find(visible.td+":eq(0)")
      , $codes      = $records.find(visible.td+":eq(1)")
      , $labels     = $records.find(visible.td+":eq(2)")
      , $radios     = $records.find(visible.td+":eq(3)")
      , $links      = $records.find(visible.td+":eq(4)");

    // table header
    equal(collect($ths, 'rowspan'), '1,1,1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1,1,1', msg + "[th.colspan]");
    // column:checkbox
    equal(collect($checkboxes, 'rowspan'), '1,1,1,1', msg + "[td:checkbox.rowspan]");
    equal(collect($checkboxes, 'colspan'), '1,1,1,1', msg + "[td:checkbox.colspan]");
    // column:code
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");
    // column:label
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
    // column:radio
    equal(collect($radios, 'rowspan'), '1,1,1,1', msg + "[td:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + "[td:radio.colspan]");
    // column:link
    equal(collect($links, 'rowspan'), '1,1,1,1', msg + "[td:link.rowspan]");
    equal(collect($links, 'colspan'), '1,1,1,1', msg + "[td:link.colspan]");
  }

  function rowspan属性のテスト_checkbox() {
    var testcase = test_for('rowspan-checkbox-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths      = $records.find(visible.th)
      , $checkbox = $records.find(visible.td+":eq(0)").filter(':even')
      , $code     = $records.find(visible.td+":eq(0)").filter(':odd')
      , $label    = $records.find(visible.td+":eq(1)");

    // table header
    equal(collect($ths, 'rowspan'), '2,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1', msg + "[th.colspan]");

    // column:checkbox
    equal(collect($checkbox, 'rowspan'), '2,2,2,2', msg + "[td:checkbox.rowspan]");
    equal(collect($checkbox, 'colspan'), '1,1,1,1', msg + "[td:checkbox.colspan]");

    // column:code 影響しないことを確認
    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");

    // column:label 影響しないことを確認
    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($label, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");
  }

  function rowspan属性のテスト_code() {
    var testcase = test_for('rowspan-code-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths      = $records.find(visible.th)
      , $codes2   = $records.find(visible.td+":eq(0)").filter(':even')
      , $code     = $records.find(visible.td+":eq(0)").filter(':odd')
      , $label    = $records.find(visible.td+":eq(1)");

    // table header
    equal(collect($ths, 'rowspan'), '2,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1', msg + "[th.colspan]");

    // column:code
    equal(collect($codes2, 'rowspan'), '2,2,2,2', msg + "[td:code.rowspan]");
    equal(collect($codes2, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");

    // column:code 影響しないことを確認
    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td:code_2.rowspan]");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td:code_2.colspan]");

    // column:label 影響しないことを確認
    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($label, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
  }

  function rowspan属性のテスト_radio() {
    var testcase = test_for('rowspan-radio-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths      = $records.find(visible.th)
      , $radios   = $records.find(visible.td+":eq(0)").filter(':even')
      , $codes    = $records.find(visible.td+":eq(0)").filter(':odd')
      , $labels   = $records.find(visible.td+":eq(1)");

    // table header
    equal(collect($ths, 'rowspan'), '2,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1', msg + "[th.colspan]");

    // column:radio
    equal(collect($radios, 'rowspan'), '2,2,2,2', msg + "[td:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + "[td:radio.colspan]");

    // column:code 影響しないことを確認
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code_2.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code_2.colspan]");

    // column:label 影響しないことを確認
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
  }

  function rowspan属性のテスト_label() {
    var testcase = test_for('rowspan-label-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths      = $records.find(visible.th)
      , $labels2  = $records.find(visible.td+":eq(0)").filter(':even')
      , $codes    = $records.find(visible.td+":eq(0)").filter(':odd')
      , $labels   = $records.find(visible.td+":eq(1)");

    // table header
    equal(collect($ths, 'rowspan'), '2,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1', msg + "[th.colspan]");

    // column:label
    equal(collect($labels2, 'rowspan'), '2,2,2,2', msg + "[td:label.rowspan]");
    equal(collect($labels2, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");

    // column:code 影響しないことを確認
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");

    // column:label 影響しないことを確認
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
  }

  function rowspan属性のテスト_link() {
    var testcase = test_for('rowspan-link-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg;

    // table header
    equal(collect($records.find(visible.th), 'rowspan'), '2,1,1', msg + "[th.rowspan]");
    equal(collect($records.find(visible.th), 'colspan'), '1,1,1', msg + "[th.colspan]");

    // column:link
    equal(collect($records.find(visible.td+":eq(0)").filter(':even'), 'rowspan'), '2,2,2,2', msg + "[td:link.rowspan]");
    equal(collect($records.find(visible.td+":eq(0)").filter(':even'), 'colspan'), '1,1,1,1', msg + "[td:link.colspan]");

    // column:code 影響しないことを確認
    equal(collect($records.find(visible.td+":eq(0)").filter(':odd'), 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($records.find(visible.td+":eq(0)").filter(':odd'), 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");

    // column:label 影響しないことを確認
    equal(collect($records.find(visible.td+":eq(1)"), 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($records.find(visible.td+":eq(1)"), 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
  }

  function colspan属性のテスト_blank() {
    var testcase = test_for('colspan-blank-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths        = $records.find(visible.th)
      , $checkboxes = $records.find(visible.td+":eq(0)")
      , $codes      = $records.find(visible.td+":eq(1)")
      , $labels     = $records.find(visible.td+":eq(2)")
      , $radios     = $records.find(visible.td+":eq(3)")
      , $links      = $records.find(visible.td+":eq(4)");

    // table header
    equal(collect($ths, 'rowspan'), '1,1,1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1,1,1', msg + "[th.colspan]");
    // column:checkbox
    equal(collect($checkboxes, 'rowspan'), '1,1,1,1', msg + "[td:checkbox.rowspan]");
    equal(collect($checkboxes, 'colspan'), '1,1,1,1', msg + "[td:checkbox.colspan]");
    // column:code
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");
    // column:label
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
    // column:radio
    equal(collect($radios, 'rowspan'), '1,1,1,1', msg + "[td:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + "[td:radio.colspan]");
    // column:link
    equal(collect($links, 'rowspan'), '1,1,1,1', msg + "[td:link.rowspan]");
    equal(collect($links, 'colspan'), '1,1,1,1', msg + "[td:link.colspan]");

  }

  function colspan属性のテスト_set_one() {
    var testcase = test_for('colspan-set-one-test')[0]
      , $records  = testcase.table.find(visible.tr)
      , msg       = testcase.msg
      , $ths        = $records.find(visible.th)
      , $checkboxes = $records.find(visible.td+":eq(0)")
      , $codes      = $records.find(visible.td+":eq(1)")
      , $labels     = $records.find(visible.td+":eq(2)")
      , $radios     = $records.find(visible.td+":eq(3)")
      , $links      = $records.find(visible.td+":eq(4)");

    // table header
    equal(collect($ths, 'rowspan'), '1,1,1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '1,1,1,1,1', msg + "[th.colspan]");
    // column:checkbox
    equal(collect($checkboxes, 'rowspan'), '1,1,1,1', msg + "[td:checkbox.rowspan]");
    equal(collect($checkboxes, 'colspan'), '1,1,1,1', msg + "[td:checkbox.colspan]");
    // column:code
    equal(collect($codes, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($codes, 'colspan'), '1,1,1,1', msg + "[td:code.colspan]");
    // column:label
    equal(collect($labels, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($labels, 'colspan'), '1,1,1,1', msg + "[td:label.colspan]");
    // column:radio
    equal(collect($radios, 'rowspan'), '1,1,1,1', msg + "[td:radio.rowspan]");
    equal(collect($radios, 'colspan'), '1,1,1,1', msg + "[td:radio.colspan]");
    // column:link
    equal(collect($links, 'rowspan'), '1,1,1,1', msg + "[td:link.rowspan]");
    equal(collect($links, 'colspan'), '1,1,1,1', msg + "[td:link.colspan]");
  }

  function colspan属性のテスト_checkbox() {
    var testcase = test_for('colspan-checkbox-test')[0]
      , $records = testcase.table.find(visible.tr)
      , msg      = testcase.msg
      , $ths     = $records.find(visible.th)
      , $checkbox = $records.filter(':even').find(visible.td)
      , $code     = $records.filter(':odd').find(visible.td+":eq(0)")
      , $label    = $records.filter(':odd').find(visible.td+":eq(1)");

    equal(collect($ths, 'rowspan'), '1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '2,1,1', msg + "[th.rowspan]");

    equal(collect($checkbox, 'rowspan'), '1,1,1,1', msg + "[td:checkbox.rowspan]");
    equal(collect($checkbox, 'colspan'), '2,2,2,2', msg + "[td:checkbox.colspan]");

    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td:code.colspan");

    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan");
    equal(collect($label, 'colspan'), '1,1,1,1', msg + "[td:label.colspan");

  }

  function colspan属性のテスト_code() {
    var testcase = test_for('colspan-code-test')[0]
     ,  $records = testcase.table.find(visible.tr)
     ,  msg       = testcase.msg
     ,  $ths      = $records.find(visible.th)
     ,  $code     = $records.filter(':even').find(visible.td)
     ,  $checkbox = $records.filter(':odd').find(visible.td+":eq(0)")
     ,  $label    = $records.filter(':odd').find(visible.td+":eq(1)");

    equal(collect($ths, 'rowspan'), '1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '2,1,1', msg + "[th.colspan]");

    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td:code.rowspan]");
    equal(collect($code, 'colspan'), '2,2,2,2', msg + "[td:code.colspan]");

    equal(collect($checkbox, 'rowspan'), '1,1,1,1', msg + "[td.checkbox.rowspan]");
    equal(collect($checkbox, 'colspan'), '1,1,1,1', msg + "[td.checkbox.colspan]");

    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td.label.rowspan]");
    equal(collect($label, 'colspan'), '1,1,1,1', msg + "[td.label.colspan]");
  }

  function colspan属性のテスト_radio() {
    var testcase = test_for('colspan-radio-test')[0]
     ,  $records = testcase.table.find(visible.tr)
     ,  msg       = testcase.msg
     ,  $ths      = $records.find(visible.th)
     ,  $radio  = $records.filter(':even').find(visible.td)
     ,  $code   = $records.filter(':odd').find(visible.td+":eq(0)")
     ,  $label  = $records.filter(':odd').find(visible.td+":eq(1)");

    equal(collect($ths, 'rowspan'), '1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '2,1,1', msg + "[th.colspan]");

    equal(collect($radio, 'rowspan'), '1,1,1,1', msg + "[td:radio.rowspan]");
    equal(collect($radio,  'colspan'), '2,2,2,2', msg + "[td:radio.colspan]");

    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td.code.rowspan]");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td.code.colspan]");

    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td.label.rowspan]");
    equal(collect($label, 'colspan'), '1,1,1,1', msg + "[td.label.colspan]");
  }

  function colspan属性のテスト_label() {
    var testcase = test_for('colspan-label-test')[0]
     ,  $records = testcase.table.find(visible.tr)
     ,  msg       = testcase.msg
     ,  $ths      = $records.find(visible.th)
     ,  $label  = $records.filter(':even').find(visible.td)
     ,  $code   = $records.filter(':odd').find(visible.td+":eq(0)")
     ,  $link   = $records.filter(':odd').find(visible.td+":eq(1)");

    equal(collect($ths, 'rowspan'), '1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '2,1,1', msg + "[th.colspan]");

    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($label,  'colspan'), '2,2,2,2', msg + "[td:label.colspan]");

    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td.code.rowspan]");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td.code.colspan]");

    equal(collect($link, 'rowspan'), '1,1,1,1', msg + "[td.link.rowspan]");
    equal(collect($link, 'colspan'), '1,1,1,1', msg + "[td.link.colspan]");
  }

  function colspan属性のテスト_link() {
    var testcase = test_for('colspan-link-test')[0]
     ,  $records = testcase.table.find(visible.tr)
     ,  msg       = testcase.msg
     ,  $ths      = $records.find(visible.th)
     ,  $link   = $records.filter(':even').find(visible.td)
     ,  $code   = $records.filter(':odd').find(visible.td+":eq(0)")
     ,  $label  = $records.filter(':odd').find(visible.td+":eq(1)");

    equal(collect($ths, 'rowspan'), '1,1,1', msg + "[th.rowspan]");
    equal(collect($ths, 'colspan'), '2,1,1', msg + "[th.colspan]");

    equal(collect($link, 'rowspan'), '1,1,1,1', msg + "[td.link.rowspan]");
    equal(collect($link, 'colspan'), '2,2,2,2', msg + "[td.link.colspan]");

    equal(collect($code, 'rowspan'), '1,1,1,1', msg + "[td.code.rowspan]");
    equal(collect($code, 'colspan'), '1,1,1,1', msg + "[td.code.colspan]");

    equal(collect($label, 'rowspan'), '1,1,1,1', msg + "[td:label.rowspan]");
    equal(collect($label,  'colspan'), '1,1,1,1', msg + "[td:label.colspan]");

  }


  /**
   * rowspan or colspanを取得するのに利用する補助関数。
   *
   * @param wrapSet jQueryのラップセット。$(td, tr, table)をください。
   * @param type {String} rowspan or colspan
   */
  function collect(wrapSet, type) {
    return wrapSet.map(function() {return $(this).attr(type) || "1";}).get().join(',');
  }

  /**
   * カラムウィジェット_コードのwidgetから出力されたテストケースの情報を取得する。
   * @param case_id テストケースのID
   * @returns テストケース内に定義された確認ボタン
   */
  function test_for(case_id) {
    var $cases = $all_nodes.filter('span.test-case.' + case_id);
    return $cases.map(function() {
       var $e = $(this)
        ,  idx = $all_nodes.index($e);
       return {
           msg   : $.trim($e.text()),
           title : $($all_nodes[idx + 1]),
           table : $($all_nodes[idx + 2])
       };
    });
  }
