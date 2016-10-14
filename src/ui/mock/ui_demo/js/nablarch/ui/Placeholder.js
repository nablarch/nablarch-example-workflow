/**
 * IEなどのネイティブでplaceholder属性をサポートしていないブラウザでプレースホルダを表示するUI部品。
 *
 * ネイティブでplaceholder属性をサポートしているブラウザの場合は何も処理しない。
 *
 * @author Kiyohito Itoh
 * @since  1.2
 */
define(["jquery"
      , "nablarch/ui/Widget"
      , "nablarch/ui/event"
      , "sugar"],
function($, Widget) { "use strict";

  // placeholder属性をサポートしているブラウザの場合はすぐにリターン。
  if ("placeholder" in document.createElement("input")) {
    return {};
  }

  /**
   * モジュール定義。
   *
   * 入力値の取得と設定でプレースホルダに対応するため、jQueryの$.val()をオーバーライドする。
   *
   * $.val()
   *   プレースホルダが表示されている場合は、空文字を返す。
   *   プレースホルダが表示されていない場合は、jQueryの$.val()を呼び出す。
   *
   * $.val(value)
   *   プレースホルダが表示されている場合、プレースホルダ用のCSSクラスを削除し、
   *   jQueryの$.val(value)を呼び出す。
   *   プレースホルダが表示されていない場合は、jQueryの$.val(value)を呼び出す。
   */
  function define() {
    
    $.fn.originalVal = $.fn.val;
    $.fn.val = function Placeholder_jQuery_val(value) {

      var $this = $(this)
        , placeholder = $this.attr("placeholder")
        , originalValResult = value !== undefined ? $this.originalVal(value) : $this.originalVal();

      if (!placeholder) {
        // placeholder属性が設定されていない場合
        return originalValResult;
      }

      if (value !== undefined) {
        // $.val(value)呼び出しの場合
        $this.removeClass(Placeholder.className);
        if (value === "") {
          // 設定された値が空文字列の場合には、placeholder属性の値をvalue属性に設定し、
          // Placeholder用クラス属性を追加する。
          $this.originalVal(placeholder).addClass(Placeholder.className);
        }
        return originalValResult;
      } else {
        return $this.hasClass(Placeholder.className) && placeholder === originalValResult ? "" : originalValResult;
      }
    };

    return Placeholder;
  }

  Placeholder.prototype = Object.merge(new Widget(), {
    show: Placeholder_show
  , hide: Placeholder_hide
  });

  Placeholder.event = {
    "$node focusin" : "hide"
  , "$node focusout" : "show"
  , "document beforeSubmit" : "hide"
  , "document afterSubmit" : "show"
  };
  
  Placeholder.widgetType = "nablarch_Placeholder";
  
  /** プレースホルダ用のCSSクラス名 */
  Placeholder.className = "nablarch_placeholder";

  Placeholder.selector = ":text[placeholder],textarea[placeholder]";
  
  Widget.register(Placeholder);
  
  /**
   * コンストラクタ。
   * @param element placeholder属性が指定されたDOMノード
   * @param option オプション(未使用)
   * @returns {Placeholder}
   */
  function Placeholder(element, option) {
    this.constructor = Placeholder;
    Widget.call(this, element);
    this.show();
  }

  /**
   * プレースホルダを表示する。
   *
   * 対象ノードのplaceholder属性の値が空でなく、入力値が空の場合のみプレースホルダを表示する。
   * プレースホルダ表示時にはプレースホルダ用のCSSクラスを追加する。
   *
   * @param event {jQuery.Event} イベント
   */
  function Placeholder_show(event) {
    var placeholder = this.$node.attr("placeholder");
    if (placeholder && !this.$node.val()) {
      this.$node.originalVal(placeholder).addClass(Placeholder.className);
    }
  }

  /**
   * プレースホルダを消去する。
   *
   * 対象ノードのplaceholder属性の値が空でなく、プレースホルダ用のCSSクラスが指定されている場合のみ
   * プレースホルダを消去する。
   * プレースホルダ消去時にはプレースホルダ用のCSSクラスを削除する。
   *
   * @param event {jQuery.Event} イベント
   */
  function Placeholder_hide(event) {
    var placeholder = this.$node.attr("placeholder");
    if (placeholder && this.$node.is("." + Placeholder.className)) {
      this.$node.originalVal("").removeClass(Placeholder.className);
    }
  }

  return define();
});
