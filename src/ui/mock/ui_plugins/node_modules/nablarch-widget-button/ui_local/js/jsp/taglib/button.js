/**
 * ボタンウィジェットのエミュレーションを行う。
 * 
 * JSPタグ `<button:xxx>` は下記のタグファイルにより描画される。  
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/button/xxx.tag
 * 
 * @module jsp.taglib
 * @class  jsp.taglib.button
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict'; 
  return $.loadTagfile.fill('../WEB-INF/tags/widget/button/');
});
