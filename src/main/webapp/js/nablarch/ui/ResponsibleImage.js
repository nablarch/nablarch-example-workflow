define([
  'text!./ResponsibleImage.template'
, 'text!./ResponsibleImageUnsupportRatio.template'
, 'text!./ResponsibleImageUnsupportMatchMedia.template'
, 'jquery', 'sugar'],
function(template, unsupportDevicePixelRatio, unsupportMatchMedia, $) { 'use strict';
  /**
   * 表示モードに対応した画像切替機能
   * =====================================================
   *
   * templateのプレースホルダを置き換え、メディアクエリに対応した背景画像を設定する。
   *
   * マークアップ仕様
   * **nablarch_ResponsibleImage**を指定したNodeに指定したオプションの値をテンプレートのプレースホルダに設定し、
   * スタイルとして定義する。
   *
   */
   function responsibleImage() {
     var $elements = $('.nablarch_ResponsibleImage')
       , base  = (window.devicePixelRatio) ? template
               : (window.matchMedia || window.msMatchMedia || document.documentMode >= 9) ? unsupportDevicePixelRatio
               : unsupportMatchMedia
       , styles = Array.prototype.map.call($elements, createStyle);
     $('head').append($('<style>' + styles.join(" ") + "</style>"));
     /**
      * Array.map 用の補助関数。
      * 各要素のclassから取得したoptionを元にimgのスタイルを生成する。
      */
     function createStyle(element) {
       return base.assign($(element).widgetOption());
     }
   }

   $(responsibleImage);
});