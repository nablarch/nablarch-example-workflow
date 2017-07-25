define(['jquery', './Listener', '../Widget', 'sugar'],
function($, Listener, Widget) { "use strict";
  /**
   * サブウィンドウ内イベント連携機能
   * =============================================
   * サブウィンドウ内で発生した任意のイベントを監視するイベントリスナー。
   *
   * @class nablarch.ui.event.SubWindowListener
   *
   * @author Iwauo Tajima
   * @since  1.4
   */
  SubWindowListener.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ。
     * @constructor
     * @param {HTMLElement} element このウィジェットが付随するDOMノード。
     * @param {Object} opts このウィジェットに設定するプロパティ。
     *   **windowName:** 監視対象ウィンドウ名
     *   **openTrigger:** 監視対象となるウィンドウを開いた要素を指定するセレクタ
     *   **watchTarget:** 監視対象要素を指定するセレクタ(必須)
     *   **event:** 監視対象要素上のイベント定義
     */
    constructor: SubWindowListener
    /**
     * 監視対象ノードを指定するセレクタ式。
     * (必須指定)
     * @property target
     * @type String
     */
  , watchTarget: null
    /**
     * 監視対象ノード上のイベントを定義する文字列。
     * @property event
     * @type String
     */
  , event: null
    /**
     * 監視対象となるウィンドウを開いた要素を指定するセレクタ式。
     * この属性を設定することで、当該要素から開かれたウィンドウのみが監視対象となる。
     * @property openTrigger
     * @type String
     */
  , openTrigger: null
    /**
     * 対象とするサブウィンドウ名。
     * 省略時は 'subwindow'
     * @property windowName
     * @type String
     */
  , windowName: null
    /**
     * 監視対象イベントが発火した場合に実行する処理。
     * @property actions
     * @type Array
     */
  , actions: null
    /**
     * このイベント定義が記述されているノード。
     * @property $context
     * @type jQuery
     */
  , $context: null
    /**
     * 監視対象イベントが発火した場合に実行する処理を登録する。
     * @method registerAction
     */
  , registerAction: SubWindowListener_registerAction
    /**
     * このハンドラに登録した処理を実行する。
     * @method fire
     */
  , bind: SubWindowListener_bind
  });

  /**
   * UI部品の識別名。
   * @property widgetType
   * @type String
   * @static
   * @final
   */
  SubWindowListener.widgetType = 'nablarch_event_SubWindowListener';

  /**
   * セレクタ
   * @property selector
   * @type String
   * @static
   * @final
   */
  SubWindowListener.selector = '.nablarch_event_Listener.SubWindow';

  /**
   * この画面から開かれたサブウィンドウを管理する。
   * @method manageSubWindows
   * @static
   */
  SubWindowListener.manageSubWindows = SubWindowListener_manageSubWindows;
  var managedWindows = Object.create(null);

  /**
   * サブウィンドウ上にイベントリスナーを登録する。
   * @method bindToSubWindow
   * @global
   */
  window.nablarch_bindToSubWindow = SubWindowListener_bindToSubWindow;

  $(function() {
    var opener = window.opener;
    if (opener) {
      opener.nablarch_bindToSubWindow(window);
    }
    $(document).on('afterSubmit', SubWindowListener.manageSubWindows);
  });

  function SubWindowListener_bindToSubWindow(subwindow) {
    var $widgets = $(SubWindowListener.selector).widgets(SubWindowListener)
      , name = subwindow.name
      , $openTrigger = managedWindows[name].$openTrigger;
    $widgets.each(function() { this.bind(subwindow, $openTrigger); });
  }

  function SubWindowListener_manageSubWindows(event) {
    var $openTrigger = $(event.target);
    Object.each(nablarch_opened_windows, function(name, w) {
      if (managedWindows[name] && (w === managedWindows[name])) {
        return;
      }
      managedWindows[name] = {window: w, $openTrigger: $openTrigger};
    });
  }

  // コンストラクタ
  function SubWindowListener(element, opts) {
    this.constructor = SubWindowListener;
    Object.merge(this, opts);
    this.windowName = opts.windowName || 'subwindow';
    this.actions    = [];
    Widget.call(this, element);
    this.$context = $(element).parent();
    this.registerAction();
  }

  // イベント発火時の処理
  function SubWindowListener_bind(subwindow, $openTrigger) {
    if (this.openTrigger && !$openTrigger.is(this.openTrigger)) {
      return this; // サブウィンドウが監視対象のボタンから開かれたものではない場合
    }
    var event       = this.event.split(/\s+/)
      , context     = event[0]
      , eventName   = event[1]
      , actions     = this.actions
      , $context    = this.$context
      , listener    = this;

    $(subwindow.document)
    .find(this.watchTarget)
    .on(eventName, context, function(event) {
      actions.each(function(action) {
        action.fire(listener, event);
      });
    });
    return this;
  }

  // アクションを登録する。
  function SubWindowListener_registerAction() {
    var actions  = this.actions = [];
    this.$node
    .find('.nablarch_event_Action')
    .each(function() {
      var opts       = $(this).widgetOption('nablarch_event_Action')
        , actionType = Listener.actionTypeOf[opts.type];
      actions.push(new actionType(opts));
    });
    return this;
  }

  Widget.register(SubWindowListener);
  return SubWindowListener;
});
