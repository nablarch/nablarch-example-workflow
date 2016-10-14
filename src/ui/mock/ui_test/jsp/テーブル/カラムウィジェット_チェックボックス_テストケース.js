  runTest(
      必須属性のみ指定した場合のテスト
    , cssClass属性のテスト
    , checkboxCssClass属性のテスト
    , disabled属性のテスト
    , readonly属性のテスト
    , width属性のテスト
    , value属性のテスト
    , offValue属性のテスト
    , toggle属性のテスト
  );

  var $all_nodes
   ,  paging_navi_area = "div.nablarch_paging"
   ,  title_label      = 'h2';

  function setup() {
    $all_nodes = $('span.test-case, div.title, div.nablarch_listSearchResultWrapper');
  }

  function 必須属性のみ指定した場合のテスト() {
     setup();
     var cases = test_for('require_only-test')
      ,  require_only = cases[0];

     equal($.trim(require_only.title.find(title_label).text()), "必須属性（全てのカラムウィジェットを纏めて実施）", require_only.testcase + " [title label]");
  }

  function cssClass属性のテスト() {
    setup();
    var cases = test_for('cssClass-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_css_case = cases[2]
      , assertIsBlank = function(case_description) {return function () {
          ok($(this).attr('class').isBlank(), case_description);
        };}
      , assertClass = function(clazz, case_description) {return function () {
          equal($.trim($(this).attr('class')), clazz, set_css_case.testcase);
        };}
      , findTr = function($table) {
        return $table.find('tr').not('.nablarch_AdditionalColumnInlay')
      };

      findTr(default_case.table).find('td').has('input:checkbox').each(assertIsBlank(default_case.testcase));
      findTr(default_case.table).find('th:eq(0)').each(assertIsBlank(default_case.testcase));
      findTr(blank_case.table).find('td').has('input:checkbox').each(assertIsBlank(blank_case.testcase));
      findTr(blank_case.table).find('th:eq(0)').each(assertIsBlank(blank_case.testcase));

      // 指定したカラムのみ設定されること
      findTr(set_css_case.table).find('td').has('input:checkbox').each(assertClass('border-red', set_css_case.testcase));
      findTr(set_css_case.table).find('th:eq(0)').each(assertClass('border-red', set_css_case.testcase));
      // ラベル部には、デフォルトのcssクラス(col + キー名)のみが設定され、チェックボックスに指定したクラスは設定されないこと
      findTr(set_css_case.table).find('td:eq(1)').each(assertClass('col_mail', set_css_case.testcase));
      findTr(set_css_case.table).find('th:eq(1)').each(assertClass('col_mail', set_css_case.testcase));
  }

  function checkboxCssClass属性のテスト() {
    setup();
    var cases = test_for('checkboxCssClass-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , set_css_case = cases[2]
      , clazz = '.check-none'
      , asserHasNot  = function(clazz, case_description) {return function(i) {
          ok(!$(this).is(clazz), case_description + "[" + i + "]");
        };}
      , assertHas    = function(clazz, case_description) {return function(i) {
          ok($(this).is(clazz), case_description + "[" + i + "]");
        };};

    default_case.table.find(':checkbox').each(asserHasNot(clazz, default_case.testcase));
    blank_case.table.find(':checkbox').each(asserHasNot(clazz, blank_case.testcase));
    set_css_case.table.find(':checkbox').each(assertHas(clazz, set_css_case.testcase));
  }

  function disabled属性のテスト() {
    setup();
    var cases = test_for('disabled-test')
      , default_case = cases[0]
      , blank_case   = cases[1]
      , false_case   = cases[2]
      , true_case    = cases[3]
      , assertTrue   = function(case_description) { return function(i) {
          ok($(this).prop('disabled'), case_description + "[" + i + "]");
        };}
      , assertFalse  = function(case_description) {return function(i) {
          ok(!$(this).prop('disabled'), case_description + "[" + i + "]");
        };};

    default_case.table.find(':checkbox').each(assertFalse(default_case.testcase));
    blank_case.table.find(':checkbox').each(assertFalse(blank_case.testcase));
    false_case.table.find(':checkbox').each(assertFalse(false_case.testcase));
    true_case.table.find(':checkbox').each(assertTrue(true_case.testcase));
  }

  function readonly属性のテスト() {
    setup();
    var cases = test_for('readonly-test')
    , default_case = cases[0]
    , blank_case   = cases[1]
    , false_case   = cases[2]
    , true_case    = cases[3]
    , assertTrue   = function(case_description) { return function(i) {
        ok($(this).prop('disabled') && $(this).is('.nablarch_readonly'), case_description + "[" + i + "]");
      };}
    , assertFalse  = function(case_description) { return function(i) {
        ok(!$(this).prop('disabled') && !$(this).is('.nablarch_readonly'), case_description + "[" + i + "]");
      };};

    default_case.table.find(':checkbox').each(assertFalse(default_case.testcase));
    blank_case.table.find(':checkbox').each(assertFalse(blank_case.testcase));
    false_case.table.find(':checkbox').each(assertFalse(false_case.testcase));
    true_case.table.find(':checkbox').each(assertTrue(true_case.testcase));
  }

  function width属性のテスト() {
    setup();
    var cases = test_for('width-test')
     ,  default_case = cases[0]
     ,  blank_case   = cases[1]
     ,  set_case  = cases[2]
     ,  assertWidth  = function(testcase, expected) {
          return function(i) {
            var $this = $(this)
             ,  style = $this[0].style;

            for (expectedStyle in expected) {
              if (expected.hasOwnProperty(expectedStyle)) {
                equal(style[expectedStyle], expected[expectedStyle], testcase);
              }
            }
          };
        };
    default_case.table.find('th:eq(0)').each(assertWidth(default_case, {'width': ''}));
    blank_case.table.find('th:eq(0)').each(assertWidth(blank_case, {'width' : ''}));
    set_case.table.find('th:eq(0)').each(assertWidth(set_case, {'width':'100px'}));
    set_case.table.find('tr').not('.nablarch_AdditionalColumnInlay').find('td:eq(0)').each(
      assertWidth(set_case, {'textAlign': 'center', 'width': '100px'}));
  }


  function value属性のテスト() {
    setup();
    var cases = test_for('value-test')
      , default_case   = cases[0]
      , blank_case     = cases[1]
      , set_value_case = cases[2]
      , server_values  = ['1001', '1002', '1003', '1004']
      , tag_values     = ['check on', 'check on', 'check on', 'check on']
      , assertValues   = function(expects, case_desctiption) { return function(i, e){
          equal($(this).val(), expects[i] ,case_desctiption + "[" + i + "]");
        };};

    default_case.table.find(':checkbox').each(assertValues(server_values, default_case.testcase));
    blank_case.table.find(':checkbox').each(assertValues(server_values, blank_case.testcase));
    set_value_case.table.find(':checkbox').each(assertValues(tag_values, set_value_case.testcase));
  }

  function offValue属性のテスト() {
    setup();
    var cases = test_for('offValue-test')
      , default_case   = cases[0]
      , blank_case     = cases[1]
      , set_value_case = cases[2]
      , tag_values     = ['チェックされていない値', 'チェックされていない値', 'チェックされていない値', 'チェックされていない値']
      , offValue       = function (node) {
          var $node = $(node)
            , key = $.trim("nablarch_cbx_off_param_" + $node.attr('name'));
          return n_hidden_val($node, key);
       }
      , assertBlank    = function(case_desctiption) { return function(i, e){
          ok(offValue(this).isBlank() ,case_desctiption + "[" + i + "]");
        };}
      , assertValues   = function(expects, case_desctiption) { return function(i, e){
          equal(offValue(this), expects[i] ,case_desctiption + "[" + i + "]");
        };};

    default_case.table.find(':checkbox').each(assertBlank(default_case.testcase));
    blank_case.table.find(':checkbox').each(assertBlank(blank_case.testcase));
    set_value_case.table.find(':checkbox').each(assertValues(tag_values, set_value_case.testcase));
  }

  function toggle属性のテスト() {
    setup();
    var cases = test_for('toggle-test')
      , default_case   = cases[0]
      , blank_case = cases[1]
      , false_case = cases[2]
      , true_case = cases[3]
      , assertToggleOffTitle = function(caseDescritpion) {
        return function() {
          var $this = $(this);
          equal($this.text().trim(), '選択', caseDescritpion + ': titleは選択であること')
          ok(!$this.hasClass('nablarch_Toggle_checkbox'), caseDescritpion + ': nablarch_Toggle_checkboxクラスは設定されていないこと')
        }
      }
      , assertToggleOffRow = function(caseDescritpion) {
        return function() {
          var $this = $(this);
          ok(!$this.find('input:checkbox').is('.toggle'),
            caseDescritpion + ': toggle対象のチェックボックスであることを示すクラス属性が設定されないこと');
        }
      }
      , assertToggleOnTitle = function(caseDescritpion) {
        return function() {
          var $this = $(this);

          equal($this.text().trim(), '全選択/全解除', caseDescritpion + ': titleは全選択/全解除であること')
          ok($this.find('a:eq(0)').hasClass('toggle-on'), caseDescritpion);
          equal($this.find('a:eq(0)').text().trim(), '全選択', caseDescritpion);
          equal($this.find('a:eq(1)').text().trim(), '全解除', caseDescritpion);

          ok($this.is('.nablarch_Toggle_checkbox.-toggleTarget.mail'),
            caseDescritpion + ': nablarch_Toggle_checkboxクラスが設定されていること(オプション情報も）')

        }
      }
      , assertToggleOnRow = function(caseDescritpion) {
        return function() {
          var $this = $(this);
          ok($this.find('input:checkbox').is('.toggle.mail'),
            caseDescritpion + ': toggle対象のチェックボックスであることを示すクラス属性が設定されること');
        }
      }
      , assertChecked = function(caseDescription, checked) {
        return function() {
          var $this = $(this);
          equal($this.prop('checked'), checked, caseDescription);
        };
      }
      , findTr = function($table) {
        return $table.find('tr').not('.nablarch_AdditionalColumnInlay')
      };

    // toggle属性指定なし
    findTr(default_case.table).find('th:eq(0)').each(assertToggleOffTitle(default_case.testcase));
    findTr(default_case.table).find('td:eq(0)').each(assertToggleOffRow(default_case.testcase));

    // toggle属性ブランク
    findTr(blank_case.table).find('th:eq(0)').each(assertToggleOffTitle(blank_case.testcase));
    findTr(blank_case.table).find('td:eq(0)').each(assertToggleOffRow(blank_case.testcase));

    // toggle属性にfalseを指定
    findTr(false_case.table).find('th:eq(0)').each(assertToggleOffTitle(false_case.testcase));
    findTr(false_case.table).find('td:eq(0)').each(assertToggleOffRow(false_case.testcase));

    // 全解除をクリック
    true_case.table.find('th:eq(0)').find('a:eq(1)').click();

    // toggle属性にtrueを指定
    findTr(true_case.table).find('th:eq(0)').each(assertToggleOnTitle(true_case.testcase));
    findTr(true_case.table).find('td:eq(0)').each(assertToggleOnRow(default_case.testcase));
    // toggle属性をtrueに設定していない列は、toggle用のクラス属性などが設定されないこと
    findTr(true_case.table).find('th:eq(1)').each(assertToggleOffTitle(true_case.testcase));
    findTr(true_case.table).find('td:eq(1)').each(assertToggleOffRow(default_case.testcase));

    // 全選択をクリック
    true_case.table.find('th:eq(0)').find('a:eq(0)').click();
    assertChecked()
    findTr(true_case.table).find('td:eq(0)').find('input:checkbox').each(assertChecked('チェック状態であること', true));
    findTr(true_case.table).find('td:eq(1)').find('input:checkbox').each(assertChecked('操作対象外のチェックボックスのためチェックが外れた状態であること', false));

    // 操作対象外のチェックボックスを一旦全てチェックに変更する
    findTr(true_case.table).find('td:eq(1)').find('input:checkbox').each(function() {
      $(this).prop('checked', true);
    });

    // 全解除択をクリック
    true_case.table.find('th:eq(0)').find('a:eq(1)').click();
    findTr(true_case.table).find('td:eq(0)').find('input:checkbox').each(assertChecked('チェックが外れた状態であること', false));
    findTr(true_case.table).find('td:eq(1)').find('input:checkbox').each(assertChecked('操作対象外のチェックボックスなのでチェックは外れないこと', true));

  }

  /**
   * カラムウィジェット_チェックボックスのwidgetから出力されたテストケースの情報を取得する。
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
