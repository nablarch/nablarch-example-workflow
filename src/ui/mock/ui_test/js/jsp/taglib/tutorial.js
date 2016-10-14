/**
 * チュートリアルで追加したfield系プラグインのサンプル値の移送処理を行う。
 *
 *
 * @module jsp.taglib
 * @class jsp.taglib.column
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'], function ($) {
  'use strict';
  return function (attrs, $tagBody, context, tagName) {
    var values;

    if (tagName === 'tel' && context.sample) {
      values = context.sample.split('-');
      context.setVar(attrs.areaname, values[0]);
      context.setVar(attrs.localname, values[1]);
      context.setVar(attrs.subscribername, values[2]);
    }

    if (tagName === 'extension_number' && context.sample) {
      values = context.sample.split('-');
      context.setVar(attrs.builname, values[0]);
      context.setVar(attrs.personalname, values[1]);
    }
  };
});

