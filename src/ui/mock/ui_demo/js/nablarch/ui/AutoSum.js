/**
 * @module nablarch.ui
 */
define([
  "jquery"                         // jQueryライブラリ
  , "nablarch/ui/Widget"           // ウィジェットの共通基底クラス
  , "nablarch/util/BigDecimal"     // BigDecimalクラス
  , "nablarch/ui/readonly"         // readonly制御
  , "nablarch/ui/event"            // nablarchの動作に関連したイベントの定義
  , "sugar"                        // sugar.js
],

  function ($, Widget, BigDecimal, readonly) { "use strict";    
    /**
     * 自動集計機能
     * ============================================
     * 自動集計機能は、ユーザが入力した値をクライアントサイドで集計するためのUI機能である。
     *
     * 本機能では、テキストフィールドに入力された値を集計し合計欄に結果を出力する。
     * 集計処理が行われるタイミングは、集計対象のテキストフィールドからフォーカスが外れたタイミングである。
     *
     * ※集計対象の入力欄の値が入力されているが数値以外の場合には、集計処理を行うことができないため計算結果はNaN(Not A Number)となる。
     * また、有効桁(15桁)を超える場合にもNaN(Not A Number)となる。
     *
     * マークアップ仕様
     * ------------------------
     * 本機能を使用する場合以下のマーカCSSを使用する。
     *
     * 1. 合計値を出力する要素
     *
     *   マーカCSSとして `nablarch_AutoSum` を指定する。
     *   自動集計対象のテキストフィールドは、`-target` オプションで指定する。  
     *   (合計値は、テキストフィールド及びHTML要素のContent部に出力する事ができる。)
     *
     * 2. 自動集計対象の要素
     * 
     *   合計値を出力する要素の `-target` オプションで指定した値をマーカCSSとして指定する。
     *   
     *   **加算する場合:** `AutoSum_ + (-target オプションで指定した値)`  
     *   **減算する場合:** `AutoSum_ + (-target オプションで指定した値) + _negative`
     *
     * 使用例
     * ---------
     * 
     *   **HTML** 
     * 
     *     <!-- 合計値を出力するエリア -->
     *     <!-- 集計対象の入力フィールドは、class属性に「target1」が指定されたものとなる -->
     *     <span class="AutoSum -target target1"></span>
     *     <!-- 集計対象の入力フィールド -->
     *     <!-- 合計値出力エリアの「-target」で指定したクラス名を設定する。 -->
     *     <input name="form.amount1" class="AutoSum_target1" size="15" maxlength="10">
     *     <input name="form.amount2" class="AutoSum_target1" size="15" maxlength="10">
     *     <!-- 末尾に_negativeが付加されているので、この項目だけは集計時に減算される -->
     *     <input name="form.amount3" class="AutoSum_target1_negative" size="15" maxlength="10">
     *
     *
     *   **JSP**
     *   
     *   この実装例では、以下2種類の自動集計が行われる。  
     *   1. 金額1-1から金額1-3の合計が合計1に出力される。  
     *   2. 金額2-1と金額2-2の合計が合計2に出力される。  
     *   (金額2-2には、減算のマーカCSSが指定されているため、金額2-1から金額2-2を引いた値が出力される。)
     * 
     *     <div class="field">
     *       <label>金額1-1：</label>
     *       <n:text name="W99ZZ5.amount1_1" id="amount1_1" maxlength="20" cssClass="AutoSum_target1" />
     *       <n:error name="W99ZZ5.amount1_1" />
     *     </div>
     *
     *     <div class="field">
     *       <label>金額1-2：</label>
     *       <n:text name="W99ZZ5.amount1_2" id="amount1_2" maxlength="20" cssClass="AutoSum_target1" />
     *       <n:error name="W99ZZ5.amount1_2" />
     *     </div>
     *     
     *     <div class="field">
     *       <label>金額1-3：</label>
     *       <n:text name="W99ZZ5.amount1_3" id="amount1_3" maxlength="20" cssClass="AutoSum_target1" />
     *       <n:error name="W99ZZ5.amount1_3" />
     *     </div>
     *     
     *     <div class="field">
     *       <label>合計1：</label>
     *       <span class="nablarch_AutoSum -target target1" id="autoSum1"><n:write name="W99ZZ5.totalAmount1" valueFormat="decimal{#,###.##}" /></span>
     *     </div>
     *     
     *     <div class="field">
     *       <label>金額2-1：</label>
     *       <n:text name="W99ZZ5.amount2_1" id="amount2_1" maxlength="20" cssClass="AutoSum_target2" />
     *       <n:error name="W99ZZ5.amount2_1" />
     *     </div>
     *     
     *     <div class="field">
     *       <label>金額2-2：</label>
     *       <n:text name="W99ZZ5.amount2_2" id="amount2_2" maxlength="20" cssClass="AutoSum_target2_negative" />
     *       <n:error name="W99ZZ5.amount2_2" />
     *     </div>
     *     
     *     <div class="field">
     *       <label>合計2：</label>
     *       <n:text id="autoSum2" cssClass="nablarch_AutoSum -target target2" name="W99ZZ5.totalAmount2" valueFormat="decimal{#,###.##}" disabled="true" />
     *     </div>
     *
     * @class nablarch.ui.AutoSum
     * @author Hisaaki Sioiri
     * @since  1.2
     */
    AutoSum.prototype = Object.merge(new Widget(), {
      /**
       * コンストラクタ。
       * @method AutoSum
       * @constructor
       * @param {Element} element       集計結果を出力するエリアのDOMノード
       * @param {Object} opt オプションを格納したオブジェクト  
       *   **target:** (`String`) 集計対象の入力フィールドのクラス名
       * @returns {AutoSum} インスタンス
       */
      constructor: AutoSum,
      /**
       * 加算対象の入力フィールド
       * @property $target
       * @type jQuery
       */
      $target:null,
      /**
       * 減算対象の入力フィールド
       * @property $negativeTarget
       * @type jQuery
       */
      $negativeTarget:null,
      /**
       * 集計結果を出力する要素
       * @property $element
       * @type jQuery
       */
      $element:null,
      /**
       * 集計処理を行う。
       *
       * 集計対象の要素から値を取得し、合計値をカンマ編集し出力する。
       *
       * @method sum
       * @param {jQuery.Event} event イベント(使用しない)
       */
      sum:AutoSum_sum
    });

    /**
     * イベント定義
     * 
     *     AutoSum.event = {
     *       "$target focusout":"sum",
     *       "$negativeTarget focusout":"sum"
     *     };
     *    
     * @property event
     * @type Object
     * @static
     * @final
     * 
     */
    AutoSum.event = {
      "$target focusout":"sum",
      "$negativeTarget focusout":"sum"
    };

    /**
     * ウィジェット識別子
     * 
     * @property widgetType
     * @type String
     * @static
     * @final
     * @default  "nablarch_AutoSum"
     */
    AutoSum.widgetType = "nablarch_AutoSum";
    
    Widget.register(AutoSum);
    
    function AutoSum(element, option) {
      if (!element) {
        return this;
      }
      this.$target = $(":input.AutoSum_" + option.target).not(":disabled:not(." + readonly.markerCss + ")");
      this.$negativeTarget = $(":input.AutoSum_" + option.target + "_negative").not(":disabled:not(."+readonly.markerCss+")");
      this.constructor = AutoSum;
      Widget.call(this, element);
      this.$element = $(element);

      // 自動集計対象が存在している場合、画面表示時に自動集計を行う。
      // （確認画面では、サーバサイドで計算した値を出力することを想定し、クライアントサイドでの集計は行わない。）
      if (this.$target.length !== 0) {
        this.sum();
      }
    }

    function AutoSum_sum(event) {
      var total = new BigDecimal(0);
      // 加算項目
      this.$target.each(function () {
        var $this = $(this),
          val;
        val = $this.val().trim() || '0';
        if (isNumber(val)) {
          total = total.add(new BigDecimal(val.toNumber()));
        } else {
          total = BigDecimal.NaN;
        }
      });
      // 減算項目
      this.$negativeTarget.each(function () {
        var $this = $(this),
          val;
        val = $this.val().trim() || '0';
        if (isNumber(val)) {
          total = total.subtract(new BigDecimal(val.toNumber()));
        } else {
          total = BigDecimal.NaN;
        }
      });
      if (this.$element.is('input')) {
        this.$element.val(total.toNumber().format());
      } else {
        this.$element.text(total.toNumber().format());
      }

      function isNumber(value) {
        return value.match(/^-?\d{1,3}(,?\d{3})*(\.\d*)?$/)
      }
    }

    return AutoSum;
  }
);

