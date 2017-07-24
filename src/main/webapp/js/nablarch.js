(function(global) { "use strict";
  //Object.create() の shim (IE8以下用)
  if (typeof Object.create === 'undefined') {
    Object.create = function (proto) {
      function F() {};
      F.prototype = proto;
      return new F();
    };
  }

  // スクリプトパス
  var scripts   = document.scripts
    , script    = scripts[scripts.length-1]
    , path      = script.src.replace(/[?;].*/, "")
    , scriptDir = path + "/../";

  // requireJS 初期設定
  require.config({
    baseUrl: scriptDir
  });

  // 初期ロード対象コンポーネント
  require(["jquery", "nablarch/ui"], function($, ui) {
    $(function() {
      if ('ontouchstart' in window) {
        // タッチ操作ではhover時の機能のスタイルを無効にする。
        $('#aside').find('.hover').removeClass('hover');
      }
      ui.Widget.init();
    });
  });

})(window);

