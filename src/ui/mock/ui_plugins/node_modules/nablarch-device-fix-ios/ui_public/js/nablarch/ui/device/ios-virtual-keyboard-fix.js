/**
 * iOSソフトウェアキーボート表示時不具合対応
 * ================================================
 * タッチデバイスは、入力要素にフォーカスした際に
 * ソフトウェアキーボードを表示させるが、
 * iOSの場合はソフトウェアキーボード表示中は、
 * 入力部品以外のUIスレッドが停止する。
 *
 * 特に、position:fixed で固定された要素の表示位置更新が
 * 一時的に行われなくなるので、キーボード表示の際のスクロールに
 * よって、固定要素が予期しない場所に移動してしまうように見える。
 *
 * このため、iOSデバイスでは、固定要素を一時的に非表示にすることで
 * 問題を回避する。
 *
 * 画面内に #top_nav #footer 以外の固定要素がある場合は、
 * 本スクリプトのセレクタを修正すること。
 *
 * @author Iwauo Tajima
 * @module nablarch.ui.device
 */
define(['jquery', 'sugar'], function($) {

  var device = window.nablarch_device.type;
  if (device !== 'iphone' && device !== 'ipad') {
    return;
  }

  $(function() {
    // 画面内の固定要素　
    var $fixed = $('#top_nav, #footer');
    $(document)
      .on('focus', 'input, textarea', function() { $fixed.hide() })
      .on('blur',  'input, textarea', function() { $fixed.show() });
  });
});

