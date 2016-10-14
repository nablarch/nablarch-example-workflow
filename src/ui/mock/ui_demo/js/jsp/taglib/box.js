/**
 * Boxのエミューレーションを行う。
 *
 * JSPタグ `<box:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/box/xxx.tag
 *
 * @module jsp.taglib
 * @class jsp.taglib.box
 * @author tani takanori
 */

define(['jsp', 'sugar'],
function($) { 'use strict';
  return $.loadTagfile.fill('../WEB-INF/tags/widget/box/');
});
