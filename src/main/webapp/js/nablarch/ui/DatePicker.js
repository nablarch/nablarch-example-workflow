define(["jquery"
      , "nablarch/util/DateUtil"
      , "./Widget"
      , "text!./DatePicker.template"
      , "./readonly"
      , "sugar"],
function($, DateUtil, Widget, template, readOnly) { "use strict";
  /**
   * 日付入力機能
   * ============================================
   * 日付入力機能は日付文字列を入力するための入力補助UI部品である。
   * 日付入力機能は、以下の3つの要素から構成される。
   *
   * 1. 入力フィールド
   * 2. カレンダーの開閉を行う要素
   * 3. カレンダー
   *
   * **カレンダーの開閉**
   *   カレンダーの開閉を行う要素は、明示的な要素(ボタン)として配置してもよいが、
   *   ボタンを省略して、入力フィールド単独で開閉を行わせることも可能である。
   *   開かれたカレンダーは、カレンダー上の日付を選択するかカレンダーの外側のどこかを
   *   クリックすると閉じる。
   *   カレンダーでの値の変更があった場合は、入力フィールドのchangeイベントのみが発火する。
   *   ただし、入力フィールドで変更する際に通常発生するfocus, blurイベントなどは発生しない。
   *
   *
   * マークアップ仕様
   * ------------------------
   * カレンダーの開閉を行う要素にマーカーCSSクラス **nablarch_DatePicker** を指定する。
   * また、入力対象のフィールドのid属性を **-input** オプションに指定する。
   *
   *     <div class="field">
   *       <label>適用開始日：</label>
   *       <input id="effectiveDate" type="text" value="" />
   *       <button class="nablarch_DatePicker
   *                     -format yyyy/MM/dd
   *                     -locale ja
   *                     -input  effectiveDate">
   *         <i class="icon-calendar"></i>
   *       </button>
   *     </div>
   *
   * 次の記述例では、開閉ボタンを使用せずに、入力フィールドで直接カレンダーの開閉を行っている。
   * この場合、マーカCSSは入力フィールドに直接指定し、オプション **-input** は省略する。
   *
   *     <div class="field">
   *     <label>適用開始日：</label>
   *     <input
   *       id="effectiveDate"
   *       type="text"
   *       value=""
   *       class="nablarch_DatePicker
   *              -format yyyy/MM/dd
   *              -locale ja"
   *     </div>
   *
   * @class nablarch.ui.DatePicker
   *
   * @author Iwauo Tajima
   * @since  1.2
   */
  DatePicker.prototype = Object.merge(new Widget(), {
    /**
     * コンストラクタ関数。
     *
     * 第2引数に渡すオプションオブジェクトの内容は以下のとおり。
     *
     * @method DatePicker
     * @constructor
     * @param {HTMLElement} element マーカCSSを指定したDOMノード
     * @param {Object} option オプションを格納したオブジェクト
     *   **input:**  日付を入力するINPUT要素のid属性値
     *   **locale:** 表示言語 (デフォルト:ja)
     *   **format:** 日付フォーマット (デフォルト:yyyy/M/d)
     * @return {DatePicker} インスタンス
     */
    constructor: DatePicker
    /**
     * 選択中の日付
     * @property selectedDate
     * @type Date
     */
  , selectedDate: null
    /**
     * 現在表示しているカレンダーの基準日
     * @property displayingDate
     * @type Date
     */
  , displayingDate: null
    /**
     * 現在日付(カレンダーを開いた時点で更新する。)
     * @property today
     * @type Date
     */
  , today: null
    /**
     * 日付のフォーマット
     * @property format
     * @type String
     */
  , format: null
    /**
     * 表示言語
     * @property locale
     * @type String
     */
  , locale: null
    /**
     * 入力フィールド
     * @property $input
     * @type jQuery
     */
  , $input: null
    /**
     * カレンダー表示部
     * @property $calendar
     * @type jQuery
     */
  , $calendar : null
    /**
     * 現在の状態に沿って、カレンダーを(再)描画する。
     */
  , render: DatePicker_render
    /**
     * カレンダーを開く。
     * @method show
     * @param event {jQuery.Event} イベント
     * @return {Boolean} 常にfalseを返す。
     */
  , show: DatePicker_show
    /**
     * カレンダーを閉じる。
     * @method hide
     * @param event {jQuery.Event} イベント
     * @return {Boolean} 常にfalseを返す。
     */
  , hide: DatePicker_hide
    /**
     * 選択された日付を取得する。
     * 日付が選択されていない場合や、日付の形式が正しくない場合は null を返す。
     *
     * @example
     *     // 選択された日付を取得する
     *     var datePicker   = $form.find(".nablarch_DatePicker").widget(DatePicker)
     *       , selectedDate = datePicker.getDate();
     *
     * @method getDate
     * @return {Date} 現在選択中の日付
     */
  , getDate: DatePicker_getDate //
  });

  /**
   * イベント定義
   *
   *     DatePicker.event = {
   *       "click"                      : DatePicker_toggle
   *     , "$calendar .thisMonth click" : DatePicker_selectDate
   *     , "$calendar .nextMonth click" : DatePicker_nextMonth
   *     , "$calendar .lastMonth click" : DatePicker_lastMonth
   *     , "$calendar .nextYear  click" : DatePicker_nextYear
   *     , "$calendar .lastYear  click" : DatePicker_lastYear
   *     , "$calendar .today     click" : DatePicker_today
   *     , "$calendar .close     click" : DatePicker_hide
   *     , "$input               blur"  : DatePicker_format
   *     };
   *
   * @property event
   * @type Object
   * @static
   * @final
   */
  DatePicker.event = {
    "click"                      : DatePicker_toggle
  , "$calendar .thisMonth click" : DatePicker_selectDate
  , "$calendar .nextMonth click" : DatePicker_nextMonth
  , "$calendar .lastMonth click" : DatePicker_lastMonth
  , "$calendar .nextYear  click" : DatePicker_nextYear
  , "$calendar .lastYear  click" : DatePicker_lastYear
  , "$calendar .today     click" : DatePicker_today
  , "$calendar .close     click" : DatePicker_hide
  , "$input               blur"  : DatePicker_format
  };



  /**
   * カレンダーの外部をクリックした場合に開かれているカレンダーを閉じる。
   * (iOSではクリックイベントが特定の要素上でしかバブリングしないので、
   *  タッチデバイスではタッチイベントにバインドする。)
   */
  var touchEventSupported = ('ontouchstart' in window)
    , touchstart          = (touchEventSupported ? 'touchstart' : 'click');
  DatePicker.event["document " + touchstart] = occuredAtOutsideOfCalendar(DatePicker_hide);

  /**
   * カレンダの外部でイベントが発生した場合のみ、渡されたイベントハンドラを実行する
   * イベントハンドラを返す。
   */
  function occuredAtOutsideOfCalendar(f) {
    return function(event) {
      if (this.$calendar.find(getTouch(event).target).length === 0) {
        f.apply(this, arguments);
      }
    };
  }

  /**
   * イベントオブジェクト取得
   */
  function getTouch(event) {
    return touchEventSupported
         ? event.originalEvent.touches[0]
         : event;
  }

  /**
   * モジュール識別名
   * @property widgetType
   * @type String
   * @static
   * @final
   */
  DatePicker.widgetType = "nablarch_DatePicker";

  Widget.register(DatePicker);

  function DatePicker(element, option) {
    if (arguments.length === 0) return this;
    this.$calendar = $(template).css({display:"none"});

    this.constructor = DatePicker;

    this.format = option.format || "yyyy/M/d";
    this.locale = option.locale || "ja";
    this.$input = option.input ? $("#" + option.input.replace(/\./g, '\\.'))
                               : $(element);
    Widget.call(this, element);

    renderWeekday(this);
    this.$input.after(this.$calendar);

    // 曜日欄を表示する。
    function renderWeekday(self) {
      var date = new Date();
      (0).upto(6, function(n) {
        var text;
        date.setWeekday(n);
        text = date.format("{dow}", self.locale);
        self.$calendar.find("th.weekday" + n).text(text);
      });
    }
  }

  function DatePicker_show(event) {
    var val;
    if (this.$input.is(':disabled') || this.$input.hasClass(readOnly.markerCss)) {
      return false;
    }
    // before open a calendar, close all calendars.
    $('.' + DatePicker.widgetType).widgets(DatePicker).each(function() {
      this.hide();
    });

    val = this.$input.val();
    this.$input.data("datePicker_preval", val); // カレンダー表示時の値
    this.today = Date.create("today");
    if (val) {
      this.selectedDate = DateUtil.parse(val, this.format);
      this.$input.val(DateUtil.format(this.selectedDate, this.format, this.locale));
    }
    else {
      this.selectedDate = null;
      this.$input.val("");
    }
    this.displayingDate = this.selectedDate || this.today;
    this.render();
    this.$calendar.fadeIn("fast");
    return false;
  }


  /**
   * カレンダーを閉じる。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_hide(event) {
    var showed = this.$calendar.is(":visible");
    this.$calendar.fadeOut("fast");
    if (showed && this.$input.val() !== this.$input.data("datePicker_preval")) {
      this.$input.trigger("change");
    }
    return false;
  }

  function DatePicker_toggle(event) {
    this.$calendar.is(":hidden") ? this.show(event)
                                 : this.hide(event);
    return false;
  }

  /**
   * 表示内容を内部状態に合わせて更新する。
   */
  function DatePicker_render() {
    var $calendar    = this.$calendar
      , baseDate     = this.displayingDate
      , today        = this.today
      , selectedDate = this.selectedDate
      , firstDate    = baseDate.clone().beginningOfMonth().beginningOfWeek()
      , lastDate     = firstDate.clone().addDays(41) // 6 weeks
      , thisMonth    = baseDate.getMonth();

    $calendar.find(".month .value")
             .text(baseDate.format("{Month}", this.locale));
    $calendar.find(".year .value")
             .text(baseDate.format("{yyyy}", this.locale));

    Date.range(firstDate, lastDate).every('day', renderDate);
    return false;

    function renderDate(date, index) {
      var $cell = $calendar.find("td.day" + index);

      (date.getMonth() === thisMonth)
        ? $cell.addClass("thisMonth")
        : $cell.removeClass("thisMonth");

      (selectedDate && date.is(selectedDate))
        ? $cell.addClass("selected")
        : $cell.removeClass("selected");

      date.is(today)
        ? $cell.addClass("today")
        : $cell.removeClass("today");

      $cell.text(date.getDate()).data("calendar-date", date);
    }
  }

  /**
   * 日付を選択する。
   *
   * イベントの発生元に保持された日付をフォーマットしてから
   * 入力フィールドに設定する。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_selectDate(event) {
    var selectedDate = $(event.target).data("calendar-date");
    this.$input.val(DateUtil.format(selectedDate, this.format, this.locale));
    this.$node.focus();
    return this.hide();
  }

  /**
   * カレンダーの表示月を1年すすめる。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_nextYear(event) {
    this.displayingDate = (1).yearAfter(this.displayingDate);
    return this.render();
  }

  /**
   * カレンダーの表示月を1年前に戻す。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_lastYear(event) {
    this.displayingDate = (1).yearBefore(this.displayingDate);
    return this.render();
  }

  /**
   * カレンダーの表示月を翌月にする。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_nextMonth(event) {
    this.displayingDate = (1).monthAfter(this.displayingDate);
    return this.render();
  }

  /**
   * カレンダーの表示月を一ヶ月戻す。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_lastMonth(event) {
    this.displayingDate = (1).monthBefore(this.displayingDate);
    return this.render();
  }

  /**
   * カレンダーの表示月を現在の月にする。
   *
   * @param event {jQuery.Event} イベント
   * @returns false
   */
  function DatePicker_today(event) {
    this.displayingDate = this.today.clone();
    return this.render();
  }

  /**
   * 選択された日付を取得する。
   *
   * @returns {Date} 選択された日付。
   *                  未選択時はnullが返る。
   */
  function DatePicker_getDate() {
    return DateUtil.parse(this.$node.val(), this.format);
  }

  /**
   * 入力フィールドの文字列を日付フォーマットに従って編集し、
   * その結果文字列を設定する。
   * フィールドの文字列がフォーマットに合致しなかった場合は
   * フィールド内の文字列をクリアする。
   */
  function DatePicker_format(event) {
    var val  = this.$input.val()
      , date = val && DateUtil.parse(val, this.format);

    val = date ? DateUtil.format(date, this.format, this.locale)
               : '';
    this.$input.val(val);
    return this;
  }


  return DatePicker;
});
