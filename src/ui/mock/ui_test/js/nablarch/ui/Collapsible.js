define([
  "jquery"    // jQueryライブラリ
, "./Widget"  // Widget基底クラス
, "sugar"     // sugar.js ライブラリ
],
function($, Widget) { "use strict";
  /**
   * 開閉可能領域
   * ============================================
   * このウィジェットは、画面の特定の領域を開閉操作可能とするものである。
   * 例えば、メニューのサブ階層や、詳細情報などのように、必要に応じて表示・非表示を
   * 切り替えたい要素に対して適用する。
   *
   * マークアップ仕様
   * ------------------------
   * 開閉を制御させたい要素にマーカCSSクラス **nablarch_Collapsible** を指定し、
   * その **-content** オプションに開閉対象となる要素を指し示すセレクタ式を指定する。
   *
   * マーカCSSを適用した要素の先頭には、アイコンが挿入される。
   * それをクリックすることで、内容の表示・非表示要素を切り替えることができる。
   *
   * また、要素の開閉状態はフォーム要素に自動的に保持される。
   * NAFのウィンドウスコープと連動させることにより、画面間の遷移において、
   * 各要素の開閉状態を自動的に保持することができる。
   * (開閉状態を保持するフォーム要素のname属性、value属性をそれぞれ **-name** オプション、
   * **-value** オプションに指定する。)
   *
   *     <h2 class="nablarch_Collapsible
   *                -content #userInfoBlock
   *                -name    formdata.blockOpenStatus
   *                -value   userInfoBlock">
   *       会員情報
   *     </h2>
   *     <div id="userInfoBlock">
   *     ...
   *     </div>
   *     <h2 class="nablarch_Collapsible
   *               -content div.purchaseHistory
   *               -name    formdata.blockOpenStatus
   *               -value   purchaseHistory
   *               -closed">
   *       購入履歴
   *     </h2>
   *     <div id="purchaseHistory1" class="purchaseHistory">
   *     ...
   *     </div>
   *     <div id="purchaseHistory2" class="purchaseHistory">
   *     ...
   *     </div>
   *
   *
   * 以下は、このウィジェットのオプションの一覧である。
   *
   * **-content (セレクタ式):**
   *   開閉対象要素を指定するセレクタ式(必須）
   *
   * **-name (属性値):**
   *   画面内の開閉領域の状態を保持するフォーム要素のname属性(必須)
   *
   *   基本的に任意の文字列で構わないが
   *   開閉状態を画面遷移間で保持するには適切なウィンドウスコーププレフィックスから
   *   開始させる必要がある。
   *
   *   開閉状態を画面間で引き継ぐ場合には、開閉状態のステータスを連携するための
   *   hiddenタグ(n:plainHidden)を該当のformに追加すること。
   *   hiddenタグのname属性には、本属性値( **-name属性値** )に設定した値を指定する。
   *   ※開閉要素が複数あった場合でも、 **-name属性値** は全て同一値とし、
   *   hiddenタグは1つのみ用意すれば良い。
   *
   *     <n:form windowScopePrefixes="formdata">
   *       <%-- 画面間で開閉状態を引き継ぐために必要となるhiddenタグ --%>
   *       <n:plainHidden name="formdata.blockOpenStatus" />
   *       <%-- 開閉機能要素１ --%>
   *       <%-- 開閉機能要素２ --%>
   *     </n:form>
   *
   * **-value (属性値):**
   *   領域の開閉状態を保持するフォーム要素のvalue属性(必須)
   *
   *   開閉対象を一意に特定する文字列を指定する。(ID属性など)
   *
   * **-open:** / **-closed:**
   *   この領域の初期開閉状態を指定する。
   *   **-open**, **-closed** のいずれも指定しなかった場合は開いた状態で表示される。
   *   なお、このクラスは現在の開閉状態に応じて自動的に追加、更新される。
   *
   * @class nablarch.ui.Collapsible
   *
   * @author Iwauo Tajima
   * @since  1.2
   */
  Collapsible.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     *
     * @method Collapsible
     * @constructor
     * @param {HTMLElement} element 展開ボタンのDOM要素
     * @param {Object} [opts] 以下のオプションを保持するオブジェクト
     *    **closed:** (`Boolean`) 初期表示時に閉じている
     *    **content:** (`jQuery|String`) 展開対象要素のjQuery結果セットもしくはセレクタ式
     *    **name:**    (`String`) 領域の開閉状態を保持するフォーム要素のname属性
     *    **value:**   (`String`) 領域の開閉状態を保持するフォーム要素のvalue属性
     *
     * @return {Collapsible} インスタンス
     */
    constructor: Collapsible
    /**
     * 開閉ステータスを保持するinput要素のname属性値
     * @property name
     * @type String
     */
  , name: null
    /**
     * 開閉ステータスを保持するinput要素のvalue属性値
     * @property name
     * @type String
     */
  , value: null
    /**
     * 初期開閉状態
     * @property initClosed
     * @type String
     */
  , initClosed : null
    /**
     * 開閉対象の要素
     * @property $content
     * @type jQuery
     */
  , $content: null
    /**
     * フォーム要素上に保持されたステータスに合わせて開閉状態を変更する。
     *
     * 具体的には以下の2つの処理を行う。
     *
     * 1. 開閉ボタン (マーカCSS nablarch_Collapsible を指定した要素) のCSSを切り替える。
     *
     * 2. 各開閉対象要素 ($content内の各要素) に対して以下の処理を行う。
     *
     *    a.  各要素の data-nablarch_Collapsible_closeRequstsKey 属性を取得する。
     *        当該属性がnullであれば空のオブジェクトを設定する。
     *
     *    b1. 対象を閉じる場合は、a.で取得したオブジェクトに対して
     *        -valueオプション値のキーを登録する。
     *
     *    b2. 対象を開く場合は、a.で取得したオブジェクトに対して
     *        -valueオプション値のキーを削除する。
     *
     *    c.  この処理の結果、a.で取得したオブジェクト上にキーが1つも存在しなければ
     *        この要素を表示し、そうでなければ非表示とする。
     *
     * なお、上記のような仕様としているのは、以下の理由による。
     *
     * >  `Collapsible` が入れ子になっている場合は、開閉対象要素が複数の `Collapsible` から
     * >  開閉の指示を受ける。
     * >  このとき、開閉対象要素は、1つでも閉じるように指示している `Collapsible` が
     * >  存在していれば閉じる必要がある。
     *
     * @method render
     * @chainable
     */
  , render: Collapsible_render
    /**
     * 現在の開閉状態を反転させる。
     * @method toggle
     * @chainable
     */
  , toggle: Collapsible_toggle
    /**
     * 対象領域を開く。
     * すでに開いている場合はなにもしない。
     * @method open
     */
  , open: Collapsible_open
    /**
     * 対象領域を閉じる。
     * すでに閉じている場合はなにもしない。
     * @method close
     */
  , close: Collapsible_close
    /**
     * フォーム要素上に保持されたステータスをもとに現在の開閉状態を返す。
     * @method isClosed
     * @return {Boolean} 現在のステータスが閉じている場合はtrue
     *                    そうでなければfalse
     */
  , isClosed: Collapsible_isClosed
    /**
     * 現在の開閉状態が初期状態から反転したことを表す情報をフォームに追加する。
     * すでに当該の要素が存在していた場合は何もしない。
     * @methosd changeState
     */
  , changeState : Collapsible_changeState
    /**
     * 現在の開閉状態が初期状態に戻ったことをフォームに記録する。
     * (=現在の開閉状態が初期状態から反転したことを表すフォーム要素を削除する。)
     * @method revertState
     */
  , revertState : Collapsible_revertState // 開閉状態を初期状態に戻す
    /**
     * 現在の開閉状態を保持するフォーム要素を取得する。
     * @method $state
     * @return {jQuery} 現在の開閉状態を保持するフォーム要素
     */
  , $state      : Collapsible_$state      // 開閉状態を保持するフォーム要素を返す
    /**
     * 開閉する要素にアイコンが存在するかどうか。
     * @property hasIcon
     * @type Boolean
     */
  , hasIcon : false
  });

  /**
   * イベント定義
   *
   *     Collapsible.event = {
   *       "click" : "toggle"
   *     };
   *
   * @property event
   * @type Object
   * @static
   * @final
   */
  Collapsible.event = {
    "click" : "toggle"
  };

  /**
   * ウィジェット識別子
   * @property widgetType
   * @type String
   * @static
   * @final
   * @default "nablarch_Collapsible"
   */
  Collapsible.widgetType = "nablarch_Collapsible";

  /**
   * 開閉対象要素の状態を保持するdata属性のキー名(定数)
   *
   * @property closeRequstsKey
   * @type String
   * @static
   * @final
   * @default Collapsible.widgetType + "_closeRequstsKey"
   */
  Collapsible.closeRequstsKey = Collapsible.widgetType + "_closeRequstsKey";

  Widget.register(Collapsible);

  // グローバルエラーが存在する場合、表示する領域のセレクタ
  var grobalErrorOpenArea = "#content";

  function Collapsible(element, opt) {
    var hasError = $(element).closest('form').find(".nablarch_error").length != 0
      , needsOpen = hasError || $(".nablarch_errors").length != 0 && $(element).closest(grobalErrorOpenArea).length != 0;

    this.name       = opt.name;
    this.value      = opt.value;
    this.initClosed = Object.has(opt, "closed");
    this.hasIcon    = Object.has(opt, "icon");
    this.$content   = $(opt.content);

    this.constructor = Collapsible;
    Widget.call(this, element);

    if (needsOpen) {
      // 画面内にエラー表示領域を占めるclass属性がある場合は、
      // 強制的に開閉状態を開に変更する。
      this.initClosed ? this.changeState()
                      : this.revertState();
    }
    this.render(false);
  }

  function Collapsible_render(isToggle) {
    var closed = this.isClosed()  // フォーム要素に保持された開閉状態を取得する
      , value  = this.value
      , key    = Collapsible.closeRequstsKey
      , size   = this.$content.size();

    // 開閉ボタンの表示を変更する。
    if (!this.hasIcon) {
      this.$node.find(".Collapsible_icon").remove();
      closed ? this.$node.removeClass("-open open").addClass("-closed closed")
                   .prepend('<span class="Collapsible_icon"><i class="fa fa-chevron-right"></i></span>')
             : this.$node.removeClass("-closed closed").addClass("-open open")
                   .prepend('<span class="Collapsible_icon"><i class="fa fa-chevron-down"></i></span>');
    }

    // 各開閉対象要素のステータスを更新する。
    this.$content.each(function() {
      var $contentItem  = $(this)
        , closeRequests = $contentItem.data(key); // この要素を閉じようとしている
                                                  // Collapsibleの一覧

      if (!closeRequests) {
        closeRequests = {};
        $contentItem.data(key, closeRequests);
      }
      // この要素を閉じようとしている場合は-valueオプションの値をキーに追加
      // 開こうとしている場合はそのキーを削除する。
      closed ? closeRequests[value] = true
             : delete closeRequests[value];

      // この要素を閉じようとしているCollapsibleが1つも無ければ開く。
      // そうでなければ閉じる。
      Object.isEmpty(closeRequests) ? show($contentItem, isToggle, size)
                                    : hide($contentItem);
    });
  }

  function show($contentItem, isToggle, size) {
    var overflow = $contentItem.css('overflow') || 'visible'
      , restoreOverflow = function() {
        $(this).css('overflow', overflow);
      };
    // toggleから呼び出された場合にはアニメーションを使用して表示する
    if (isToggle) {
      $contentItem.is('tr') ? slideRowIn($contentItem, size)
                            : $contentItem.animate({height: "show"}, {duration: 300, complete: restoreOverflow});
    } else {
      $contentItem.show();
    }
  }

  function slideRowIn($row, rowSize) {
    if (rowSize >= 30) { // 30件程度だと アニメーションの視覚効果が得られない & 遅いので アニメーションは利用しない。
      $row.show();
    } else {
      $row.show()
          .find('td')
          .wrapInner('<div style="display:none" />')
          .parent()
          .find('td > div')
          .slideDown(200, function() {
             $(this).replaceWith($(this).contents());
          });
    }
  }

  function hide($contentItem) {
    $contentItem.hide();
  }

  function Collapsible_isClosed() {
    return this.initClosed ? this.$state().length === 0
                           : this.$state().length > 0;
  }

  function Collapsible_toggle(event) {
    return this.isClosed() ? this.open(event)
                           : this.close(event);
  }

  function Collapsible_open(event) {
    this.initClosed ? this.changeState()
                    : this.revertState();
    this.render(true);
    event.preventDefault();
  }

  function Collapsible_close(event) {
    this.initClosed ? this.revertState()
                    : this.changeState();
    this.render(true);
    event.preventDefault();
  }

  function Collapsible_changeState() {
    if (this.$state().length == 0) {
      $("<input>", {
        type  : "hidden"
      , name  : this.name
      , value : this.value
      }).appendTo("form");
    }
  }

  function Collapsible_revertState() {
    this.$state().remove();
  }

  function Collapsible_$state() {
    return $("input").filter("[name='"  + this.name  + "']"
                           + "[value='" + this.value + "']");
  }

  return Collapsible;
});
