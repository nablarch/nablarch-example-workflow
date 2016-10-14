/**
 * @module devtool
 */
define(['jquery', 'nablarch/ui/Widget', 'sugar', './SpecSheetInterpreter'],
function($, Widget, template, interpreter) { 'use strict';
 /**
  * Nablarch画面項目設計ビュー
  * 
  * @class devtool.SpecSheetView
  * @author Iwauo Tajima
  */
  SpecSheetView.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     * 
     * @method SpecSheetView
     * @param {HTMLElement} element 項目定義書ビューのDOM
     * @return {devtool.SpecSheetView} インスタンス
     */
    constructor: SpecSheetView
    /**
     * 引数に渡したJSPのDOMノードをから画面項目を抽出して
     * 画面項目定義のビューを表示する。
     * @method render
     * @param {jQuery} $jsp JSPのDOMノードを格納したjQuery結果セット
     */
  , render : SpecSheetView_render
  });
  
  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @type String
   * @default "devtool_SpecSheetView"
   */
  SpecSheetView.widgetType = 'devtool_SpecSheetView';
  
  /**
   * イベント定義
   */
  SpecSheetView.event = {
  };
  
  function SpecSheetView_render($jsp) {
	  var self = this
	    , subwin = window.open('./specsheet_template/SpecSheetTemplate.htm', 'SpecSheetView');

    self.$jsp = $jsp;
    var $subwindoc = $(subwin.document);
    setTimeout(function() {
      subwin.document.title = '【画面機能設計】';
      var $sheetDoc = $(subwin.frSheet.document)
        , $hoverStyle = $('<style>').html(
            'tr.spec_hover, td.spec_hover, th.spec_hover, label.spec_hover, .spec_layout.spec_hover {'
          + '  background-color: rgba(10, 10, 250, .2) !important;'
          + '}'
          + '.fieldinput.spec_hover {'
          + '  outline-color: rgba(10, 10, 250, .2);'
          + '  outline-width: 5px;'
          + '  outline-style: solid;'
          + '}'
          + '.buttonWrapper.spec_hover {'
          + '  outline-color: rgba(10, 10, 250, .4);'
          + '  outline-width: 10px;'
          + '  outline-style: solid;'
          + '}'
          + '.spec_unknown_identifier {'
          + '  color: red;'
          + '}'
          );
      $hoverStyle.clone().appendTo($sheetDoc.find('head'));
      $hoverStyle.clone().appendTo('head');
      new interpreter($sheetDoc.contents()).eval($jsp);
    }, 3000);
    return;
  }

  function SpecSheetView(element) {
    var self = this;
    this.constructor = SpecSheetView;
    Widget.call(this, element);
  }
  
  return SpecSheetView;
});

