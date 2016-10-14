/**
 * ブラウザによる暗黙的DOM操作の対象となるので、仮想的なJSPタグに置換したタグを
 * 元のHTMLタグに復旧する。
 * 
 * 対象となるHTMLタグは以下のとおり。
 * 
 *   - **title/style:**  
 *       HTMLの仕様上ボディ部が存在しないので、
 *       ボディに記述したJSPタグがテキストノード扱いになってしまう。
 *       
 *   - **table/tr/td/th:**  
 *       親子関係が厳密であるため、直接の親子がJSPタグであったり、
 *       タグファイル中に独立に存在していたりすると、DOMノードから除去されてしまう。
 *      
 * @module jsp.taglib
 * @class jsp.taglib.html
 * @author Iwauo Tajima 
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  return {
    script : $.noop
  , title  : setTitle
  , style  : setStyle
  , tr     : htmlTag.fill('tr')
  , td     : htmlTag.fill('td')
  , th     : htmlTag.fill('th')
  , table  : htmlTag.fill('table')
  , select : htmlTag.fill('select')
  };

  function htmlTag(tagName, $tagBody, context) {
    var $tag
      , styleName;
    $tag = $('<'+tagName+'>').attr($(this).jsp_attrs(context)).append($tagBody);

    if (tagName === 'td' && context.css) {
      // IE対策。column.jsで退避したwidth属性をcss属性として復元する
      for (styleName in context.css) {
        if (context.css.hasOwnProperty(styleName)) {
          $tag.css(styleName, context.css[styleName]);
        }
      }
    }
    return $tag;
  }
  
  function setTitle($tagBody, context) {
    var $title = $('<div>', $(this).jsp_attrs(context)).append($tagBody);
    $(this).remove();
    $title.jsp_eval(context);
    setTimeout(function() {
      document.title = $title.text();
      $title.remove();
    }, 1000);
    return false;
  }
  
  function setStyle($tagBody, context) {
    var $style = $('<style>', $(this).jsp_attrs(context))
      , $cssText = $('<div>').append($tagBody).jsp_eval(context);
    $(this).remove();
    setTimeout(function() {
      $('head').append($style);
      if ($style[0].styleSheet) {
        $style[0].styleSheet.cssText = $cssText.text();
      }
      else {
        $style.text($cssText.text());
      }
      $tagBody.remove();
    }, 1000);
    return false;
  }
});
