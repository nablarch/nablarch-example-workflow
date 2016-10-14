  runTest(
      必須属性のみ指定した場合のテスト
    , cssClass属性のテスト
    , sortable属性のテスト
    , inactive属性のテスト
    , domain属性のテスト
    , width属性のテスト
    , value属性のテスト
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
      , assertIsBlank = function(case_description) {return function () {
            ok($.trim($(this).attr('class')).isBlank(), case_description);
        };}
      , assertClass = function(clazz, case_description) {return function () {
            equal($.trim($(this).attr('class')), clazz, case_description);
        };};

    default_case.table.find(visible.tr).find(visible.td).each(assertIsBlank(default_case.testcase + "(td)"));
    default_case.table.find(visible.tr).find(visible.th).each(assertIsBlank(default_case.testcase + "(th)"));
    blank_case.table.find(visible.tr).find(visible.td).each(assertIsBlank(blank_case.testcase + "(td)"));
    blank_case.table.find(visible.tr).find(visible.th).each(assertIsBlank(blank_case.testcase + "(th)"));
    // 指定したカラムのみ設定されること
    set_css_case.table.find(visible.tr).find(visible.td+':eq(0)').each(assertClass('border-red', set_css_case.testcase + "(td:eq(0))"));
    set_css_case.table.find(visible.tr).find(visible.th+':eq(0)').each(assertClass('border-red', set_css_case.testcase + "(th:eq(0))"));
    set_css_case.table.find(visible.tr).find(visible.td+':eq(1)').each(assertIsBlank(set_css_case.testcase + "(td:eq(1))"));
    set_css_case.table.find(visible.tr).find(visible.th+':eq(1)').each(assertIsBlank(set_css_case.testcase + "(th:eq(1))"));
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

  function inactive属性のテスト() {
    setup();
    var cases = test_for('inactive-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , false_case   = cases[2]
      , true_case    = cases[3]
      , assertHasLink = function(case_description) { return function() {
          ok( $(this).find('a').size() > 0, case_description);
        };}
      , assertNotHasLink = function(case_description) { return function() {
          ok( $(this).find('a').size() === 0, case_description);
        };};

    default_case.table.find(visible.tr).find(visible.td).each(assertHasLink(default_case.testcase));
    blank_case.table.find(visible.tr).find(visible.td).each(  assertHasLink(blank_case.testcase));
    false_case.table.find(visible.tr).find(visible.td).each(  assertHasLink(false_case.testcase));
    true_case.table.find(visible.tr).find(visible.td).each(   assertNotHasLink(true_case.testcase));
  }

  function domain属性のテスト() {
    setup();
    var cases = test_for('domain-test')
      , domain_only = cases[0]
      , domain_and_css  = cases[1]
      , assertHas   = function(classes, case_description) {return function(/* $.each */) {
          var $node = $(this);
          $.each(classes, function(i, clazz){
            ok($node.is('.' + clazz), case_description + "[has " + clazz + ":" + i + "]");
          });
        };}
      , assertNotHas = function(classes, case_description) {return function(/* $.each */) {
          var $node = $(this);
          $.each(classes, function(i, clazz){
            ok(!$node.is('.' + clazz), case_description + "[not has " + clazz + ":" + i + "]");
          });
        };};

    domain_only.table.find(visible.tr).find(visible.td).each(assertHas(['mail'], domain_only.testcase));
    domain_only.table.find(visible.tr).find(visible.td).each(assertNotHas(['bg-red'], domain_only.testcase));
    domain_and_css.table.find(visible.tr).find(visible.td).each(assertHas(['mail', 'bg-red'], domain_only.testcase));
  }

  function value属性のテスト() {
    setup();
    var cases = test_for('value-test')
      , default_case   = cases[0]
      , blank_case     = cases[1]
      , set_value_case = cases[2]
      , assertValues    = function(values, case_description) {
          return function(i , td) {
            equal($.trim($(td).text()), values[i], case_description + "[" + i + "]");
          };
        }
      , server_values = ["mail@mail.com", "mail2@mail.com", "mail3@mail.com", "mail4@mail.com"]
      , tag_seq       = ["メールアドレス1", "メールアドレス2", "メールアドレス3", "メールアドレス4"]; // メールアドレス${seq}

      default_case.table.find(visible.tr).find(visible.td).each(assertValues(server_values, default_case.testcase));
      blank_case.table.find(visible.tr).find(visible.td).each(assertValues(server_values, blank_case.testcase));
      set_value_case.table.find(visible.tr).find(visible.td).each(assertValues(tag_seq, set_value_case.testcase));
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
    default_case.table.find(visible.tr).find(visible.th).each(assertWidth(default_case, ''));
    blank_case.table.find(visible.tr).find(visible.th).each(assertWidth(blank_case, ''));
    set_case.table.find(visible.tr).find(visible.th+':eq(0)').each(assertWidth(set_case, {'width':'100px'}));
    set_case.table.find(visible.tr).find(visible.th+':eq(1)').each(assertWidth(set_case, {'width':'30%'}));
    set_case.table.find(visible.tr).find(visible.td+':eq(0)').each(assertWidth(set_case, {'width':'100px'}));
    set_case.table.find(visible.tr).find(visible.td+':eq(1)').each(assertWidth(set_case, {'width':'30%'}));
  }


  /**
   * カラムウィジェット_リンクのwidgetから出力されたテストケースの情報を取得する。
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
