/**
 * iOSビューポート制御不具合修正
 * ================================================
 * iOSデバイスにおいて、viewportをdevice-widthに設定しかつユーザによる拡大・縮小を禁止
 * した場合に、デバイスの縦横表示の切替をくりかえすと、画面の表示がすこしずつ拡大して
 * いくという問題がある。(iOS6/iOS7での発生を確認)
 *
 * 本スクリプトでは、この問題を回避するためのものである。
 *
 * @author Iwauo Tajima
 * @module nablarch.ui.device
 */
define(['jquery', 'sugar'], function($) {
  var device = window.nablarch_device.type
    , fixedViewPort;

  if (device !== 'iphone' && device !== 'ipad') {
    return;
  }

  fixedViewPort = (device === 'ipad')   ? "width=768px, minimum-scale=1.0, maximum-scale=1.0"
                : (device === 'iphone') ? "width=device-width, minimum-scale=1.0, maximum-scale=1.0"
                : null;

  $(function() {
    fixViewPort();
    $('body').on('gesturestart', fixViewPort);
  });

  // --- helper functions --- //
  function fixViewPort() {
    $('meta[name="viewport"]').attr('content', fixedViewPort);
  }
});

