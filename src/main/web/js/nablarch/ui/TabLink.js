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
   * @class nablarch.ui.TabLink
   * @author Iwauo Tajima
   */
  TabLink.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * @method TabLink
     * @constructor
     * @param {HTMLElement} element タブのHTML要素
     * @param {Object} opts ウィジェットのオプションオブジェクト
     */
    constructor: TabLink
    /**
     * タググループ名  
     * 現在選択中のタグ名はこのname値をもったform要素に保持される。
     * @property name
     * @type String
     */
  , name: null
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
  TabLink.event = {
    'click' : function(event) {
      $("input[name=" + this.name + "]").val("");
    }
  };
  
  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_TabLink"
   */
  TabLink.widgetType = 'TabLink';
  
  // ------------------------------------------------------- implementation
    
  Widget.register(TabLink);
  
  // コンストラクタ
  function TabLink(element, opts) {
    this.name = opts.name;
    Widget.call(this, element);
  }

  return TabLink;
});
