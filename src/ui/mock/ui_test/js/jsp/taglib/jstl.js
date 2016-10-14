/**
 * JSTLタグライブラリ(`<c:xxx>`)のエミューレーションを行う。
 * 
 * @module jsp.taglib
 * @class jsp.taglib.jstl
 * @author Iwauo Tajima 
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  return {
    /**
     * `<c:if>`タグのエミュレーションを行う。
     * 
     * `test`属性値が、el式の評価後に真と判断できる値となる場合はタグボディの内容を展開する。
     * そうでない場合は、単に無視する。
     * 
     * @method if
     */
    'if': doIfTag
    /**
     * `<c:set>`タグのエミュレーションを行う。
     * 
     * `name`属性値と同じ名前のコンテキスト変数に値を設定する。  
     * `value`属性値が設定されている場合は、その内容を変数値に設定し、
     * `varName`属性値が設定されている場合は、その値と同じ名前のコンテキスト変数の
     * 値を変数値に設定する。
     * 
     * @method set
     */
  , 'set': doSetTag
    /**
     * `<c:forEach>`タグのエミュレーションを行う。
     * 
     * タグボディの内容を指定された回数だけ繰り返し展開する。  
     * `begin`/`end`属性値が設定されている場合は、その差の回数だけ繰り返す。  
     * `items` 属性値に配列型のオブジェクトが設定されている場合は、その要素分だけ
     * 繰り返す。
     * 
     * 繰り返しごとに、`var`属性値および`varStatus`属性値に指定されたコンテキスト変数に対し、
     * それぞれ、配列要素およびカウンタが設定される。
     * 
     * @method foreach
     */  
  , 'foreach': doForEachTag
  };

  function doSetTag($tagBody, _, __, context) {
    var $tag    = $(this)
      , attrs   = $tag.jsp_attrs(context)
      , varName = attrs['var'].toLowerCase()
      , value   = attrs['value'];

    context[varName] = value;
    $tag.remove();
    return false;
  }
  
  function doIfTag($tagBody, _, __, context) {
    var $tag  = $(this)
      , attrs = $tag.jsp_attrs(context)
      , conditions = context.getVar('nablarch_spec_conditions')
      , specDesc = conditions && $tagBody.filter('[data-jsp="spec:desc"]').text().trim();

    if (conditions && specDesc) {
      if (conditions.split('|').some(specDesc)) {
        $tag.replaceWith($tagBody);
        $tagBody.jsp_eval(context);
      }
      else {
        $tag.remove();
      }
      return false;
    }

    if (attrs.hasOwnProperty('test') && isFalsy(attrs.test)) {
      $tag.remove();
    }
    else {
      $tag.replaceWith($tagBody);
      $tagBody.jsp_eval(context);
    }
    return false;
  }

  function isFalsy(expr) {
    return Object.isString(expr) && expr.match(/^\s*false\s*$/i)
        || !expr;
  }
  
  function doForEachTag($tagBody, _, __, context) {
    var $tag      = $(this)
      , attrs     = $tag.jsp_attrs(context)
      , items     = attrs.items
      , begin     = Number(attrs.begin) || 0
      , end       = Number(attrs.end) || (items && items.length-1) || 0
      , varItem   = attrs['var']
      , varStatus = attrs.varstatus
      , blockContext
      , status, index, item
      , $loopBody = $('<div>').append($tagBody) 
      , $each;

    for (index = begin; index <= end; index++) {
      count = index - begin + 1;
      status = {index:index, count: count};
      blockContext = Object.create(context);
      if (varStatus) {
        blockContext.setVar(varStatus, status);
      }
      if (varItem && items) {
        blockContext.setVar(varItem, items[index]);
      }
      $each = $loopBody.clone();
      $each.jsp_eval(blockContext);
      $tag.before($each.contents());
      $each.remove();
    }
    $tagBody.remove();
    $tag.remove();
    return false;
  }
  
});


