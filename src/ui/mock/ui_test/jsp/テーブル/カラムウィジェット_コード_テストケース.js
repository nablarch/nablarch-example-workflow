  runTest(
      必須属性のみ指定した場合のテスト
    , cssClass属性のテスト
    , sortable属性のテスト
    , listFormat属性のテスト
    , width属性のテスト
    , additional属性のテスト
  );

  var $all_nodes
   ,  paging_navi_area = "div.nablarch_paging"
   ,  label = 'h2'
   ,  inlay   = {
        record : ".nablarch_AdditionalColumnInlay"
      }
   ,  visible = {
        tr : 'tr:not('+inlay.record+')'
      , td : 'td:not(.nablarch_AdditionalColumnInlayToggle)'
      , th : 'th:not(.nablarch_AdditionalColumnInlayToggle)'
      };

  function setup() {
    $all_nodes = $('span.test-case, div.title, div.nablarch_listSearchResultWrapper');
  }

  function 必須属性のみ指定した場合のテスト() {
    setup();
    var cases = test_for('require_only-test')
     ,  require_only = cases[0];

    equal($.trim(require_only.title.find(label).text()), "必須属性（全てのカラムウィジェットを纏めて実施）", require_only.testcase + " [title label]");
  }

  function cssClass属性のテスト() {
    setup();
    var cases = test_for('cssClass-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_css_case = cases[2]
      , assertIsBlank = function(case_description) {
          return function () {
            ok($(this).attr('class').isBlank(), case_description);
          };
        }
      , assertClass = function(clazz, case_description) {
          return function () {
            equal($.trim($(this).attr('class')), clazz, case_description);
          };
        };

    default_case.table.find(visible.tr).find(visible.td).each(assertIsBlank(default_case.testcase));
    default_case.table.find(visible.tr).find(visible.td).each(assertIsBlank(default_case.testcase));
    blank_case.table.find(visible.tr).find(visible.td).each(assertIsBlank(blank_case.testcase));
    blank_case.table.find(visible.tr).find(visible.th).each(assertIsBlank(blank_case.testcase));
    // 指定したカラムのみ設定されること
    set_css_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertClass('border-red', set_css_case.testcase));
    set_css_case.table.find(visible.tr).find(visible.th).filter(':eq(0)').each(assertClass('border-red', set_css_case.testcase));
    set_css_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertIsBlank(set_css_case.testcase));
    set_css_case.table.find(visible.tr).find(visible.th).filter(':eq(1)').each(assertIsBlank(set_css_case.testcase));
  }

  function sortable属性のテスト() {
    setup();
    var cases = test_for('sortable-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , false_case   = cases[2]
      , true_case    = cases[3]
      , assertNotLink = function(case_description) {
          return function() {
            equal($(this).find('a').size(), 0, case_description);
          };
        }
      , assertLinkCount = function(count, case_description) {
          return function() {
            equal($(this).find('a').size(), count, case_description);
          };
        };

    default_case.table.find('tr:first').find('th').each(assertNotLink(default_case.testcase));
    blank_case.table.find('tr:first').find('th').each(assertNotLink(blank_case.testcase));
    false_case.table.find('tr:first').find('th').each(assertNotLink(false_case.testcase));
    // 指定したカラムのみ設定されること
    true_case.table.find('tr:first').find('th:eq(0)').each(assertLinkCount(1, true_case.testcase));
    true_case.table.find('tr:first').find('th:eq(1)').each(assertNotLink(true_case.testcase));
  }

  function listFormat属性のテスト() {
    setup();
    var cases = test_for('listFormat-test')
     ,  default_case = cases[0]
     ,  blank_case   = cases[1]
     ,  set_sp_case  = cases[2]
     ,  set_br_case  = cases[3]
     ,  assertSpFormat = function(case_description) {
          return function() {
            ok($(this).html().has("&nbsp;") &&
              !$(this).html().has("<br>"), case_description);
          };
        }
     ,  assertBrFormat = function(case_description) {
         return function() {
             ok(!$(this).html().has("&nbsp;") &&
                 $(this).html().toLowerCase().has("<br>"), case_description);
           };
        }
     ,  multi_data_record = ':eq(2)';

     default_case.table.find(visible.tr).filter(multi_data_record).find(visible.td).each(assertSpFormat(default_case.testcase));
     blank_case.table.find(visible.tr).filter(multi_data_record).find(visible.td).each(assertSpFormat(blank_case.testcase));
     set_sp_case.table.find(visible.tr).filter(multi_data_record).find(visible.td).each(assertSpFormat(set_sp_case.testcase));
     // 指定したカラムのみ設定されること
     set_br_case.table.find(visible.tr).filter(multi_data_record).find(visible.td).filter(':eq(0)').each(assertBrFormat(set_br_case.testcase));
     set_br_case.table.find(visible.tr).filter(multi_data_record).find(visible.td).filter(':eq(1)').each(assertSpFormat(set_br_case.testcase));
  }

  function width属性のテスト() {
    setup();
    var cases = test_for('width-test')
     ,  default_case = cases[0]
     ,  blank_case   = cases[1]
     ,  set_case  = cases[2]
     ,  assertWidth  = function(testcase, expected) {
          return function(i) {
            var style = this.style
             ,  key;
            for (key in expected) {
              if (expected.hasOwnProperty(key)) {
                equal(style[key], expected[key], testcase.testcase + style[key]);
              }
            }
          };
        };
    default_case.table.find(visible.th).each(assertWidth(default_case, ''));
    blank_case.table.find(visible.th).each(assertWidth(blank_case, ''));
    set_case.table.find(visible.th).filter(':eq(0)').each(assertWidth(set_case,  {'width' : '100px'}));
    set_case.table.find(visible.th).filter(':eq(1)').each(assertWidth(set_case,  {'width' : '30%'}));
    set_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertWidth(set_case, {'width' : '100px'}));
    set_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertWidth(set_case, {'width' : '30%'}));
  }

  function additional属性のテスト() {
    var testcases = test_for('additional-test')
      , non   = testcases[0]
      , blank = testcases[1]
      , False = testcases[2]
      , True  = testcases[3]
      , multi = testcases[4]
      , dataRowNum = function(table) {
          var $row   = table.find(visible.tr)
            , all    = $row.length
            , header = $row.filter(':has(th)').length;
          return all - header;
        }
      , findAddInfo = function(table) {
          return table.find('tr.nablarch_AdditionalColumnInlay').find('td > div.inlayDataRecord');
        }
      , code   = {
          names  : ["name1-1", "name1-1"+"name1-3", "name1-3", "name1-2"]
        , values : ["value1-1", "value1-1"+"value1-3", "value1-3", "value1-2"]
        , composePatterns : ["オプション：name1-1column:OPTION01(value1-1)-name1-1"
                           , "オプション：name1-1column:OPTION01(value1-1)-name1-1"+"オプション：name1-3column:OPTION01(value1-3)-name1-3"
                           , "オプション：name1-3column:OPTION01(value1-3)-name1-3"
                           , "オプション：name1-2column:OPTION01(value1-2)-name1-2"]
        }
      , assertText = function(node, expected, msg) {
          // $.fn.text を利用しないのはIE8のnbspの問題に対応するため。
          var text = $(node).html().stripTags().remove(/(\s|&nbsp;)+/g);
          ok(text.has(expected), [msg ," text = ", text, ",expected = ", expected].join(' '));
          if (!text.has(expected)) {

          }
      };

    // non
    equal(non.table.find("td.additional").length, 0, non.testcase +"[td.additional]");
    equal(findAddInfo(non.table).length, 0, non.testcase +"[td.addInfo]");
    non.table.find(visible.tr).find(visible.td+":eq(1)").each(function(i) {
      assertText(this, code.names[i], non.testcase + "(normal)[ "+i+" ]");
    });

    // blank
    equal(blank.table.find("td.additional").length, 0, blank.testcase +"[td.additional]");
    equal(findAddInfo(blank.table).length, 0, blank.testcase +"[td.addInfo]");
    blank.table.find(visible.tr).find(visible.td+":eq(1)").each(function(i) {
      assertText(this, code.names[i], blank.testcase + "(normal)[ "+i+" ]");
    });

    // false
    equal(False.table.find("td.additional").length, 0, False.testcase +"[td.additional]");
    equal(findAddInfo(False.table).length, 0, False.testcase +"[td.addInfo]");
    False.table.find(visible.tr).find(visible.td+":eq(1)").each(function(i) {
      assertText(this, code.names[i], False.testcase + "(normal)[ "+i+" ]");
    });

    // true
    equal(True.table.find("td.additional").length, dataRowNum(True.table), True.testcase +"[td.additional]");
    equal(findAddInfo(True.table).length, dataRowNum(True.table), True.testcase +"[td.addInfo]");
    True.table.find(visible.tr).find(visible.td+":eq(1)").each(function(i) {
      assertText(this, code.names[i], True.testcase + "(normal)[ "+i+" ]");
    });
    True.table.find(inlay.record).find("td").each(function(i){
      assertText(this, "true"+"："+code.names[i], True.testcase + "(inlay)[ "+i+" ]")
    });

    // multi
    equal(multi.table.find("td.additional").length, (dataRowNum(multi.table) * 2), multi.testcase +"[td.additional]");
    equal(findAddInfo(multi.table).length, (dataRowNum(multi.table)*2), multi.testcase +"[td.addInfo]");
    multi.table.find(visible.tr).filter(':has('+visible.td+')').each(function(i){
      assertText($(this).find(':eq(1)'), code.values[i], multi.testcase + "[td.addInfo(value)]");
      assertText($(this).find('td:eq(2)'), code.composePatterns[i], multi.testcase + "[td.addInfo(compose)]")
    });
  }

  function not(selectExpr) {
    return ":not(" + selectExpr + ")";
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
           testcase : $.trim($e.text()),
           title    : $($all_nodes[idx + 1]),
           table    : $($all_nodes[idx + 2])
       };
    });
  }
