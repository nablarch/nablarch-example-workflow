/**
 * @module nablarch.ui
 */
define(["text!./ListBuilder.template", "jquery", "./Widget", "./readonly","./event", "sugar"],
function(template, $, Widget, readOnly) { "use strict";
  /**
   * リストビルダー
   * ============================================
   * 2つのリストボックス(`<select multiple>`)間での要素移動を可能とするUI部品。
   * 基本的には、一方のリストボックスの要素から、任意個の要素を選択する目的で使用する。
   *
   * リストビルダーは、次の3つの要素によって構成される。
   *
   * 1. 選択元リストボックス
   * 2. 各種ボタンを配置するコントロール部
   * 3. 選択先リストボックス
   *
   * マークアップ仕様
   * ------------------------
   * コントロール部に相当する `<div>` 要素にマーカCSS `nablarch_ListBuilder` を指定する。
   * また、**選択元リストボックス** および **選択先リストボックス** のID属性を、
   * 同じCSSに以下のように指定する。
   *
   *     <div class="nablarch_ListBuilder
   *                 -from (選択元リストボックスのID属性)
   *                 -to   (選択先リストボックスのID属性)">
   *     </div>
   *
   * **実装例 (HTML)**
   * 以下はHTMLの記述例である。
   * コントロール部の内容は、テンプレートファイル(/js/nablarch/ui/ListBuilder.txt) の内容が
   * 出力されるので各画面で記述する必要はない。
   *
   *     <!-- 選択元リスト -->
   *     <select
   *       id       = "permissionUnit_from"
   *       multiple = "true"
   *       size     = "10">
   *     </select>
   *
   *     <!-- コントロール部分 -->
   *     <div class="nablarch_ListBuilder
   *                 -from permissionUnit_from
   *                 -to   permissionUnit_to">
   *     </div>
   *
   *     <!-- 選択先リスト -->
   *     <select
   *       id       = "permissionUnit_to"
   *       multiple = "true"
   *       size     = "10">
   *     </select>
   *
   *
   * **実装例 (JSP)**
   * 以下はJSPの記述例である。
   *
   * リストビルダーの選択状態は、初期ロード時とサブミット処理時に送信元リストボックスに反映されるので、
   * サーバ側から見たリストビルダーの扱いは、通常のリストボックスと全く同じものとなる。
   * このため、JSPを記述する場合は、選択元リストを通常どおり `<n:select>` などを使用して出力し、
   * 選択先リストについては空の `<select>` タグを記述しておけばよい。
   *
   *     <%-- 選択元リスト --%>
   *     <n:select
   *       id       = "permissionUnit_from"
   *       name     = "W11AC02.systemAccount.permissionUnit"
   *       multiple = "true"
   *       size     = "10"
   *       listName = "allPermissionUnit"
   *       elementLabelProperty = "permissionUnitName"
   *       elementValueProperty = "permissionUnitId"
   *       elementLabelPattern  = "$LABEL$"
   *     />
   *     <%-- コントロール部分--%>
   *     <div class="nablarch_ListBuilder
   *                -from permissionUnit_from
   *                -to   permissionUnit_to">
   *     </div>
   *     <%-- 選択先リスト --%>
   *     <select
   *       id       = "permissionUnit_to"
   *       multiple = "true"
   *       size     = "10">
   *     </select>
   *
   * @class nablarch.ui.ListBuilder
   * @author Iwauo Tajima
   * @since 1.2
   */
  ListBuilder.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数
     *
     * @method ListBuilder
     * @constructor
     * @param {HTMLElement} element ListBuilderのコントロール部分のDOMノード
     * @param {Object} opts 下記のオプションを格納したオブジェクト
     *   **from:** (`String`) 選択元リストボックスのID
     *   **to:**   (`String`) 選択先リストボックスのID
     * @return {ListBuilder} インスタンス
     */
    constructor: ListBuilder
    /**
     * 選択先リストボックス
     * @property $toList
     * @type jQuery
     */
  , $toList: null
    /**
     * 選択元リストボックス
     * @property $fromList
     * @type jQuery
     */
  , $fromList: null
    /**
     * 全てのアイテムを選択先リストボックスに移動する。
     * @method addAll
     * @chainable
     */
  , addAll: ListBuilder_moveItem.fill("select",   true)
    /**
     * 選択元リストボックスで選択中のアイテムを選択先リストボックスに移動する。
     * @method add
     * @chainable
     */
  , add: ListBuilder_moveItem.fill("select",   false)
    /**
     * 全てのアイテムを選択元リストボックスに移動する。
     * @method removeAll
     * @chainable
     */
  , removeAll: ListBuilder_moveItem.fill("unselect", true)
    /**
     * 選択先リストボックスで選択中のアイテムを選択元リストボックスに移動する。
     * @method remove
     * @chainable
     */
  , remove: ListBuilder_moveItem.fill("unselect", false)
    /**
     * 選択元リストボックスの選択状態にあわせて、各リストボックス上の要素を移動する。
     * 具体的には、選択元リストボックスのselected要素を選択先リストボックスに移動する。
     * @method render
     * @chainable
     */
  , render: ListBuilder_render
    /**
     * サブミット時に適切な値が送信されるように、
     * 現在のリストビルダーの選択状態を選択元リストに反映する。
     *
     * 具体的には以下の操作を行う。
     * 1. 選択元リスト内の各要素についてselected属性を除去する。
     * 2. 選択先リストの各要素のselected属性の値を設定し、選択元リストに追加する。
     *
     * @method update
     * @chainable
     */
  , update: ListBuilder_update
  });

  /**
   * イベント定義
   *
   *     ListBuilder.event = {
   *       "button.addAll    click" : "addAll"
   *     , "button.add       click" : "add"
   *     , "button.removeAll click" : "removeAll"
   *     , "button.remove    click" : "remove"
   *     , "document beforeSubmit"  : "update"  // nablarch_submit によるサブミット前
   *     , "document afterSubmit"   : "render"  // nablarch_submit によるサブミット後
   *     };
   *
   * @property event
   * @type Object
   * @static
   * @final
   */
  ListBuilder.event = {
    "button.addAll    click" : "addAll"
  , "button.add       click" : "add"
  , "button.removeAll click" : "removeAll"
  , "button.remove    click" : "remove"
  , "document beforeSubmit"  : "update"  // nablarch_submit によるサブミット前
  , "document afterSubmit"   : "render"  // nablarch_submit によるサブミット後
  };

  /**
   * ウィジェット識別子
   * @property widgetType
   * @static
   * @final
   * @default "nablarch_ListBuilder"
   */
  ListBuilder.widgetType = "nablarch_ListBuilder";

  Widget.register(ListBuilder);

  function ListBuilder(element, option) {
    if (!element) return this;

    this.constructor = ListBuilder;
    Widget.call(this, element);

    this.$toList   = $("#" + option.to);
    this.$fromList = $("#" + option.from);
    this.$options  = this.$fromList.find("option");
    this.$control  = $(element).html(template);

    this.render();
  }

  function  ListBuilder_render() {
    var $toList   = this.$toList.empty("option")
      , $fromList = this.$fromList.empty("option")
      , $options  = this.$options;

    $options.filter(":selected").appendTo($toList);
    $options.filter(":not(:selected)").appendTo($fromList);
    $options.width(); //なむなむ
    $options.prop("selected", "");
    if ($fromList.hasClass(readOnly.markerCss) || $fromList.attr('disabled')) {
      // 読み取り専用の場合には、ボタンを非活性化する
      this.$control.find('button').attr('disabled', 'true');
    }
    // IE対応のコード
    // IEはtabで移動した場合、最後にselectedだったoptionにフォーカスを当てるため、
    // リストボックス操作時には必ず先頭要素にフォーカスが移動するように、 先頭要素のselectedを明示的に設定してあげる。
    $toList.find("option").first().prop("selected", "selected").prop("selected", "");
    return this;
  }

  /**
   * リストボックス上のoption要素を移動する。
   *
   * @param {String}  direction 移動する方向を表す文字列。
   *                             "select" は選択先リストに、
   *                             "unselect" では選択元リストにそれぞれ移動する。
   *
   * @param {boolean} all       trueを指定した場合は全option要素を移動対象とする。
   *                             false もしくは省略した場合は、選択元リスト上の
   *                             選択状態(selected)にあるoption要素を移動する。
   * @chainable
   */
  function ListBuilder_moveItem(direction, all) {
    var select    = (direction === "select")
      , $fromList = this.$fromList
      , $toList   = this.$toList
      , $target   = (select ? $fromList : $toList)
                   .find(all ? "option" : "option:selected");

    if ($fromList.hasClass(readOnly.markerCss) || $fromList.is(':disabled')
     || $toList.hasClass(readOnly.markerCss)   || $toList.is(':disabled')) {
      return false;
    }

    $fromList.find("option").remove().prop("selected", "");
    $toList.find("option").remove().prop("selected", "selected");
    $target.prop("selected", select ? "selected" : "");
    return this.render();
  }

  function ListBuilder_update() {
    var $selected   = this.$toList.find("option")
      , $unselected = this.$fromList.find("option");

    $unselected.prop("selected", "");
    $selected.prop("selected", "selected")
             .hide() // ユーザから見えないように。。
             .appendTo(this.$fromList);
    return this;
  }

  return ListBuilder;
});

