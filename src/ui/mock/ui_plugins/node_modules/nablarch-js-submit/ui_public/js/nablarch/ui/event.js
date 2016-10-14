/**
 * @module nablarch.ui
 */
define(["jquery", "nablarch/util", 'sugar'],
function($, util) { "use strict";

  function define() {
    $(function() {
      defineNablarchCustomEvents();
    });

    return {
      /**
       * eventて定義したイベント情報とcontextから
       * context, target, eventType を取得する。
       *
       * @param {String} event イベントの情報を定義した文字列
       * @param {Object} context イベントを処理するコンテキスト
       * @returns {Object} 定義情報から生成した結果
       *  **context:** {String|Object} イベント処理をするコンテキスト情報
       *  **target:**  {String|Object} イベントの対象
       *  **eventType:** {String} イベントの種類
       *
       * @method parse
       */
      parse : Event_parse
    };

    function Event_parse(event, context) {
      var params = event.split(/\s+/)
       ,  length = params.length
       ,  target, eventType;

      eventType = params.last();
      target    = length === 1 ? context
                             : params[length - 2];
      context   = !!context ? context : params[0];

      return {
        context   : context
      , target    : target
      , eventType : eventType
      };
    };
  }

  return define();

  /**
   *  nablarch_submit()関数によるsubmit処理が実行される前に発火するグローバルイベント。
   *
   *  通常のDOMイベントにおける `submit` イベントとは異なり、
   *  APIからサブミットを行った場合でもイベントが発生する。
   *  各イベントハンドラにおいて、明示的に `false` をリターンした場合は
   *  後続イベントのバブリングとデフォルトアクションの実行を停止する。
   *
   *   @event beforeSubmit.nablarch
   *   @for nablarch.ui
   *   @param {jQuery.Event} event イベントオブジェクト
   *   @param {String} submitName サブミットボタン/リンクのname属性
   */
  var beforeSubmitEvent = "beforeSubmit";

  /**
   * nablarch_submit()関数によるsubmit処理が実行された後に発火するグローバルイベント。
   *
   * ただし、 `<n:popuplink>`  や、 `<n:downloadlink>` のように、サブミット実行後もウィンドウが
   * リロードされずに残る場合のみ発火する。
   * 各イベントハンドラにおいて、明示的にfalseを返した場合は、後続イベントのバブリングと
   * デフォルトアクションの実行を停止する。
   *
   * @event afterSubmit.nablarch
   * @for nablarch.ui
   * @param {jQuery.Event} event イベントオブジェクト
   * @param {String} submitName サブミットボタン/リンクのname属性
   */
  var afterSubmitEvent = "afterSubmit";

  /**
   * nablarch共通関数にフックをかけることで、nablarch関連イベントの定義を行う。
   */
  function defineNablarchCustomEvents() {
    var global                     = window
      , orgNablarchSubmit          = global.nablarch_submit
      , orgNablarchSubmitToNewForm = global.nablarch_submitToNewForm
      , orgNablarchSubmitOnWindow  = global.nablarch_submitOnWindow
      , submitEventTrigger         = null;

    if (typeof orgNablarchSubmit !== "function") {
      util.error("a global function named nablarch_submit() is not defined.");
    }
    global.nablarch_submit = nablarchSubmitOverride;

    if (typeof orgNablarchSubmitToNewForm !== "function") {
      util.error("a global function named nablarch_submitToNewForm() is not defined.");
    }
    global.nablarch_submitToNewForm = nablarchSubmitToNewFormOverride;

    if (typeof orgNablarchSubmitOnWindow !== "function") {
      util.error("a global function named nablarch_submitOnWindow() is not defined.");
    }
    global.nablarch_submitOnWindow = nablarchSubmitOnWindowOverride;

    /**
     * nablarch_submit()関数をオーバーライドする関数。
     *
     * JSPによって出力される nablarch_submit() 関数はonclick属性に設定され、
     * その中でサブミット処理を実行するため、後からclickイベントにバインドすることができない。
     * そのため、この関数では、onclickハンドラ内で直接サブミットを行うことはせず、
     * body要素までバブリングしてきたイベントを捕捉してサブミットするようにしている。
     *
     * @param  {Event}   event    DOMイベントオブジェクト
     * @param  {Element} element  サブミットが発生したDOM要素
     */
    function nablarchSubmitOverride(event, element) {
      var $body               = $("body")
        , $submitEventTrigger = $(element);

      submitEventTrigger = element;

      $body.off("click.nablarch_submit")
           .one("click.nablarch_submit"
              , '[name="' + $submitEventTrigger.prop("name") + '"]'
              , function() { return orgNablarchSubmit(event, element); }
            );
    }

    /**
     * nablarch_submitToNewForm() 関数をオーバーライドする関数。
     *
     * 本関数は、<n:download>/<n:popuplink>等、サブミット後も当該のウィンドウが画面上に
     * そのまま残る場合に呼ばれ、サブミット処理を行う前後で、グローバルイベント
     * beforeSubmit.nablarch/afterSubmit.nablarch をそれぞれ発火する。
     */
    function nablarchSubmitToNewFormOverride(submitName, form, submissionData) {
      var beforeEvent = $.Event("beforeSubmit", { target: submitEventTrigger })
        , afterEvent  = $.Event("afterSubmit",  { target: submitEventTrigger });

      $.event.trigger(beforeEvent, [submitName, form, submissionData]);
      // 途中のイベントハンドラでデフォルトアクションの実行が抑止されていた場合は、
      // サブミット処理を中断する。
      if (beforeEvent.isDefaultPrevented()) {
          return false;
      }
      orgNablarchSubmitToNewForm(submitName, form, submissionData);
      $.event.trigger(afterEvent, [submitName, form, submissionData]);
    }

    /**
     * nablarch_submitToNewForm() 関数をオーバーライドする関数。
     *
     * 本関数ではサブミット処理を行う前に、グローバルイベント beforeSubmit.nablarch
     * を発火する。
     */
    function nablarchSubmitOnWindowOverride(submitName, form, submissionData) {
      var beforeEvent = $.Event("beforeSubmit", { target: submitEventTrigger });
      $.event.trigger(beforeEvent, [submitName, form, submissionData]);
      // 途中のイベントハンドラでデフォルトアクションの実行が抑止されていた場合は、
      // サブミット処理を中断する。
      if (beforeEvent.isDefaultPrevented()) {
        return false;
      }
      orgNablarchSubmitOnWindow(submitName, form, submissionData);
    }
  }
});

