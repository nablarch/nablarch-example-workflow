/**
 * レイアウトウィジェットのエミューレーションを行う。
 *
 * JSPタグ `<layout:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/layout/xxx.tag
 *
 * @module jsp.taglib
 * @class jsp.taglib.layout
 * @author Takanori Tani
 */

define(['jsp', 'sugar'],
function($) { 'use strict';
  return $.loadTagfile.fill('../WEB-INF/tags/widget/layout/');
});
