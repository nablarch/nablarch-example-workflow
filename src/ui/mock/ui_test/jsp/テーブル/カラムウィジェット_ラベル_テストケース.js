  runTest(
      必須属性のみ指定した場合のテスト
    , cssClass属性のテスト
    , sortable属性のテスト
    , domain属性のテスト
    , width属性のテスト
    , value属性のテスト
    , valueFormat属性テスト
    , autospan属性テスト
    , additional属性のテスト
  );

  var $all_nodes
   ,  paging_navi_area = "div.nablarch_paging"
   ,  label      = 'h2'
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
      , assertClass = function(clazz, case_description) {
          return function () {
            ok($(this).is(clazz), case_description);
          };
        };

      // ラベル部には、デフォルトのcssクラス（col_ + key名）が必ず設定される
      default_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertClass('.col_mail', default_case.testcase));
      default_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertClass('.col_date', default_case.testcase));
      default_case.table.find(visible.tr).find(visible.th).filter(':eq(0)').each(assertClass('.col_mail', default_case.testcase));
      default_case.table.find(visible.tr).find(visible.th).filter(':eq(1)').each(assertClass('.col_date', default_case.testcase));
      blank_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertClass('.col_mail', blank_case.testcase));
      blank_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertClass('.col_date', blank_case.testcase));
      blank_case.table.find(visible.tr).find(visible.th).filter(':eq(0)').each(assertClass('.col_mail', blank_case.testcase));
      blank_case.table.find(visible.tr).find(visible.th).filter(':eq(1)').each(assertClass('.col_date', blank_case.testcase));

      // 指定したcssクラスとデフォルトのcssクラスが設定されること
      set_css_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertClass('.font-red.col_mail', set_css_case.testcase));
      set_css_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertClass('.font-blue.col_date', set_css_case.testcase));
      set_css_case.table.find(visible.tr).find(visible.th).filter(':eq(0)').each(assertClass('.font-red.col_mail', set_css_case.testcase));
      set_css_case.table.find(visible.tr).find(visible.th).filter(':eq(1)').each(assertClass('.font-blue.col_date', set_css_case.testcase));

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

  function domain属性のテスト() {
    setup();
    var cases = test_for('domain-test')
      , domain_only = cases[0]
      , domain_and_css  = cases[1]
      , mail_col    = 'td:eq(0)' // mail domainは1列目
      , mail_header = 'th:eq(0)'
      , date_col    = 'td:eq(1)' // date domainは2列目
      , date_header = 'th:eq(1)'
      , assertHas   = function(classes, case_description) {
          return function(/* $.each */) {
            var $node = $(this);
            $.each(classes, function(i, clazz){
              ok($node.is('.' + clazz), case_description + "[has " + clazz + ":" + i + "]");
            });
          };
        }
      , assertNotHas = function(classes, case_description) {
          return function(/* $.each */) {
            var $node = $(this);
            $.each(classes, function(i, clazz){
              ok(!$node.is('.' + clazz), case_description + "[not has " + clazz + ":" + i + "]");
            });
          };
        };
    domain_only.table.find('tr').find(mail_col).each(assertHas(['mail'], domain_only.testcase));
    domain_only.table.find('tr').find(mail_col).each(assertNotHas(['date', 'font-red', 'font-blue'], domain_only.testcase));
    domain_only.table.find('tr').find(mail_header).each(assertNotHas(['mail', 'date', 'font-red', 'font-blue'], domain_only.testcase));

    domain_only.table.find('tr').find(date_col).each(assertHas(['date'], domain_only.testcase));
    domain_only.table.find('tr').find(date_col).each(assertNotHas(['mail', 'font-red', 'font-blue'], domain_only.testcase));
    domain_only.table.find('tr').find(date_header).each(assertNotHas(['mail', 'date', 'font-red', 'font-blue'], domain_only.testcase));

    domain_and_css.table.find('tr').find(mail_col).each(assertHas(['mail', 'font-red'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(mail_col).each(assertNotHas(['date', 'font-blue'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(mail_header).each(assertHas(['font-red'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(mail_header).each(assertNotHas(['mail', 'date', 'font-blue'], domain_and_css.testcase));

    domain_and_css.table.find('tr').find(date_col).each(assertHas(['date', 'font-blue'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(date_col).each(assertNotHas(['mail', 'font-red'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(date_header).each(assertHas(['font-blue'], domain_and_css.testcase));
    domain_and_css.table.find('tr').find(date_header).each(assertNotHas(['mail', 'date', 'font-red'], domain_and_css.testcase));
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
    set_case.table.find(visible.th).filter(':eq(0)').each(assertWidth(set_case, {'width' : '100px'}));
    set_case.table.find(visible.th).filter(':eq(1)').each(assertWidth(set_case, {'width' : '30%'}));
    set_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertWidth(set_case, {'width' : '100px'}));
    set_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertWidth(set_case, {'width' : '30%'}));
  }

  function value属性のテスト() {
    setup();
    var cases = test_for('value-test')
      , defualt_mail_case = cases[0] // サーバーレスポンスのidを利用
      , blank_id_case     = cases[1] // サーバーレスポンスのidを利用
      , tag_seq_case      = cases[2] // tagで連番を指定
      , assertValues    = function(values, case_description) {
          return function(i , td) {
            equal($.trim($(td).text()), values[i], case_description + "[" + i + "]");
          };
        }
      , ids    = ["1001", "1002", "1003", "1004"]
      , mails  = ["mail@mail.com", "mail2@mail.com", "mail3@mail.com", "mail4@mail.com"]
      , seq    = ["1", "2", "3", "4"];

      defualt_mail_case.table.find(visible.tr).find(visible.td).each(assertValues(mails, defualt_mail_case.testcase));
      blank_id_case.table.find(visible.tr).find(visible.td).each(assertValues(ids, blank_id_case.testcase));
      tag_seq_case.table.find(visible.tr).find(visible.td).each(assertValues(seq, tag_seq_case.testcase));
  }

  function autospan属性テスト() {
    setup();
    var cases = test_for('autospan-test')
      , autospan_no_use  = cases[0]
      , autospan_blank   = cases[1]
      , autospan_used    = cases[2]
      , autospan_other   = cases[3]
      // no use
      , $no_use_status = autospan_no_use.table.find('td.col_status')
      , $no_use_mail   = autospan_no_use.table.find('td.col_mail')
      , $no_use_date   = autospan_no_use.table.find('td.col_date')
      // blank
      , $blank_status = autospan_blank.table.find('td.col_status')
      , $blank_mail   = autospan_blank.table.find('td.col_mail')
      , $blank_date   = autospan_blank.table.find('td.col_date')
      // used
      , $used_spanned_row     = autospan_used.table.find('td.col_status')
      , $used_not_spanned_row = autospan_used.table.find('td.col_mail')
      // other column key
      , $other_spanned_date     = autospan_other.table.find('td.col_date')
      , $other_not_spanned_date = autospan_other.table.find('td.col_no_span_date')
      , $other_hidden           = autospan_other.table.find('td.col_hidden');

    // case1 no use
    equal($no_use_status.length, 4, autospan_no_use.testcase + "[0]");
    equal($no_use_status.map(collectRowspan).get().join(), '1,1,1,1', autospan_no_use.testcase + "[1]");
    equal($no_use_mail.length, 4, autospan_no_use.testcase + "[2]");
    equal($no_use_mail.map(collectRowspan).get().join(), '1,1,1,1', autospan_no_use.testcase + "[3]");
    equal($no_use_date.length, 4, autospan_no_use.testcase + "[4]");
    equal($no_use_date.map(collectRowspan).get().join(), '1,1,1,1', autospan_no_use.testcase + "[5]");

    // case2 blank
    equal($blank_status.length, 4, autospan_blank.testcase + "[0]");
    equal($blank_status.map(collectRowspan).get().join(), '1,1,1,1', autospan_blank.testcase + "[1]");
    equal($blank_mail.length, 4, autospan_blank.testcase + "[2]");
    equal($blank_mail.map(collectRowspan).get().join(), '1,1,1,1', autospan_blank.testcase + "[3]");
    equal($blank_date.length, 4, autospan_blank.testcase + "[4]");
    equal($blank_date.map(collectRowspan).get().join(), '1,1,1,1', autospan_blank.testcase + "[5]");

    // case3 simple use
    equal($used_spanned_row.length, 3, autospan_used.testcase + '[0]');
    equal($used_spanned_row.map(collectRowspan).get().join(), '1,1,2', autospan_used.testcase + '[1]');
    equal($used_not_spanned_row.length, 4, autospan_used.testcase + '[2]');
    equal($used_not_spanned_row.map(collectRowspan).get(), '1,1,1,1', autospan_used.testcase + '[3]');

    // case4 use other column for key
    equal($other_spanned_date.length, 2, autospan_other.testcase + "[0]");
    equal($other_spanned_date.map(collectRowspan).get().join(), '3,1' , autospan_other.testcase + "[1]");
    equal($other_not_spanned_date.length, 4, autospan_other.testcase + "[2]");
    equal($other_not_spanned_date.map(collectRowspan).get().join(), '1,1,1,1' , autospan_other.testcase + "[3]");
    equal($other_hidden.length, 4, autospan_other.testcase + "[4]");
    equal($other_hidden.map(collectRowspan).get().join(), '1,1,1,1' , autospan_other.testcase + "[5]");

    // for $.map(array, this);
    function collectRowspan() {
       return $(this).attr('rowspan') || "1";
    }
  }

  function valueFormat属性テスト() {
    setup();
    var cases = test_for('valueFormat-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , format_case  = cases[2]
      , assertValues    = function(values, case_description) {
          return function(i , td) {
            equal($.trim($(td).text()), values[i], case_description + "[" + i + "]");
          };
        }
      , dates   = ["20131001", "20131002", "20131003", "20131004"]
      , srashes = dates.map(function(e, i){return e.replace(/(\d{4})(\d{2})(\d{2})/, "$1/$2/$3");})
      , 年月日s  = dates.map(function(e, i){return e.replace(/(\d{4})(\d{2})(\d{2})/, "$1年$2月$3日");})
      , nums    = ["1,000", "10,000", "100,000", "1,000,000"];

      default_case.table.find(visible.tr).find(visible.td).each(assertValues(dates, default_case.testcase));
      blank_case.table.find(visible.tr).find(visible.td).each(assertValues(dates, blank_case.testcase));
      format_case.table.find(visible.tr).find(visible.td).filter(':eq(0)').each(assertValues(srashes, format_case.testcase));
      format_case.table.find(visible.tr).find(visible.td).filter(':eq(1)').each(assertValues(年月日s, format_case.testcase));
      format_case.table.find(visible.tr).find(visible.td).filter(':eq(2)').each(assertValues(nums, format_case.testcase));
  }

  function additional属性のテスト() {
    var testcases = test_for("additionalTest")
     ,  simple = testcases[0]
     ,  composite = testcases[1]
     ,  msg       = simple.testcase
     ,  table     = simple.table
     ,  mail = {
          expected  : ["mail@mail.com", "mail2@mail.com", "mail3@mail.com", "mail4@mail.com"]
        , header    : "メール(true)"
        }
        num = {
          expected : ["1,000", "10,000", "100,000", "1,000,000"]
        , header   : "value&format(true)"
        }
     ,  assertText = function(node, expected, msg) {
          var text = $(node).text().split(/\s+/).join("");
          ok(text.has(expected), [msg , text, expected].join(' , '));
        };

    table.find(visible.td).filter('.additional').each(function(i,e) {
       assertText(this, mail.expected[i], msg + "additional(normal col)[ "+i+" ]");
    });

    table.find(inlay.record).find('td').each(function(i,e) {
      assertText(this, mail.header + "：" + mail.expected[i], msg + "inlay[ "+i+" ]");
    })

    // value & valueFormat有の場合のケース
    table = composite.table;
    msg   = composite.testcase;
    table.find(visible.tr).find(visible.td+":eq(1)").filter('.additional').each(function(i) {
        assertText(this, mail.expected[i], msg + "additional(normal col)[ "+i+" ]");
    });
    table.find(visible.tr).find(visible.td+":eq(2)").filter('.additional').each(function(i) {
        assertText(this, num.expected[i], msg + "additional(normal col)[ "+i+" ]");
    });

    table.find(inlay.record).find("td").each(function(i){
        assertText(this, expectText(), msg + "inlay[ "+i+" ]");
        function expectText() {
          return mail.header+"："+mail.expected[i]+num.header+"："+num.expected[i];
        }
    });
  }

  /**
   * カラムウィジェット_ラベルのwidgetから出力されたテストケースの情報を取得する。
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

