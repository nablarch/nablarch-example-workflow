/**
 * リンクウィジェットのエミューレーションを行う。
 * 
 * JSPタグ `<link:xxx>` は下記のタグファイルにより描画される。  
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/link/xxx.tag
 * 
 * @module jsp.taglib
 * @class jsp.taglib.column
 * @author Iwauo Tajima 
 */

define(['jsp', 'sugar'],
function($) { 'use strict';
  return $.loadTagfile.fill('../WEB-INF/tags/widget/link/');
});
