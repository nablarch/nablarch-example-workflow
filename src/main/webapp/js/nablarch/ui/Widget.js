/**
 * @module nablarch.ui
 */
define(["jquery"], function($) { "use strict";
  
  /** モジュール定義 */
  function define() {
    $.fn.widget       = jQuery_widget;
    $.fn.widgets      = jQuery_widgets;
    $.fn.widgetOption = jQuery_widgetOption;
    return Widget;
  }
  
  /**
   * jQueryプラグインメソッド。
   * 
   * このプラグインメソッドは、第一引数の型に従い、以下の2つの処理のいずれかを行う。
   *
   * `$.fn.widgets(constructor:Function, ...args)`
   *   wrappedSet上の各要素を引数としてconstructorを実行し、
   *   ウィジェットのインスタンスを初期化する。
   *   第2引数以降は、コンストラクタの引数としてそのまま渡される。
   *   
   *   なお、初期化されたウィジェットインスタンスは、ノードのdata属性に保存され、
   *   同じノードに対して同じウィジェットの初期化処理が複数回行われた場合、
   *   2回目以降の初期化処理は無視される。
   *
   *   
   * `$.fn.widget(command:String, ...args)`
   *   wrappedSet上の各要素上にウィジェットのインスタンスが保持されている場合に、
   *   第1引数で指定されたメソッドを呼び出し、その結果を格納したwrappedSetを返却する。
   *   第2引数以降は、メソッドの引数としてそのまま渡される。
   * 
   * @method widgets
   * @for jQuery
   * @param {Function|String} constructorOrCommand
   *   初期化するウィジェットのコンストラクタまたは、実行するメソッド名。 
   * @param {anything} [args]* 
   *   コンストラクタもしくはメソッドの引数。
   */
  function jQuery_widgets(/* ...args*/) {
    var args = Array.prototype.slice.call(arguments);
    return this.map(function() {
      return jQuery_widget.apply($(this), args);
    });
  }

  /**
   * jQueryプラグインメソッド。
   * 
   * このプラグインメソッドの処理内容は、以下の2点を除き、 `$.fn.widgets()` と同じである。
   * 
   * 1. wrappedSetの先頭要素のみを処理の対象とする。
   * 2. 戻り値として、ウィジェットインスタンス、もしくは、
   *    ウィジェットに対して実行したメソッドの戻り値を返す。
   *    
   * @method widget
   * @for jQuery
   * @param {Function|String} constructorOrCommand
   *   初期化するウィジェットのコンストラクタまたは、実行するメソッド名。 
   * @param {anything} [args]* 
   *   コンストラクタもしくはメソッドの引数。
   */
  function jQuery_widget(arg /*, ...args*/) {
    var node        = this.get(0)
      , $node       = $(node)
      , constructor = Object.isFunction(arg) ? arg : null
      , command     = Object.isString(arg)   ? arg : null
      , type        = constructor && constructor.widgetType
      , widget      = constructor && this.data(type)
      , args        = Array.prototype.slice.call(arguments, 1);

    return constructor ? create()
         : command     ? call()
         : undefined;
   
    function create() {
      var option =  $node.widgetOption(type);
      if (args[0]) {
        Object.merge(option, args[0]);
      }
      return widget || new constructor(node, option);
    }
    
    function call() {
      return (widget && Object.isFunction(widget[command]))
           ? widget[command](args)
           : undefined;
    }
  }
  
  /**
   * jQueryプラグインメソッド 
   * 
   * ノードのclass属性値をパースし、このウィジェットのオプション設定を取得する。
   * 各オプションの値は必ず文字列もしくはnullとなる。
   * 
   * HTML:
   *     <div class="SomeWidget -flg1 -option1 val1 -option2 true -selector 'div li.end'/>
   * 
   * オプション:
   *     {"flg1": null, "option1": "val1", "true", "selector": "div li.end"}
   *   
   * @method widgetOption
   * @for jQuery
   * @param {String} widgetType オプションを取得するウィジェットの識別子
   * @return {Object} class属性値中に指定されたウィジェットのオプション
   */  
  function jQuery_widgetOption(widgetType) {
    var css      = ($(this).prop("class") || "").trim()
      , pattern  = /(?:^|\s+)-([^\-\s]+)(\s+('[^']*'|"[^"]*"|[^\-\s][^\s]*))?/g
      , after    = css.substring(css.indexOf(widgetType))
      , option   = {}
      , match, key, val;
    
    while (match = pattern.exec(after)) {
      key = match[1];
      val = !!(match[2])
          ? match[2].trim().replace(/^['"]/, '').replace(/['"]$/,  '')
          : null;
      option[key] = val;
    }
    return option;    
  }
  
  /**
   *  DOMノードの動作を拡張するUIモジュールの基底クラス。 
   * 
   * @class nablarch.ui.Widget
   * 
   * @author Iwauo Tajima
   * @since  1.2
   */
  Widget.prototype = {
    /**
     * コンストラクタ関数。
     * 
     * ほとんどのウィジェットにおいて必要となる共通的な以下の初期化処理を行う。
     * サブクラスからは以下の形式で呼び出す。
     * 
     *     function SomeWidget(element) {
     *         Widget.call(this, element); // ウィジェット共通初期化処理の呼び出し
     *     }
     * 
     * 1. 生成されたインスタンスを引数のDOMノードのdata属性に登録する。
     * 2. コンストラクタのeventプロパティの内容を元に、イベントハンドラを登録する。
     * 
     * なお、引数を指定しなかった場合は何もせずにインスタンスを返却する。
     * (プロトタイプインスタンスとして使用する場合。)
     *
     * @method Widget
     * @constructor
     * @for nablarch.ui.Widget
     * @param {HTMLElement} element DOMノード
     */      
    constructor: Widget
    /**
     * ウィジェットを構成するHTML要素を保持するjQuery結果セット
     * @property $node
     * @type jQuery
     */
  , $node: null
    /**
     * このウィジェット上で発生する各種イベントに対してイベントハンドラを登録する。
     * 
     * 引数 `eventMap` の各エントリは以下のいずれかの形式で記述する。
     * 
     *   1. "(イベント名)" : (イベントハンドラ)
     *   2. "(セレクタ) (イベント名)" : (イベントハンドラ)
     *   3. "(コンテキストノード) (イベント名)" : (イベントハンドラ)
     *   4. "(コンテキストノード) (セレクタ) (イベント名)" : (イベントハンドラ)
     * 
     * 1.ではこのウィジェット内(this.$node)で発生するイベントを処理する
     * イベントハンドラを登録する。
     *    
     * 2.ではウィジェット内で発生するイベントのうち、イベントの発生元がセレクタに
     * 合致した場合のみイベントハンドリングを行う。(event deligation)
     * なおセレクタがIDセレクタ("#")で開始される場合は、ウィジェット外で発生する
     * イベントも対象となる。
     * 
     * 3.および4.では、(コンテキストノード)に指定したノード内でしたイベントを対象とする。
     * (コンテキストノード)には $で開始されるプロパティ名もしくは "document" を指定する。
     * 
     * (イベントハンドラ) には文字列および関数を使用できる。
     * 文字列の場合は、このウィジェットの同名のメソッドを呼び出す。
     * 関数の場合は、このウィジェットをbind()したものを呼び出す。
     * 
     * @example
     *     this.bindEvent({
     *       "button.addAll    click" : "addAll"
     *     , "button.add       click" : "add"
     *     , "button.removeAll click" : "removeAll"
     *     , "button.remove    click" : "remove"
     *     , "document beforeSubmit"  : "update"  // nablarch_submit によるサブミット前
     *     , "document afterSubmit"   : "render"  // nablarch_submit によるサブミット後
     *     });
     * 
     * @method bindEvent
     * @chainable
     * @param {Object} eventMap このウィジェット内のイベントハンドリングを定義するマップ。
     */  
  , bindEvent: Widget_bindEvent
  };

  Widget.register = function(widget) {
    Widget.widgets.push(widget);
  };

  Widget.widgets = [];
  
  Widget.init = function() {
    var widgets  = Widget.widgets 
      , selector = widgets.map(selectorFor).join(',')
      , $elems   = $(selector);

    widgets.each(function(w) {
      $elems.filter(selectorFor(w)).widgets(w);
    });
    
    function selectorFor(widget) {
      return widget.selector || '.' + widget.widgetType;
    }
  };

  function Widget(element) {
    var clazz = this && this.constructor
      , type  = clazz && clazz.widgetType
      , $node = element && $(element);
    // 引数なしで呼ばれた場合は未初期化オブジェクトを返す。(prototype用)
    if (arguments.length == 0) {
      return this;
    }
    this.$node = $node;
    this.bindEvent(clazz.event);
    this.$node.data(type, this);
  }
  

  function Widget_bindEvent(eventMap) {    
    (arguments.length == 2 && Object.isString(arguments[0]))
      ? bind(arguments[0], arguments[1], this)
      : Object.each(eventMap, bind.fill(undefined, undefined, this));
    return this;
  }
  
  function bind(when, what, self) {
    var selector = ""
      , eventType, handler, $context;
    
    when      = when.split(/\s+/);
    eventType = when.last().trim();
    if (when.length >= 2) {
      $context = when[0].trim();
      if ($context.startsWith("$")) {
        $context = self[$context];
      }
      else if ($context.startsWith("#")) {
        $context = $($context);
      }
      else if ($context == "document") {
        $context = $(document);
      }
      else {
        selector = $context;
        $context = null;
      }
    }
    if (when.length == 3) {
      selector = when[1];
    }
    handler  = Object.isFunction(what) ? what : self[what+''];
    $context = $context || self.$node;
    
    $context.on(eventType, selector || null, handler.bind(self));
  }
    
  return define();
});
