define(['jquery', './Listener', 'sugar'],
function($, Listener) { 'use strict';
  /**
   * 動的変更項目機能
   * =============================================
   * 画面内のchangeイベントやajaxsuccessイベントと連動し、
   * 画面内の要素を動的に書換える処理を行うアクション。
   * 要素の内容の他に、CSSクラスの追加・削除もあわせて行うことができる。
   *
   * マークアップ仕様
   * -------------------------------------------
   *
   *     <form class="nablarch_event_Action
   *                     -type    Write
   *                     -writeTo 'span.price'
   *                     -format  '+{#item} 円'>
   *
   *       <label>オプション選択:</label>
   *       <select class="product">
   *         <option value="0" selected="selected">オプションなし</option>
   *         <option value="1980">メモリ2GB増強</option>
   *         <option value="3800">メモリ2GB増強 + 延長保証3年</option>
   *       </select>
   *       <label>差額:</label>
   *       <span class="price">+0 円</span>
   *     </form>
   *
   * @class nablarch.ui.event.WriteAction
   * @author Iwauo Tajima
   * @since 1.4
   */
  WriteAction.prototype = {
    /**
     * コンストラクタ。
     *
     * @constructor
     * @param {Object} opts このアクションに設定するプロパティ。
     */
    constructor: WriteAction
    /**
     * 出力対象要素を指定するセレクタ式(必須指定)
     *
     * @property writeTo
     * @type String
     */
  , writeTo: null
    /**
     * 出力内容文字列(必須指定)
     * 文字列中の{}で囲まれた文字列はセレクタ式として解釈し、
     * その結果セットの先頭要素のvalue属性値(input/select/textarea要素)もしくは
     * contentText(それ以外の要素)に置換される。
     *
     * @property format
     * @type String
     */
  , format: null
    /**
     * 実行条件セレクタ式
     * このアクションの処理が実行する際の事前条件となるセレクタ式。
     * リスナがイベントを捕捉しても、このセレクタ式が真に評価されない場合は
     * このアクションの実行をキャンセルする。
     *
     * @property condition
     * @type String
     */
  , condition: null
    /**
     * 追加CSSクラス。
     * このアクションが実行された場合に追加するCSSクラス。
     *
     * @property addClass
     * @type String
     */
  , addClass: ''
    /**
     * 除去CSSクラス。
     * このアクションが実行された場合に除去するCSSクラス。
     *
     * @property removeClass
     * @type String
     */
  , removeClass: ''
    /**
     * 出力対象要素のjQuery結果セット
     *
     * @property $writeTo
     * @type jQuery
     */
  , $writeTo: null
    /**
     * このアクションがリスナからコールバックされた場合に実行する処理。
     * 対象要素内容の書換えを行う。
     * @method fire
     * @param {nablarch.ui.event.Listener} このアクションを呼び出したリスナ
     * @param {jQuery.Event} リスナが捕捉したイベントオブジェクト
     */
  , fire: WriteAction_fire
  };

  /**
   * フォーマット式を解釈する。
   * @method interpolate
   * @static
   */
  WriteAction.interpolate = WriteAction_interpolate;

  function WriteAction(opts) {
    this.constructor = WriteAction;
    Object.merge(this, opts);
  }

  function WriteAction_fire(listener, event) {
    var $writeTo = listener.$context.find(this.writeTo)
      , $target  = $(event.delegateTarget)
      , value;
    if (this.condition && !$target.is(this.condition)) {
      return;
    }
    if (this.format) {
      value = WriteAction.interpolate(this.format, $target);
      $writeTo.is('input, select, textarea') ? $writeTo.val(value)
                                             : $writeTo.text(value);
    }
    $writeTo.addClass(this.addClass)
            .removeClass(this.removeClass);
    return this;
  }

  function WriteAction_interpolate(format, $source) {
    var pattern = /\{([^}]+)\}/g;
    return format.replace(pattern, function(_, selector) {
      var $matched = $source.find(selector);
      return ($matched.is('input, select, textarea')
                ? $matched.val()
                : $matched.text()).trim();
    });
  }

  Listener.register('Write', WriteAction);
  return WriteAction;
});
