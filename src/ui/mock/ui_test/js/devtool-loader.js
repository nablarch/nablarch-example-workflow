/**
 * モック画面JSP開発用ツール起動スクリプト
 *
 * 以下の使用例のようにJSPの先頭にDOCTYPE宣言とJSPコメントで囲ったスクリプトタグを
 * 記述することで、JSPのローカルレンダリング等の各種開発用機能が有効となる。
 *
 * @example
 *     <!DOCTYPE html>
 *     <%-- <script src="js/devtool.js"></script> --%>
 *     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 *     <%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
 *     <%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
 *     <%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
 *     <%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
 *     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 *
 *     <t:page_template
 *       title="ユーザ情報登録"
 *       confirmationPageTitle="ユーザ情報登録確認">
 *     ....
 *     </t:page_template>
 *
 * @module devtool
 * @author Iwauo Tajima
 * @since 1.3
 */
var require = require || {};

// JSPのコンパイルが完了するまで画面全体を非表示にする。
document.write( '<style>body {display:none;} body.loaded {display:block}</style>');

// Object.create() の shim (IE8以下用)
if (typeof Object.create === 'undefined') {
  Object.create = function (proto) {
    function F() {};
    F.prototype = proto;
    return new F();
  };
}

(function(document, require) { "use strict";
  // minifyされていない場合は先にrequire.jsをロードしてから初期化する。
  var scripts = document.scripts
    , script  = scripts[scripts.length - 1]
    , head    = script.parentNode
    , jsPath  = script.src + '/../'
    , loader  = document.createElement('script');

  // minify済みスクリプトの場合はrequirejsが同梱されているのでそのまま初期化する。
  if (typeof require === 'function') {
    require.config({baseUrl : jsPath});
    require(['jquery', 'devtool/Main'], function($, Main) {
      $(function() {
        var $body = $('body');
        $body.widget(Main);
        $(document).on('jsp_processed', function() {
          require(['nablarch/ui/readonly'], function(readonly){
            $("select, input, textarea")
              .filter("." + readonly.markerCss)
              .readonly();
          });
          $body.addClass('loaded');
        });
      });
    });
    return;
  }

  // ツールおよび依存スクリプトをロードする。
  loader.setAttribute('src', jsPath + 'require.js');
  require.baseUrl  = jsPath;
  require.deps     = ['jquery', 'devtool/Main'];
  require.callback = function($, Main) {
    var $body = $('body');
    $body.widget(Main);
    $(document).on('jsp_processed', function() {
      require(['nablarch/ui/readonly'], function(readonly){
        $("select, input, textarea")
          .filter("." + readonly.markerCss)
          .readonly();
      });
      $body.addClass('loaded');
    });
  };
  head.insertBefore(loader, null);

})(document, require);

