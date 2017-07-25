define(['jquery', './Listener', './RevertValue', 'sugar'],
function($, Listener, RevertValue) { 'use strict';
  /**
   * ダイアログ表示アクション
   * =============================================
   * 発生したイベントでダイアログを表示するアクション。
   *
   *
   * マークアップ仕様
   * -------------------------------------------
   * 本機能を使用する場合以下のマーカCSSを使用する。
   *
   * 1. イベントを管理するための指定
   *
   *   イベントを定義した要素内に
   *   マーカCSSとして `nablarch_event_Action -type ShowDialog` を指定する。
   *
   * 2. イベント発生時にダイアログを表示する制御
   *
   *  eventの監視対象、もしくはtargetで指定したセレクタに一致する要素
   *
   * 以下は、このウィジェットのオプションの一覧である。
   *
   * **-dialog (String):**
   *   表示するダイアログ。 **alert** と **confirm** をサポートしている。
   *
   * **-target (セレクタ方式):**
   *   ダイアログを表示する条件を持つ要素。target要素が下記のwhenで指定された状態の場合、ダイアログを表示する。
   *   指定しない場合は、eventの監視対象をtargetととする。
   *
   * **-when (セレクタ方式):**
   *   ダイアログを表示する条件。指定しない場合は、必ず表示する。(イベントが途中で停止した場合を除く)
   *
   * **実装例 (HTML)**
   *
   * 以下は、監視対象の要素が「value=1」のとき「name属性がform.ではじまる要素」を「活性化」する場合のマークアップ。
   *
   * <div style="display:none;"
   *      class="nablarch_event_Action
   *        -type     ShowDialog
   *        -dialog   confirm
   *        -target   [name^="form.userType"]
   *        -when     :is-value(admin)
   *        -message  変更してもよいですか?
   *      ">
   * </div>
   *
   * @class nablarch.ui.event.ShowDialog
   *
   * @author tani takanori
   * @since  1.4
   *
   */
  ShowDialogAction.prototype = {
    /**
     * コンストラクタ。
     * @constructor
     */
    constructor    : ShowDialogAction
    /**
     * 表示するダイアログの種類。(alert|confirm)
     *
     * @property dialog
     * @type String
     */
  , dialog     : null
    /**
     * 監視している対象以外を条件とする場合、
     * 条件を判定する対象の要素。
     *
     * @property target
     * @type element
     */
  , target  : null
    /**
     * 対象が一致した場合にダイアログを表示する条件。
     *
     * @property condition
     * @type セレクタ形式
     */
  , condition : null
    /**
     * 対象が一致した場合にダイアログを表示する条件。
     *
     * @property target
     * @type String
     */
  , message : null
    /**
     * 監視対象のイベントが発火した際に呼び出されるメソッド。
     *
     * @method fire
     */
  , fire          : ShowDialogAction_fire
    /**
     * 初期処理。
     *
     * 値復元用に現在のvalueを保持する。
     *
     * @method init
     */
  , init          : ShowDailogAction_init
    /**
     * ダイアログを表示する。
     *
     * @method showDialog
     * @return ユーザーがキャンセルした場合false、それ以外はtrue
     */
  , showDialog    : ShowDialogAction_showDialog
    /**
     * ユーザーがキャンセルした場合に値を復元するかどうかを制御する。
     *
     * @property revert
     */
  , revert        : null
    /**
     * ユーザーがキャンセルした場合に後続のイベントを停止するかどうかを制御する。
     *
     * @property stop
     */
  , stop          : null
  };

  function ShowDialogAction(opts) {
    this.constructor = ShowDialogAction;
    Object.merge(this, opts);
    this.revert = new RevertValue(opts.revert === "true");
    this.stop   = opts.stop === "true";
  }

  function ShowDailogAction_init(listener) {
     this.revert.init(listener);
  }

  function ShowDialogAction_fire(listener, event, actions) {
     var self = this;
     if (event.type === "change") {
       setTimeout(delay(self, event), 0);
       return false;
     }
     return this.showDialog(event);

     // 処理を遅延させるためのsub routine
     function delay(self, event) {
       return function() {
         var ok  = self.showDialog(event);
         if(ok || !self.stop) {
           actions.each(function(action, i) {
             return action.fire.apply(action, [listener, event, actions.from(i+1)]);
           });
         }
         if (!ok) {
           // タッチ操作のソフトウェアキーボードがあるとそのまま入力されてしまうので、
           // キャンセルされたら、フォーカスをコントロールして、キーボードなどで操作できないようにしてあげる。
           $(event.currentTarget).blur().focus();
         }
       };
     }
  }

  function ShowDialogAction_showDialog(event) {
     var $target = $(this.target || event.currentTarget)
      ,  show   = this.condition || '*'
      ,  dialog = window[this.dialog]
      ,  cancel = false;
     if ($target.is(show)) {
       cancel = !dialog(this.message);
       if (cancel) {
         this.revert.revert();
         if (event.type !== "change") {
           event.preventDefault();
         }
         event.stopPropagation();
       }
     }
     this.revert.store();
     return !cancel;
  }

  Listener.register('ShowDialog', ShowDialogAction);
  return ShowDialogAction;
});