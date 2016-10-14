/**
 * JSPタグライブラリ(`<jsp:xxx>`)のエミューレーションを行う。
 *
 * @module jsp.taglib
 * @class jsp.taglib.jsp
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  return {
    /**
     * `<jsp:invoke>`タグのエミュレーションを行う。
     *
     * `var`属性値と同じ名前のコンテキスト変数に設定された`fragment`を
     * タグの内容として展開する。
     *
     * @method invoke
     */
    invoke: doInvokeTag
    /**
     * `<jsp:include>`タグのエミュレーションを行う。
     *
     * `page`属性値に指定されたJSPページをロードし、タグの内容として展開する。
     * この際、直接の子要素となる`<jsp:param>`タグがタグボディに存在すれば、
     * その内容をネストしたコンテキスト変数に設定する。
     *
     * @method include
     */
  , include: doIncludeTag
    /**
     * `<jsp:attribute>`タグの評価は、親要素の評価時に行なうため、
     * ここでは単に無視してよい。
     *
     * @method attribute
     */
  , attribute: noop
    /**
     * `<jsp:param>`タグの評価は、親要素の評価時に行なうため、
     * ここでは単に無視してよい。
     *
     * @method param
     */
  , param: noop
    /**
     * `<jsp:doBody>`タグのエミュレーションを行う。
     *
     * コンテキスト変数`__$tagBody`に設定された`fragment`を
     * タグの内容として展開する。
     *
     * `__$tagBody`は、各JSPタグの評価時に暗黙的にコンテキストに格納される。
     *
     * @method dobody
     */
  , dobody: doDoBody
  };

  function noop($tagBody, context) {}

  function doInvokeTag($tagBody, _, __, context) {
    var $tag         = $(this)
      , attrs        = $tag.jsp_attrs(context)
      , fragmentName = attrs.fragment
      , varName      = attrs['var']
      , fragment    = context[fragmentName];

    if (!fragment) {
      $tag.remove();
      return false;
    }

    $(this).replaceWith(fragment.call(null, context));
    return false;
  }

  function doIncludeTag($tagBody, context) {
    var tag  = this
      , page = context.page.replace(/^\//, '')
      , base = (context.__jsp_load_base_path && page.indexOf('./') === 0)
             ? context.__jsp_load_base_path : ''
      , moduleName = 'text!../' + base + page;

    if (base) {
      page = page.slice(2, page.length);
    }
    $tagBody.filter('[data-jsp="jsp:param"]').each(function() {
      var attrs = $(this).jsp_attrs(context);
      context.setVar(attrs.name, attrs.value);
    });
    // encodeURI for IE8,9 bug
    require([encodeURI(moduleName)], function(include) {
      var $include = $.jsp(include, moduleName);
      $(tag).replaceWith($include);
      $include.jsp_eval(context);
    });
    return false;
  }

  function doDoBody(_, context, __, _context) {
    var $tagBody = context['__$tagBody'].clone();
    $(this).replaceWith($tagBody);
    $tagBody.jsp_eval(_context);
    return false;
  }
});
