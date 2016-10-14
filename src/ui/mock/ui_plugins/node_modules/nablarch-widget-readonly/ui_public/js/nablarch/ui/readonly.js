/**
 * 入力要素に対する変更を不可(readonly)にする機能。
 * 
 * 入力要素に対してマーカCSS **nablarch_readonly** を適用することで
 * 対象の要素に以下の効果を与える。
 * 
 *   1. 入力項目に対する変更を抑制する。
 *   2. サブミット時に送信対象となる。
 *   3. 変更不可であることを表すために背景色を灰色(disabledと同じ表示)に変更する。 
 *   
 * 以下の例では、チェックボックスの変更を抑止している。
 *   
 * <pre>
 * <input class="nablarch_readonly" type="radio" name="option" value="economy" checked/> 
 * <input class="nablarch_readonly" type="radio" name="option" value="business"/>  
 * <input class="nablarch_readonly" type="radio" name="option" value="first" />
 * </pre>
 * 
 * **DOMのreadonly属性との相違点**
 *   もともと、DOMのreadonly属性は、入力要素のvalue属性値の変更を抑制するものなので、
 *   selectタグやcheckboxの選択状態(selected/checked)の変更を抑止することはできない。
 *   一方、 **nablarch_readonly** では、選択状態の変更についても入力値と同様に
 *   抑制することが可能となっている。
 *   
 * @author Iwauo Tajima
 * @since  1.2
 */
define([
  "jquery"             // jQueryライブラリ
, "nablarch/ui/event"  // beforeSubmit/afterSubmitイベント定義
, "sugar"              // sugarjsライブラリ
],
function($) {
  var markerCss = "nablarch_readonly";


  /**
   * モジュール定義
   */
  function define() {
    $.fn.readonly = jQuery_readonly;    
    $(function() {
      $target().readonly();
      $(document)
        .on("beforeSubmit", Readonly_beforeSubmit)
        .on("afterSubmit",  Readonly_afterSubmit);      
    });    
    return {markerCss: markerCss};
  }
  
  /**
   * 対象要素を変更不可にする。
   */
  function jQuery_readonly(readonly) {
    readonly = (arguments.length === 0) ? true
                                        : !!(readonly);    
    return this.each(function() {
      var $this = $(this);
      readonly ? $this.addClass(markerCss)
               : $this.removeClass(markerCss);
      $this.prop("disabled", readonly);      
    });
  }
  
  /**
   * サブミット処理の直前にdisabled属性を解除する。
   */
  function Readonly_beforeSubmit() {
    $target().each(function(){ $(this).prop("disabled", false); });
  }
  
  /**
   * サブミット処理の完了後にdisabled属性をつけ直す。
   * (サブミット後も画面がアンロードしない場合のみ。)
   */
  function Readonly_afterSubmit() {
    $target().each(function(){ $(this).prop("disabled", true); });
  }

  /**
   * 対象要素を取得する。
   */
  function $target() {
    return $("select, input, textarea").filter("." + markerCss);
  }
  
  return define();
});
