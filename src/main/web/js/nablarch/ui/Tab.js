/**
 * @module nablarch.ui
 */
define(['jquery', './Widget', 'sugar'],
function($, Widget) { "use strict";
  /**
   * タブ制御
   * ===================================
   *
   * マークアップ仕様
   * ------------------------
   *
   *     <%-- タブ --%>
   *     <div class="nablarch_Tab
   *                 -name tabGroup1
   *                 -value tab1
   *                 -content #content1
   *                 selected">
   *       タブ1
   *     </div>
   *
   *     <div class="nablarch_Tab
   *                 -name tabGroup1
   *                 -value tab2
   *                 -content #content2">
   *       タブ2
   *     </div>
   *
   *     <%-- タブの選択状態を保持するためのフォーム要素 --%>
   *     <n:plainHidden name="tabGroup1" />
   *
   *     <%-- タブで開閉する領域の中身 --%>
   *     <div id="content1" style="display:none">
   *       コンテンツ1の内容
   *     </div>
   *
   *     <div id="content2" style="display:none">
   *       コンテンツ2の内容
   *     </div>
   *
   * @class nablarch.ui.Tab
   * @author Iwauo Tajima
   */
  Tab.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * @method Tab
     * @constructor
     * @param {HTMLElement} element タブのHTML要素
     * @param {Object} opts ウィジェットのオプションオブジェクト
     */
    constructor: Tab
    /**
     * タググループ名
     * 現在選択中のタグ名はこのname値をもったform要素に保持される。
     * @property name
     * @type String
     */
  , name: null
    /**
     * タグ名
     * このタグが選択中であった場合、この値がform要素に保持される。
     * @property value
     * @type String
     */
  , value: null
    /**
     * このタグが選択状態にあるかどうか
     * @property selected
     * @type Boolean
     */
  , selected: null
    /**
     * このタブを使って表示・非表示を切り替える対象領域を保持するjQuery結果セット
     * @property $content
     * @type jQuery
     */
  , $content: null
    /**
     * このタブの選択状態を保持するフォーム要素を保持するjQuery結果セット
     * @property $input
     * @type jQuery
     */
  , $input: null
    /**
     * このタブを選択する。
     *
     * このメソッド実行後は以下の状態となる。
     *
     *   - 同じタググループ内に存在する全てのタグを非選択状態に変更し、その対象領域を非表示にする。
     *   - このタブを選択状態に変更し、対象領域を表示する。
     *
     * なお、このタブが既に選択状態にある場合はなにもしない。
     *
     * @method select
     * @chainable
     */
  , select: Tab_select
    /**
     * このタブを非選択状態にする。
     *
     * @method unselect
     * @chainable
     */
  , unselect: Tab_unselect
    /**
     * 現在のウィジェットの状態に沿って、
     * このタブ及び制御対象領域の表示を切り替えるとともに、
     * フォーム上の要素に現在の選択状態を反映する。
     *
     * @method render
     * @chainable
     */
  , render: Tab_render
  });

  /**
   * イベント定義
   *
   *       Tab.event = {
   *           'click' : 'select'
   *       };
   *
   * @property event
   * @type Object
   * @static
   */
  Tab.event = {
    'click' : 'select'
  };

  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_Tab"
   */
  Tab.widgetType = 'nablarch_Tab';

  // ------------------------------------------------------- implementation

  Widget.register(Tab);

  // コンストラクタ
  function Tab(element, opts) {
    var self = this;
    this.constructor = Tab;
    readOption();
    Widget.call(this, element);
    readForm();
    hasError() ? this.select()
               : this.render();

    // ----- subroutines -------- //
    function readOption() {
      self.value    = opts.value;
      self.name     = opts.name;
      self.$content = $(opts.content);
    }

    function hasError() {
       return self.$content.find(".nablarch_errors, .nablarch_error").length > 0;
    }

    function readForm() {
      var $input = $('input[name="'+ self.name + '"]');
      if (!$input.length) {
        $input = $('<input>', {type:'hidden', name:self.name})
               .appendTo('form');
      }

      self.selected = $input.val()
                    ? (self.value === $input.val())
                    : self.$node.is('.selected');

      self.$input = $input;
    }
  }

  function Tab_select() {
    var thisTab = this;

    // 同じタブグループに属するタブを全て閉じる。
    $('.' + Tab.widgetType).each(function() {
      var tab = $(this).widget(Tab);
      if ((tab.name === thisTab.name) && (thisTab !== this)) {
        tab.unselect();
      }
    });

    this.selected = true;
    this.render();
    return this;
  }

  function Tab_unselect() {
    if (this.selected) {
      this.selected = false;
      this.render();
    }
    return this;
  }

  function Tab_render() {
    if (this.selected) {
      this.$input.val(this.value);
      this.$node.removeClass('selected').addClass('selected');
      this.$content.show();
    }
    else {
      this.$node.removeClass('selected');
      this.$content.hide();
    }
    return this;
  }

  return Tab;
});
