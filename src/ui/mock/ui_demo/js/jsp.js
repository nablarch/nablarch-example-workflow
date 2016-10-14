/**
 * ページ上JSPソースコードをブラウザ上でモックレンダリングするjQuery拡張。
 *
 * 各JSPタグを対応するHTMLタグに変換する処理は、 `jsp/taglib/(タグリブ名).js` に
 * ディスパッチされる。
 * 例えば、 `<c:if>` の変換は `jsp/taglib/jstl.js` で行なわれる。
 *
 * @example
 *     var src     = $('body').html()    // JSPソースコード
 *       , $jsp    = $.jsp(src)          // JSPタグのDOMノードを作成。
 *       , context = {login_id: 'user1'} // セッション・リクエスト・ページコンテキストの内容
 *
 *     $('body').remove();     // JSPソースを画面から除去
 *
 *     $jsp.jsp_eval(context)  // JSPのDOMノードをHTMLのDOMに変換し、
 *         .appendTo('body');  // 画面に表示する。
 *
 *     $jsp.find('c\\:if').attr('test', 'true'); // 全ての<c:if>タグの条件式を真に変更。
 *
 *     $('body').remove()
 *              .append($jsp.jsp_eval(context)); // 再描画
 *
 * @module jsp
 * @requires jquery, jsp/context, jsp/el, sugar
 *
 * @author Iwauo Tajima
 * @since  1.3
 */
