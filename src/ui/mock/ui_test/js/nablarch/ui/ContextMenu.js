define(['jquery', './Widget', 'sugar'],
function($, Widget) { 'use strict';
  /**
   * コンテキストメニュー
   * ========================
   * 
   * マークアップ仕様
   * ------------------------
   * 以下の例のように、コンテキストメニューの内容を記述した `<ul>` 要素に、
   * マーカCSSクラス **nablarch_ContextMenu** を指定する。
   *
   * **使用例**
   * 
   *     <!-- コンテキストメニューの内容 -->
   *     <ul id="contextMenu" class="nablarch_ContextMenu">
   *     
   *       <li class="specView">
   *         <i class="fa fa-table"></i>
   *         <span>画面項目定義を開く</span>
   *       </li>
   *      
   *       <li class="widgetList">
   *         <i class="fa fa-question-circle"></i>
   *         <span>ウィジェット一覧を開く</span>
   *       </li>
   *       
   *       <li class="useDefaultMenu">
   *         <i class="fa fa-external-link"></i>
   *         <span>通常のメニューを使用する</span>
   *       </li>
   *     </ul>
   * 
   * @class nablarch.ui.ContextMenu
   * @author Iwauo Tajima
   */
  ContextMenu.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * @method ContextMenu
     * @constructor
     * @param {HTMLElement} element メニューを構成する要素 
     * @return {ContextMenu} インスタンス
     */
    constructor : ContextMenu
    /**
     * コンテキストメニューが開かれているかどうか。
     * @property isOpen
     * @type Boolean
     */
  , isOpen  : null
    /**
     * コンテキストメニューが無効化されているかどうか。  
     * (無効化されている場合は、通常のブラウザメニューが開かれる。)
     * @property disabled
     * @type Boolean
     */
  , disabled: null
    /**
     * コンテキストメニューの表示・非表示を切り替える。
     * @method toggle
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */
  , toggle : ContextMenu_toggle

    /**
     * コンテキストメニューを表示する。
     * @method show
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */
  , show   : ContextMenu_show
    /**
     * コンテキストメニューを閉じる。
     * @method hide
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */  
  , hide   : ContextMenu_hide
    /**
     * 現在のステータスに応じて表示内容を更新する。
     * @method render
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */    
  , render : ContextMenu_render
    /**
     * コンテキストメニューを無効化する。  
     * 以降は、ブラウザデフォルトのコンテキストメニューが開かれる。
     * @method disable
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */  
  , disable: ContextMenu_disable
  });

  /**
   * イベント定義
   * 
   *     ContextMenu.event = {
   *       '.useDefaultMenu click': ContextMenu_disable
   *     , 'click'                : ContextMenu_hide 
   *     , 'document mousedown'   : function(e) {
   *         if (this.disabled) return;
   *         if (!this.$node.find(e.target).length) {
   *           this.hide(e);
   *         }
   *       }
   *     , 'document contextmenu' : function(e) {
   *         if (this.disabled) return;
   *         this.toggle(e);
   *         return false;
   *       }
   *     };
   * 
   * @property event
   * @static
   * @type Object
   * @final
   */
  ContextMenu.event = {
    '.useDefaultMenu click': ContextMenu_disable
  , 'click'                : ContextMenu_hide 
  , 'document mousedown'   : function(e) {
      if (this.disabled) return;
      if (!this.$node.find(e.target).length) {
        this.hide(e);
      }
    }
  , 'document contextmenu' : function(e) {
      if (this.disabled) return;
      this.toggle(e);
      return false;
    }
  };
  
  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_ContextMenu"
   */
  ContextMenu.widgetType = "nablarch_ContextMenu";
  
  Widget.register(ContextMenu);

  function ContextMenu(element) {
    this.constructor = ContextMenu;
    Widget.call(this, element);
    this.isOpen   = false;
    this.disabled = false;
    this.$node
        .addClass(ContextMenu.widgetType)
        .hide();
  }

  function ContextMenu_render(event) {
    if (this.isOpen) {
      this.$node.css({
        top  : event.pageY
      , left : event.pageX
      , display: 'block'
      });
    }
    else {
      this.$node.css({display:'none'});
    }
    return this;
  }

  function ContextMenu_toggle(event) {
    return this.isOpen ? this.hide(event)
                       : this.show(event);
  }

  function ContextMenu_show(event) {
    this.isOpen = true;
    this.render(event);
    return this;
  }

  function ContextMenu_hide(event) {
    this.isOpen = false;
    return this.render(event);
  }
  
  function ContextMenu_disable(event) {
    this.disabled = true;
    return this;
  }
  
  return ContextMenu;
});
