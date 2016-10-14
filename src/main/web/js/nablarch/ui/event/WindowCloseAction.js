define(['jquery', './Listener', 'sugar'],
function($, Listener) { 'use strict';
  /**
   * ウィンドウクローズアクション
   * =============================================
   * ウィンドウをクローズする。
   *
   *
   * マークアップ仕様
   * -------------------------------------------
   * 本機能を使用する場合以下のマーカCSSを使用する。
   *
   * 1. イベントを管理するための指定
   *
   *   機能のプロパティを定義する要素に
   *   マーカCSSとして `nablarch_event_Action -type WindowClose` を指定する。
   *
   * @class nablarch.ui.event.WindowClose
   *
   * @author tani takanori
   * @since  1.4
   *
   */
  WindowCloseAction.prototype = {
    /**
     * コンストラクタ。
     * @constructor
     */
    constructor : WindowCloseAction
    /**
     * ウィンドウをクローズする。
     *
     * @method fire
     */
  , fire       : WindowCloseAction_fire
  };

  function WindowCloseAction(opts) {
    this.constructor = WindowCloseAction;
    Object.merge(this, opts);
  }

  function WindowCloseAction_fire(listener, event) {
    window.close();
  }

  Listener.register('WindowClose', WindowCloseAction);
  return WindowCloseAction;
});