define(['jquery', 'jsp/context', 'jsp/el', 'devtool/jsp_verifier', 'devtool/WidgetListView','sugar'],
function($, topContext, el, verifier, widgetListView) { 'use strict';

  var alias = {
        button : 'button'
      , field  : 'field'
      , c      : 'jstl'
      , jsp    : 'jsp'
      , n      : 'nablarch'
      , t      : 'template'
      };

  function define() {
    $.jsp               = jquery_jsp;
    $.jsp_pageContext   = topContext;
    $.loadTagfile       = jquery_loadTagfile;
    $.loadedTags        = {};
    $.fn.jsp_eval       = jquery_jsp_eval;
    $.fn.jsp_attrs      = jquery_jsp_attrs;
    $.fn.jsp_evaledNode = jqeury_jsp_evaledNode;
    $.fn.jsp_verify     = jquery_jsp_verify;
    $.fn.jsp_showError  = jquery_jsp_showError;
    $.fn.jsp_showSource = jquery_jsp_showSource;
    $.fn.jsp_addError   = jquery_jsp_addError;

    // JSPレンダリング完了イベント
    var pid = setInterval(function() {
      var $jspTagsUnprocessed = $('div[data-jsp]');
      if (!$jspTagsUnprocessed.length) {
        $.event.trigger($.Event('jsp_processed'));
        clearInterval(pid);
      }
    }, 1000);

    return $;
  }

  function jqeury_jsp_evaledNode() {
    return this.first().contents().first().next();
  }

  /**
   * 指定されたパス上のタグファイルをJSPタグの内容として展開する。
   *
   * @method loadTagfile
   * @static
   * @for jQuery
   * @param {String} path タグファイルのコンテキストルート配下からの相対パス。
   * @param {jQuery} $tagBody 現在処理中のJSPタグを格納したjQuery結果セット
   * @param {Object} context 現在のコンテキスト変数を格納したオブジェクト
   * @param {String} tagName 現在処理中のJSPタグのタグ名
   * @return {boolean} 常にfalseを返す。
   */
  function jquery_loadTagfile(path, $tagBody, context, tagName) {
    var $tag = $(this);
    context['__$tagBody'] = $tagBody;
    $tag.jsp_verify(path, tagName, function($content) {
      $tag.replaceWith($content);
      $content.jsp_eval(context);
    });
    return false;
  }

  function jquery_jsp_verify(path, tagName, callback) {
    var $tag   = $(this)
      , jsp    = $tag[0].outerHTML
      , module = ('text!' + path + '/' + tagName + '.tag').replace(/\/+/g, '/');

    require([module], function(content) {
      var $content = $.jsp(content, module);

      $.loadedTags[$tag[0].tagName] = '';
      verifier.verify(module, $tag);
      $tag.jsp_showError();
      if (callback) {
        callback.call($tag[0], $content);
      }
    });
    return false;
  }

  function jquery_jsp_addError(message) {
    jquery_jsp_showError.messages.push(message);
  }

  jquery_jsp_showError.messages = [];


  function jquery_jsp_showSource() {
    var src     = jquery_jsp.meta.pageSrc.escapeHTML()
      , nid     = this.attr('data-seq')
      , tagName = this.attr('data-jsp')
      , tagPtn  = /\&lt;([-_:a-zA-Z0-9]+) data-seq=\&quot;([0-9]+)\&quot;(.*?)\&gt;/g
      , $pain   = $('div.sourceView').show();

    if ($('div.sourceView pre').length) return;

    src = src.replace(tagPtn, function(openTag, currName, currNid, following) {
      var docroot = "./tools/doc/_build/html/reference_jsp_widgets/"
        , docpath = docroot + currName.replace(':', '_').toLowerCase() + '.html'
        , html = '&lt;' + '<a target="widgetList" href="' + docpath + '">'
               + currName + '</a>' + following + '&gt;'

      if (currNid === nid) {
        html = '<span style="color:red;font-weight:bold;background-color:#ffe0e0">' + html + '</span>';
      }
      return html;
    });

    $('<h1>').text('JSPソースコード').appendTo($pain);
    $('<button style="margin: 5px">')
      .text('閉じる')
      .on('click', function(){$pain.hide()})
      .appendTo($pain);
    $('<button style="margin: 5px">')
      .text('解説書を開く')
      .on('click', function(){
        window.open(widgetListView.widgetList, 'widgetList');})
      .appendTo($pain);

    jquery_jsp_showError.messages.each(function(message, i) {
      $('<h2>').text('エラー' + (i+1) + ': ' + message).appendTo($pain);
    });
    if (jquery_jsp_showError.messages.length) {
      $('<div style="margin: 10px; font-weight:bold;">')
        .text('(エラー箇所をハイライト表示しています。)')
        .appendTo($pain);
    }
    $('<pre style="padding:20px;">').html(src).appendTo($pain);
  }


  function jquery_jsp_showError() {
    if (!jquery_jsp_showError.messages.length) return;
    if ($('div.sourceView pre').length) return;
    return this.jsp_showSource();
  }


  /**
   * JSPソースコードをDOMノードに変換する。
   *
   * この際、IE8以前とそれ以外のブラウザではXMLの名前空間の扱いが異なるため、
   * jspタグ名とライブラリ名とのセパレータ文字 ":" を "__"に置換し、
   * 一旦、タグ名の接頭辞に組み込む。
   *
   * また、これとあわせて以下の事前処理を行う。
   *
   * 1. JSPコメント(<%-- --%>)の除去。
   *
   * 2. 属性値内に存在する<n:write>タグを等価なEL式に置換
   *    (属性値内に<n:write>タグが記述されていると、DOMに変換できなくなるため)
   *
   * 3. ブラウザが暗黙的にノード構造の書き換えを行なってしまう以下のタグについて
   *    <html:xx>として一旦退避し、html.jsで書き戻す。
   *
   *    - title/style:
   *      HTMLの定義では子要素を持たないので、<n:write>などのタグを
   *      一律テキストノードに置換してしまう。
   *
   *    - table/tr/td/th:
   *      親子関係が厳格なため、tagfileやincludeファイル内でtrやtdを単独で配置
   *      すると、ノードツリーから削除されてしまう。
   *
   * 4. JSPファイル内のトップレベルに記述されたテキストノード(=ディレクティブ)
   *    は読み飛ばす。
   *
   * @method jsp
   * @for jQuery
   * @static
   * @param {String} src JSPソースコード
   * @return {jQuery} JSPタグのDOMノード
   */
  function jquery_jsp(src, moduleName) {
    var comment   = /<%--[\s\S]*?--%>/g
      , attribute = /([-_$a-zA-Z]+)\s*=\s*('[^']*'|"[^"]*")/g
      , directive = /<%@\s*([a-zA-Z]+)\s+(.*?)%>/g
      , writeTag  = /<n\:write\s(\s*[-_$a-zA-Z0-9]+\s*=\s*('[^']*'|"[^"]*"))+\s*\/?>(\s*<\/n\:write>)?/ig
      , nameAttr  = /name\s*=\s*('[^']*'|"[^"]*")/
      , tags      = ['(?:[_a-zA-Z]+:[_a-zA-Z]+)'
                    , 'title', 'style', 'table', 'tr', 'td', 'th', 'script', 'select'].join('|')
      , openTag   = new RegExp('<('+tags+')(/?>|\\s[^>]*/?>)', 'ig')
      , closeTag  = new RegExp('</('+tags+')>', 'ig')
      , meta      = jquery_jsp.meta[moduleName];

    if (moduleName === '__page') {
      var src = src.replace(openTag, function(_, tagName, following) {
        return '<' + tagName + ' data-seq="' + (++jsp_seq) + '"' + following;
      });
      jquery_jsp.meta.pageSrc = src;
    }

    if (!meta) {
      meta = {};
      meta.attributes = {};
      meta.src = normalize(src);
      jquery_jsp.meta[moduleName] = meta;
    }
    return $(meta.src).filter(function(){ return this.nodeType != 3 });

    //---------- subroutines -------------------//
    function normalizedTagName(tagName) {
      return (
        (tagName.indexOf(':') === -1) ? ('html:' + tagName) : tagName
      ).toLowerCase();
    }

    function normalize(src) {
      return src.replace(comment,   '')
                .replace(directive, directiveReplacement)
                .replace(attribute, attributeReplacement)
                .replace(openTag,   openTagReplacement)
                .replace(closeTag,  '</div>');

      function attributeReplacement(_, name, value) {
        value = value.replace(writeTag, function(tag) {
          var m    = nameAttr.exec(tag)
            , name = m[1];
          return name ? '${' + m[1].slice(1, -1) + '}': '';
        });
        if (name === 'disabled') {
          name = '__disabled';
        }
        return name + '=' + value;
      }

      function directiveReplacement(_, directiveName, content) {
        if (!meta || directiveName != 'attribute') {
          return '';
        }
        var attrSpec = {};
        content.replace(attribute, function(_, name, value) {
          attrSpec[name] = value.slice(1, -1);
        });
        meta.attributes[attrSpec.name.toLowerCase()] = attrSpec;
        return '';
      }

      function openTagReplacement(_, tagName, following) {
        return '<div data-jsp="' + normalizedTagName(tagName) + '" ' + following;
      }
    }
  }
  jquery_jsp.meta = Object.create(null);
  jsp_seq = 0;

  /**
   * jQuery結果セット中の最初の要素の属性値を格納した `Object` を返す。
   * 各属性値中のel式は、引数のコンテキストを用いて評価される。
   *
   * @example
   *     $text = $('<field:text>', {cssClass:'(index % 2 == 0) ? "even" : "odd"'});
   *
   *     $text.jsp_attr({index:8}).cssClass // -> "even"
   *
   * @method jsp_attrs
   * @for jQuery
   * @param {Object} context コンテキスト変数を格納したObject
   * @return {Object} JSPタグの属性値を格納したObject
   */
  function jquery_jsp_attrs(context) {
    var tag   = this[0]
      , $tag  = $(tag)
      , attrs = $tag.data('jsp_attrs');

    if (attrs) {
      return attrs;
    }
    attrs = {};
    $.each(tag.attributes, function() {
      var name = this.nodeName.toLowerCase()
        , val  = el(this.nodeValue, context) || '';

      if (['data-jsp'].any(name)) {
        return;
      }
      if (['readonly', 'multiple'].any(name)) {
        if (val === 'true'|| val === name) {
          val = 'true';
        }
        else if (!val || val === 'false' ) {
          return;
        }
      }
      attrs[name] = val;
    });
    // javaの予約語とバッティングしているhtmlの属性名のエイリアスを解消する。
    if (attrs.cssclass) {
      attrs['class'] = attrs.cssclass;
    }

    if (attrs.__disabled) {
      if (attrs.__disabled == 'true' || attrs.__disabled === 'disabled') {
        attrs.disabled = 'true';
      }
      else {
        delete attrs.disabled;
      }
    }

    $tag.data('jsp_attrs', attrs);
    return attrs;
  }

  /**
   * jQuery結果セット内のJSPタグを評価し、HTMLタグに変換する。
   *
   * 各タグは以下のように変換される。
   *
   * 1. HTMLコメントノード (nodeType:8)
   *
   *   なにもせずそのまま残す。
   *
   * 2. テキストノード (nodeType:3)
   *
   *   テキスト中のel式(${...})を評価後の値に置換する。
   *
   * 3. HTMLタグノード
   *
   *   属性値中のel式を評価後の値に置換する。。
   *
   * 4. JSPタグノード
   *
   *   `jsp/taglib/(タグリブ名).js` に処理をディスパッチする。
   *   例えば、 `<c:if>` の変換は `jsp/taglib/jstl.js` で行なう。
   *
   * @method jsp_eval
   * @param {Object} [context] コンテキスト変数を格納したObject
   *                            省略時は `jsp/context` の内容を使用する。
   * @return {jQuery} 変換後のHTMLタグのDOMノードを格納したjQuery結果セット
   */
  function jquery_jsp_eval(context) {
    return this.each(function() {

      // テキストノード中のel式を評価する。
      if (this.nodeType === 3) {
        handleTextNode(this, context);
        return;
      }

      // HTMLコメントは読み飛ばす
      if (this.nodeType === 8) {
        return;
      }

      var tag       = this
        , match     = /(\w+):(\w+)/.exec(this.getAttribute('data-jsp'))
        , isJSP     = !!(match)
        , namespace = isJSP && match[1].toLowerCase()
        , tagName   = isJSP && match[2].toLowerCase();

      context   = context || topContext;
      namespace = alias[namespace] || namespace;

      // HTML要素のノード
      if (!isJSP) {
        handleHtmlElement(tag, context);
        return;
      }

      if (namespace === 'nablarch' && tagName == 'set') {
        doSetTag(tag, context);
        return;
      }

      require(['jsp/taglib/' + namespace], function(taglib) {
        var doTag       = Object.isFunction(taglib) ? taglib : taglib[tagName]
          , $jspTag     = $(tag)
          , $tagBody    = $jspTag.contents().detach()
          , pageContext = Object.create(context)
          , $translated;

        if (!doTag) {
          throw new Error('Unknown tag  ' + namespace + ':' + tagName);
        }

        Object.merge(pageContext, $jspTag.jsp_attrs(context));

        $tagBody.filter('div[data-jsp="jsp:attribute"]').each(function() {
          var $attribute = $(this)
            , $fragment  = $('<div>').append($attribute.contents().remove())
            , attrs      = $attribute.jsp_attrs(pageContext);

          pageContext[attrs.name] = function(_context) {
            var __context = Object.create(_context);
            __context[attrs.name]   = context[attrs.name];
            __context['__$tagBody'] = context['__$tagBody'];
            return $fragment.clone().jsp_eval(__context).contents();
          };
        });

        $translated = doTag.apply(tag, [$tagBody, pageContext, tagName, context]);
        if ($translated === false) {
          return;
        }
        $translated = $translated || $tagBody;
        $jspTag.replaceWith($translated);
        $translated.jsp_eval(pageContext);
      });
    });
  }

  function handleHtmlElement(tag, context) {
    var $tag  = $(tag)
      , attrs = Object.reject($tag.jsp_attrs(context), 'type');

    $tag.attr(attrs)
        .contents()
        .jsp_eval(Object.create(context));
  }

  function handleTextNode(node, context) {
    handleTextNode = (node.textContent !== undefined)
                   ? handleTextNode_modernBrowsers
                   : handleTextNode_oldIE;
    return handleTextNode(node, context);

    function handleTextNode_modernBrowsers(n, c) {
      n.textContent = el(n.textContent, c);
    }

    function handleTextNode_oldIE(n, c) {
      n.nodeValue = el(n.nodeValue, c);
    }
  }

  function doSetTag(tag, context) {
    var $tag    = $(tag)
      , attrs   = $tag.jsp_attrs(context)
      , varName = attrs['var']
      , name    = attrs['name']
      , value   = name ? context.getVar(name) : attrs['value'];

    if (typeof varName === 'undefined') {
      throw new Error('n:set tag needs "var" attribute. : ' + this.outerHTML);
    }

    context.setVar(varName, value);
    $tag.remove();
    return false;
  }



  return define();
});
