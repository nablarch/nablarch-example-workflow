define(['nablarch/ui/Widget', 'jquery', 'sugar'],
  function (Widget, $) {
    "use strict";

    /**
     * チェックボックスの全選択/全解除
     * ==================================================
     * チェックボックスの全選択および全解除の機能をもつ。
     *
     * マークアップ仕様
     * ------------------------
     * 全選択（全解除）のリンクやボタン等を配置するDOMに対して、nablarch_Toggle_checkboxクラスを設定する。
     * nablarch_Toggle_checkboxにはオプションとして、toggleTargetを設定する。
     * toggleTargetオプションには、操作対象のチェックボックスを示すクラス属性を設定する。
     *
     * 操作対象のチェックボックスには、toggleTargetオプションで指定したクラスと、
     * toggleクラスをセットで設定する。
     *
     * **実装例(HTML)**
     *
     * <%-- 全選択/全解除のリンク --%>
     * <div class="nablarch_Toggle_checkbox -toggleTarget userId">
     *   <a href="toggle-on">全選択</a>/<a href="toggle-off">全解除</a>
     * </div>
     *
     * <%-- 操作対象のチェックボックス --%>
     * <input type="checkbox" name="userId[0]" class="toggle userId">
     * <input type="checkbox" name="userId[1]" class="toggle userId">
     * <input type="checkbox" name="userId[2]" class="toggle userId">
     * <input type="checkbox" name="userId[3]" class="toggle userId">
     *
     * @class nablarch.ui.ToggleCheckbox
     *
     * @author Hisaaki Sioiri
     * @since  1.4
     */
    ToggleCheckbox.prototype = Object.merge(new Widget(), {

      /**
       * コンストラクタ関数
       *
       * 第2引数に渡すオプションオブジェクトの内容は以下のとおり。
       *
       *   -toggleTarget 全選択/全解除を行う対象のチェックボックスのclass属性の値
       *
       * @method ToggleCheckbox
       * @constructor
       *
       * @param {Element} element マーカCSSを指定したDOMノード
       * @param {Object} opts 各種オプションを保持するオブジェクト
       * @return {Tooltip} インスタンス
       */
      constructor: ToggleCheckbox

      /**
       * 全選択/全解除操作を行うチェックボックス
       */
      , $checkboxes: null

      /**
       * 全選択を行うイベントトリガーDOMノード
       */
      , $toggleOn: null

      /**
       * 全選択を行うイベントトリガーDOMノード
       */
      , $toggleOff: null

      /** チェック:on */
      , toggleOn: ToggleCheckbox_toggle.fill(true)

      /** チェック:off */
      , toggleOff: ToggleCheckbox_toggle.fill(false)
    });


    /**
     * イベント定義
     */
    ToggleCheckbox.event = {
      "$toggleOn click" : "toggleOn"
      , "$toggleOff click" : "toggleOff"
    };

    ToggleCheckbox.widgetType = 'nablarch_Toggle_checkbox';
    Widget.register(ToggleCheckbox);

    /**
     * コンストラクタ関数。
     *
     * 第2引数に渡すオプションオブジェクトの内容は以下のとおり。
     *
     *   -toggleTarget 全選択/全解除を行う対象のチェックボックスのclass属性の値
     *   (toggleTargetオプションに指定した値を操作対象のチェックボックスのclass属性に「toggle」クラスとセットで指定することで、チェックボックスの全選択/全解除が可能となる)
     *
     *
     * @method ToggleCheckbox
     * @constructor
     *
     * @param {Element} element マーカCSSを指定したDOMノード
     * @param opts オプションを保持するオブジェクト
     */
    function ToggleCheckbox(element, opts) {
      var target = opts.toggleTarget;
      this.constructor = ToggleCheckbox;
      this.$checkboxes = $('input:checkbox.toggle.' + target);
      this.$toggleOn = $(element).find('.toggle-on');
      this.$toggleOff = $(element).find('.toggle-off');

      Object.merge(this, opts);

      Widget.call(this, element);
    }

    /**
     * チェックボックスの選択状態を状態を変更する。
     *
     * @param checked true:チェックon, false:チェックoff
     * @return {boolean}
     */
    function ToggleCheckbox_toggle(checked) {
      this.$checkboxes.prop('checked', checked);
      return false;
    }
    return ToggleCheckbox;
  }
);

