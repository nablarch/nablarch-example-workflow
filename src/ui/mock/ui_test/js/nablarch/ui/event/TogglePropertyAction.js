define(['jquery', './Listener', 'nablarch/ui/readonly', 'sugar'],
function($, Listener, readony) { 'use strict';
  /**
   * プロパティ切替アクション
   * =============================================
   * 初期ロード時と発生したイベントに応じて、対象要素のプロパティの切り替えを行うアクション。
   * 切り替え可能なタグはinput:checkbox,:radio,select
   * 切り替える値はbooleanをサポートする。
   *
   * マークアップ仕様
   * -------------------------------------------
   * 本機能を使用する場合以下のマーカCSSを使用する。
   *
   * 1. イベントを管理するための指定
   *
   *   機能のプロパティを定義する要素に
   *   マーカCSSとして `nablarch_event_Action -type ToggleProperty` を指定する。
   *
   * 2. イベント発生時にプロパティを切り替える要素の制御
   *
   *   監視対象のイベントが発生した場合、
   *   切り替える対象、切り替える条件を指定する。
   *
   * 以下は、このウィジェットのオプションの一覧である。
   *
   * **-toggleType (String):**
   *   booleanによって切り替えられるプロパティ名、または `readonly`
   *
   * **-condition (セレクタ方式):**
   *   監視対象の要素がセレクタに一致した場合に、プロパティの切り替えを行う。
   *
   * **-toggleTarget (セレクタ方式):**
   *   監視対象の要素が条件(condition)に一致した場合、プロパティを切り替える対象の要素のセレクタ。
   *   イベントを定義したコンテキスト内から対象を検索する。
   *
   * **-reverse (boolean):**
   *   プロパティの切り替えを逆転させる。
   *
   * **実装例 (HTML)**
   *
   * 以下は、監視対象の要素が「value=1」のとき「name属性がform.ではじまる要素」を「活性化」する場合のマークアップ。
   *
   * <div style="display:none;"
   *      class="nablarch_event_Action
   *        -type         ToggleProperty
   *        -toggleType   disabled
   *        -toggleTarget [name^="form."]
   *        -condition    [value="1"]
   *        -reverse      true
   *      ">
   * </div>
   *
   * @class nablarch.ui.event.ToggleAction
   *
   * @author tani takanori
   * @since  1.4
   *
   */
  TogglePropertyAction.prototype = {
    /**
     * コンストラクタ。
     * @constructor
     */
    constructor    : TogglePropertyAction
    /**
     * 処理判定を行う。
     * 監視対象がこの条件に一致する場合、プロパティの設定を行う。
     *
     * @property condition
     * @type String
     */
  , condition     : null
    /**
     * プロパティを切り替える対象を示すプロパティ。
     * @property toggleTarget
     * @type String
     */
  , toggleTarget  : null
    /**
     * どのプロパティを切り替えるかを示すプロパティ。
     * @property toggleTarget
     * @type String
     */
  , toggleType    : null
    /**
     * 監視対象のイベントが発火した際に呼び出されるメソッド。
     *
     * @method fire
     */
  , fire          : TogglePropertyAction_fire
    /**
     * 対象要素のプロパティを切り替える。
     *
     * @method toggle
     */
  , toggle        : TogglePropertyAction_toggle
    /**
     * 対象要素について、プロパティの設定をクリアする。
     * @method clear
     */
  , clear         : TogglePropertyAction_clear
    /**
     * イベント発火時に監視対象要素が条件に一致した場合に
     * プロパティの設定を行う。
     *
     * @method set
     */
  , set           : TogglePropertyAction_set
    /**
     * 初期イベント時にプロパティを切り替える。
     *
     * @method init
     */
  , init          : TogglePropertyAction_init
  };

  function TogglePropertyAction(opts) {
    this.constructor = TogglePropertyAction;
    Object.merge(this, opts);
    this.reverse = opts.reverse === 'true';
  }

  function TogglePropertyAction_fire(listener, event) {
    var $watchTarget = $(event.currentTarget);
    this.toggle($watchTarget, listener.$context);
    return this;
  }

  function TogglePropertyAction_toggle($watchTarget, $context) {
    var $target = $context.find(this.toggleTarget)
     ,  match   = conditionOf($watchTarget);

    if (needsClear($watchTarget, this.condition)) {
      this.clear($target);
    }
    if (match($watchTarget, this.condition)) {
      this.set($target);
    }
  };

  function conditionOf($watchTarget) {
    return $watchTarget.is('select')      ? conditionOfSelect
         : $watchTarget.is('input:radio') ? conditionOfRadio
                                          : conditionOfCheckbox;
  }

  function conditionOfSelect($node, condition) {
    return $node.find(condition).is(':selected');
  }

  function conditionOfRadio($node, condition) {
    return $node.filter(condition).is(':checked');
  }

  function conditionOfCheckbox($node, condition) {
    var checkbox = $node.filter(condition);
    return checkbox.length === 0 ? false
                                 : checkbox.is(':checked');
  }

  function needsClear($node, condition) {
    return $node.is(':not(:checkbox)') || $node.filter(condition).length > 0;
  }

  function TogglePropertyAction_clear($target) {
    setPropertyOf(this.toggleType, $target, this.reverse);
  }

  function TogglePropertyAction_set($target) {
    setPropertyOf(this.toggleType, $target, !this.reverse);
  }

  function setPropertyOf(type, $target, value) {
     return type === "readonly" ? setReadonly($target, value)
                                : setDisabled($target, value);
  }

  function setReadonly($target, readonly) {
    $target.readonly(readonly);
  }

  function setDisabled($target, disabled) {
    var type = "disabled";
    disabled ? $target.attr(type, type).closest('div.field').addClass(type)
             : $target.removeAttr(type).closest('div.field').removeClass(type);
  }

  function TogglePropertyAction_init(listener, $watchTarget) {
    var $context = listener.$context
      , event = listener.event.split('|')[0].split(/\s/)
      , node = event.length === 3 ? event[1] : event[0];
    this.toggle($(node, $context), $context);
  }

  Listener.register('ToggleProperty', TogglePropertyAction);
  return TogglePropertyAction;
});