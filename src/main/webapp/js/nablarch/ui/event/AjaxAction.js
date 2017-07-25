define(['jquery', './Listener', 'sugar'],
function($, Listener) { "use strict";
  /**
   * Ajaxリクエスト送信アクション
   * =============================================
   * Ajaxリクエストを送信するイベントアクション。
   *
   * Nablarch本体の機構(ウィンドウスコープ/Nablarch サブミット等)
   * と連動し、<n:button>、<n:subimitLink> を使用した場合と同じPOSTリクエストを
   * 送信することができる。
   * また、<n:param> を用いたリクエストパラメータの付与も可能となっている。
   *
   * @class nablarch.ui.event.AjaxAction
   * @author Iwauo Tajima
   * @since 1.4
   */
  AjaxAction.prototype = {
    /**
     * コンストラクタ。
     * @constructor
     * @param {Object} opts このアクションに設定するプロパティ。
     *   **name:**           サブミット名(必須指定)
     *   **uri:**            送信対象URI(必須指定)
     *   **target:**         レスポンスされたページ内で取得対象とするノードを指定するセレクタ式。
     *   **condition:**      リクエスト送信を実行する際に満たすべき条件を表すセレクタ式。
     *   **paramNameAlias:** リクエストを送信する際に、リクエストパラメータの置換を行うルールを定義する。
     *                       置換ルールの書式は以下のとおり。
     *
     *      【置換対象文字列1】/【置換後文字列1】|【置換対象文字列2】/【置換後文字列2】| ..
     */
    constructor: AjaxAction
    /**
     * サブミット名(必須指定)
     * @property name
     * @type String
     */
  , name: null
    /**
     * 検索対象URI(必須指定)
     * @property uri
     * @type String
     */
  , uri: null
    /**
     * レスポンスされたページ内で取得対象とするノードを指定するセレクタ式。
     */
  , target: null
    /**
     * リクエスト送信を実行する際に満たすべき条件を表すセレクタ式。
     * @property condtion
     * @type String
     */
  , condition: null
    /**
     * リクエストを送信する際に、リクエストパラメータの置換を行うルールを定義する。
     * 置換ルールの書式は以下のとおり。
     *
     *    【置換対象文字列1】/【置換後文字列1】|【置換対象文字列2】/【置換後文字列2】| ..
     *
     * 共通画面への遷移を行う場合に、ウィンドウプレフィックスの置き換えを行う場合など
     * に使用する。
     *
     * @property paramNameAlias
     * @type String
     */
  , paramNameAlias: null
    /**
     * このアクションがリスナからコールバックされた場合に実行する処理。
     * プロパティの設定内容に従って、XHRリクエストを送信する。
     * @method fire
     * @param {nablarch.ui.event.Listener} このアクションを呼び出したリスナ
     * @param {jQuery.Event} リスナが捕捉したイベントオブジェクト
     */
  , fire: AjaxAction_sendRequest
    /**
     * 初期化処理後にリスナからコールバックされた場合に実行する処理。
     * fireコールバックと同等のXHRリクエストを送信する。
     * @method fire
     * @param {nablarch.ui.event.Listener} このアクションを呼び出したリスナ
     * @param {jQuery.Event} リスナが捕捉したイベントオブジェクト
     */
  , init: AjaxAction_sendRequest
  };

  function AjaxAction(opts) {
    this.constructor = AjaxAction;
    Object.merge(this, opts);
    // IE8,9 XHR.open bug if url has double byte.
    this.uri = this.uri.escapeURL();
  }

  function AjaxAction_sendRequest(listener, event) {
    if (this.condition && !listener.$watchTarget.find(this.condition).length) {
      return;
    }
    var target      = this.target
      , $form       = listener.$context.closest('form')
      , $submitName = $form
                     .find('input[name="nablarch_submit"]')
                     .val(this.name) //サブミット名を設定する(nablarch本体との連動に必要)
      , queryString = $form.serialize()
      , nameAlias   = this.paramNameAlias;

    if (nameAlias) {
      nameAlias.split('|').each(function(replace) {
        var pattern = replace.split('/');
        queryString = queryString.replace(/(^|&)([^=]+)=(.*?)(?=(&|$))/g,
          function(org, head, name, value) {
            var replaced = name.replace(pattern[0], pattern[1]);
            if (replaced === name) {
              return org;
            }
            return [
              head, name,     '=', value
            , '&',  replaced, '=', value
            ].join('');
          }
        );
      });
    }

    $.ajax({
      type     : 'POST'
    , url      : this.uri
    , dataType : 'html'
    , data     : queryString
    , complete : function(xhr) {
        var html      = xhr.responseText
          , eventName = (xhr.status <= 400)
                      ? 'ajaxSuccess'
                      : 'ajaxError';
        listener.$context.trigger(eventName, [$(html).find(target)][0]);
      }
    });
  }
  Listener.register('Ajax', AjaxAction);
  return AjaxAction;
});
