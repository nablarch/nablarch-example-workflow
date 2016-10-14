define(['jquery', '../Widget', 'sugar'],
function($, Widget) { "use strict";
  /**
   * 親要素内イベント連携機能
   * =============================================
   * 親要素内で発生した任意のイベントを監視するイベントリスナー。
   *
   * @class nablarch.ui.event.Listener
   * @author Iwauo Tajima
   * @since  1.4
   */
  Listener.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ。
     * @constructor
     * @param {HTMLElement} element このウィジェットが付随するDOMノード。
     * @param {Object} opts このウィジェットに設定するプロパティ。
     *   **content:** 監視対象要素を指定するセレクタ(省略時はこのウィジェットが付随するDOMノードの親要素)
     *   **event:** 監視対象要素上のイベント定義式
     */
    constructor: Listener
    /**
     * 監視対象ノードを指定するセレクタ式。
     * 省略時はこのイベントの親ノード($context)が監視対象となる。
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
     * 監視対象イベントが発火した場合に実行する処理。
     * @property actions
     * @type Array
     */
  , actions: null
    /**
     * このイベント定義の親ノード。
     * @property $context
     * @type jQuery
     */
  , $context: null
    /**
     * 監視対象イベントが発火した場合に実行する処理を登録する。
     * @method registerAction
     */
  , registerAction: Listener_registerAction
    /**
     * このハンドラに登録した処理を実行する。
     * @method fire
     */
  , fire: Listener_fire
    /**
     * このリスナーが初期化された際に実行され、
     * 登録された各アクションがinitメソッドを実装していれば
     * それを呼び出す。
     * この際、initメソッドの第一引数としてこのリスナーオブジェクト自体を渡す。
     * @method init
     */
  , init: Listener_init
    /**
     * 即時で実行される初期イベントを登録する。
     * @property initEvents
     * @type Array
     */
  , initEvents: []
  });

  /**
   * UI部品の識別名。
   * @property widgetType
   * @type String
   * @static
   * @final
   */
  Listener.widgetType = 'nablarch_event_Listener';

  /**
   * マーカCSSのセレクタ
   * @property selector
   * @type String
   * @static
   * @final
   */
  Listener.selector = '.nablarch_event_Listener:not(.-type)';

  /**
   * このリスナーが発火した際に呼び出すアクション。
   * @property actionTypeOf
   * @type Object
   * @static
   * @final
   */
  Listener.actionTypeOf = Object.create(null);

  /**
   * このリスナーが発火した際に呼び出すアクションを登録する。
   * @param type String アクションの識別子
   * @param constructor アクションのコンストラクタ関数
   * @static
   */
  Listener.register = function(type, constructor) {
    Listener.actionTypeOf[type] = constructor;
  };

  // コンストラクタ
  function Listener(element, opts) {
    this.constructor = Listener;
    Object.merge(this, opts);
    this.$context = $(element).parent();
    this.$watchTarget = !!this.watchTarget
                      ? this.$context.find(this.watchTarget)
                      : this.$context;
    Widget.call(this, element);
    doBindEvent(this);
    this.registerAction();
    this.init();
  }

  function doBindEvent(listener) {
    listener.event.split('|').each(function(event) {
      listener.bindEvent('$watchTarget ' + event, 'fire');
    });
  }

  // このリスナに登録されているアクションを順次実行する。
  function Listener_fire(event, target)  {
    var self = this;
    if (target) {
      event.delegateTarget = target;
    }
    this.actions.each(function(action, i) {
      return action.fire.apply(action, [self, event, self.actions.from(i+1)]);
    });
    return this;
  }

  // アクションを登録する。
  function Listener_registerAction() {
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

  // リスナー初期化後に各アクションを初期化する。
  function Listener_init() {
    var $context = this.$context
      , listener = this;
    this.actions.each(function(action){
      if(Object.isFunction(action.init)) {
        action.init(listener, null);
      }
    });
  }

  Widget.register(Listener);
  return Listener;
});
