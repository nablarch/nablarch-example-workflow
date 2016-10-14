/**
 * @module nablarch.ui
 */
define(['jquery', 'nablarch/ui/Widget', 'sugar'],
function($, Widget) { 'use strict';
  /**
   * モーダルダイアログ
   * ========================
   * モーダルダイアログを表示する。
   * 
   * 
   * マークアップ仕様
   * -------------------
   * ダイアログ内に表示するDOM要素に対して、マーカーCSSクラス `nablarch_LightBox`
   * を指定する。
   * 
   *     <div class="nablarch_LightBox
   *                 -open  '#contextMenu li.widgetList click'
   *                 -close 'button.close click'">
   *       <h2>ウィジェット一覧</h2>
   *       <div id="widgetListView"></div>
   *       <button class="close">ウィジェット一覧を閉じる</button>
   *     </div>
   * 
   * @class nablarch.ui.LightBox
   * @author Iwauo Tajima
   * @since 1.3
   */  
  LightBox.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * @method LightBox
     * @param {HTMLElement} element コンテキストメニューを構成するDOMノード
     * @param {Object} opts オプションを格納したオブジェクト
     * @constructor
     */
    constructor: LightBox
    /**
     * ダイアログが開かれているかどうか。
     * @property isOpen
     * @type Boolean
     */
  , isOpen: null
    /**
     * ダイアログの表示位置(画面左端からのpx指定)
     * nullの場合は画面中央に表示するように自動的に調整する。
     * @property left
     * @type Number
     */
  , left: null
    /**
     * ダイアログの表示位置(画面上端からのpx指定)
     * nullの場合は画面中央に表示するように自動的に調整する。
     * @property top
     * @type Number
     */
  , top: null
    /**
     * ダイアログの背景として全画面表示するdiv要素
     * @property $screen
     * @type HTMLElement
     */    
  , $screen: null
    /**
     * モーダルダイアログを展開する。
     * @method show
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */
  , show: LightBox_show
    /**
     * モーダルダイアログを閉じる。
     * @method hide
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */  
  , hide   : LightBox_hide
    /**
     * 現在のステータスに応じて表示を更新する。
     * @method render
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */
  , render : LightBox_render
  });
  
  LightBox.event = {};

  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_LightBox"
   */
  LightBox.widgetType = "nablarch_LightBox";
  
  Widget.register(LightBox); 
  
  /**
   * コンストラクタ関数
   */
  function LightBox(element, opts) {
    this.constructor = LightBox;
    this.isOpen  = false;
    this.left    = Number(opts.left);
    this.top     = Number(opts.top);
    this.$screen = $('<div>', {'class': 'nablarch_LightBox_screen'})
                  .hide().appendTo('body');
    
    Widget.call(this, element);
    
    this.bindEvent(opts.open,  'show');
    this.bindEvent(opts.close, 'hide');
    
    this.render();
  }
  
  function LightBox_render(event) {
    var self = this;
    if (!self.isOpen) {
      self.$node.hide();
      self.$screen.hide();
    }
    else {
      adjustPlacement();
      self.$screen.show();
      self.$node.show();
    }
    return this;
    
    // --- subroutines --- //
    function adjustPlacement() {
      var left =  self.left || ($(window).innerWidth()  - self.$node.innerWidth()) / 2
        , top  =  self.top  || ($(window).innerHeight() - self.$node.innerHeight()) / 2 ;
      
      self.$screen.css({
        top    : 0
      , left   : 0
      , height : $(document).innerHeight() + 'px'
      , width  : $(document).innerWidth()  + 'px'
      });
      
      self.$node.css({
        top  : top + 'px'
      , left : left + 'px'
      });
    }
  }
  
  function LightBox_show(event) {
    this.isOpen = true;
    this.render(event);
  }
  
  function LightBox_hide(event) {
    this.isOpen = false;
    this.render(event);
  }
  
  return LightBox;
});
