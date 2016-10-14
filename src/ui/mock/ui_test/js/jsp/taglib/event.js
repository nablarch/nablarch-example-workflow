/**
 * イベントのエミューレーションを行う。
 *
 * JSPタグ `<event:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/event/xxx.tag
 *
 * @module jsp.taglib
 * @class jsp.taglib.column
 * @author tani takanori
 */

define(['jsp', 'sugar'],
function($) { 'use strict';
  return function($tagBody, context, tagName, _context) {
    if (tagName === 'send_request') {
      // イベント系のタグでは、jsp:dobody部の内容を使用することはない。
      // このため、ボディ部にjsp:dobodyがある場合には削除しておく。
      $tagBody.filter('div[data-jsp="jsp:dobody"]').removeAttr('data-jsp');
    }

    return $.loadTagfile.apply(
      this, ['../WEB-INF/tags/widget/event/', $tagBody, context, tagName, _context]
    );
  };
});
