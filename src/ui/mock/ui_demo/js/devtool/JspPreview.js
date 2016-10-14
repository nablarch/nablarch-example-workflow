/**
 * @module devtool
 */
define(['jsp', 'nablarch/ui/Widget', 'sugar'],
function($, Widget) { 'use strict';
  
  JspPreview.widgetType = 'devtool_JspPreview';

  /**
   * ドキュメント内のJSPソースのレンダリングプレビュー表示領域
   * 
   * @namespace devtool
   * @class devtool.JspPreview
   * @author Iwauo Tajima
   * @since 1.3
   */
  JspPreview.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * @method JspPreview
     * @constructor
     * @param {HTMLElement} body JSPソースコードが記述された要素(通常はBODY)
     */    
    constructor: JspPreview
    /**
     * ドキュメント内のJSPソースコード
     * @property source
     * @type String
     */
  , source: null
    /**
     * JSPのDOMツリーを格納したjQuery結果セット
     * @property $jsp
     * @type jQuery
     */
  , $jsp: null
    /**
     * JSPを再レンダリングし、プレビューを更新する。
     * @method render
     * @chainable
     */
  , render: JspPreview_render
  });

  /**
   * イベント定義
   */
  JspPreview.event = {
     
  };

  function JspPreview(body) {
    this.constructor = JspPreview;
    Widget.call(this, body);

    this.source = this.$node.html()
                      .replace(/&lt;/g, '<').replace(/&gt;/g, '>'); 
    try {
      this.$jsp = $.jsp(this.source, '__page');
    } catch(e) {
      alert(e);
    }
    this.$node.empty();
    this.render();
  } 

  function JspPreview_render() {
    this.$node.empty();
    this.$jsp.clone()
             .appendTo(this.$node)
             .jsp_eval();
    return this;
  }

  return JspPreview;
});

