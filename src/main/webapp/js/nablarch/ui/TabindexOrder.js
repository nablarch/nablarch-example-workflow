define(["jquery", "./Widget" , "sugar"],
function($, Widget){ 'use strict';
  /**
   * タブインデックス遷移順定義
   * ===========================
   *
   * マークアップ仕様
   * ------------------------
   * このウィジェットはタブキーでの遷移順を領域単位に設定する場合に使用する。
   * 指定する対象領域の兄弟要素にマーカCSSクラス **nablarch_TabindexOrder** を指定する。
   *
   *
   * タブ遷移の順番を指定したい領域の順序を **-order** にID属性で指定する。
   * 領域内のタブ遷移は要素の出現順序に従う。
   *
   * 例：contents=>footer=>menu=>header=>topの順で制御する場合
   * <div id="page">
   *   <div class="nablarch_TabindexOrder -order contents,footer,menu,header,top"></div>
   *   <div id="top">...</div>
   *   <div id="header">...</div>
   *   <div id="menu">...</div>
   *   <div id="contents">...</div>
   *   <div id="footer">...</div>
   * </div>
   *
   * @class nablarch.ui.TabindexOrder
   *
   * @author tani takanori
   * @since  1.4
   *
   */
  TabindexOrder.prototype = Object.merge(new Widget(), {
     /**
      * コンストラクタ。
      *
      * @constructor
      * @param {HTMLElement} element ウィジェット定義を指定したHTML要素
      * @param {Object} opt ウィジェットのオプションオブジェクト
      *  **order:**(`String`) ID属性にてタブ遷移の順序をカンマ区切りで指定する。
      * @return {TabindexOrder} インスタンス
      */
     constructor: TabindexOrder
     /**
      * 定義する範囲。
      *
      * @property $context
      * @type jQuery
      */
   , $context  : null
     /**
      * 遷移順のリスト。
      * @property orderlist
      * @type Array
      */
   , orderlist : []
    /**
     * オプションに従いタブインデックスを定義する。
     *
     * @method define
     */
   , define    : TabindexOrder_define
  });

  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_TabindexOrder"
   */
  TabindexOrder.widgetType = "nablarch_TabindexOrder";
  /**
   * イベント定義｡
   * (Widget.initで初期化されるため、ドキュメントの上のイベントでは動作しない。)
   *
   * TabindexOrder.event = {};
   *
   * @property event
   * @type Object
   * @static
   */
  TabindexOrder.event = {};

  var defaultNode = 'input, select, textarea, a, button';

  function TabindexOrder(element, opt) {
    this.$context = $(element).parent();
    this.orderlist = opt.order ? opt.order.split(',') : [];
    this.constructor = TabindexOrder;
    this.define();
  }

  function TabindexOrder_define() {
    var index = 1
     ,  $context = this.$context;
    this.orderlist.each(function(area) {
      $context.find('#' + area.trim()).find(defaultNode).each(function(){
        $(this).attr('tabindex', index);
        index++;
      });
    });
  }

  Widget.register(TabindexOrder);

  return TabindexOrder;

});