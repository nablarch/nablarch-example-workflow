/**
 * @module nablarch.util
 */
define(["sugar"], function() { "use strict";

  function define() {
    return SimpleDateFormat;
  }

  /**
   * Java SDK SimpleDateFormat クラス互換ライブラリ
   * ---------------------------------------------------------
   * 本クラスではSimpleDateFormatの仕様のうち、日付に関する処理のサブセットを実装する。
   * サポートするフォーマット書式は以下の通り。
   *
   *     yyyy: 西暦年(4桁)
   *     yy  : 西暦年(下2桁)  * パース時は現在を起点として過去80年～20年後に収まる日付になる。
   *     M   : 月 (1～2桁)
   *     MM  : 月 (2桁)
   *     MMM : 月 (テキスト)  * フォーマット時のみ
   *     d   : 日 (1～2桁)
   *     dd  : 日 (2桁)
   *     EEEE: 曜日 (テキスト) * フォーマット時のみ、ロケール対応
   *     E   : 曜日略号 (テキスト) * フォーマット時のみ、ロケール対応
   *     ''  : シングルクォート
   *     [a-zA-Z']以外の文字 : リテラル
   *     'によるクォート文字列 : リテラル
   *
   * @class nablarch.util.SimpleDateFormat
   * @author Iwauo Tajima
   * @since  1.2
   */
  SimpleDateFormat.prototype = {
    /**
     * コンストラクタ
     * @method SimpleDateFormat
     * @constructor
     * @param {String} pattern フォーマット文字列
     * @return {SimpleDateFormat} インスタンス
    */
    constructor: SimpleDateFormat
    /**
     * フォーマット文字列
     * @property pattern
     * @type String
     */
  , pattern: null
    /**
     * 日付オブジェクトを文字列表現に変換する。
     * @method format
     * @param   {String} date 日付オブジェクト
     * @param   {String} locale = 'ja' ロケール
     * @return {String} 日付オブジェクトの文字列表現
     */
  , format: SimpleDateFormat_format
    /**
     * 日付文字列を`Date`オブジェクトに変換する。
     * 変換できない場合nullを返却する。
     *
     * @method parse
     * @param {String} dateStr 日付文字列
     * @returns {Date} 日付オブジェクト
     */
  , parse: SimpleDateFormat_parse
    /**
     * フォーマット文字列をパースし、対応するアクションを実行する。
     * @method eval
     * @param {Object} action 実行するアクション
     */
  , eval: SimpleDateFormat_eval
  };

  function SimpleDateFormat(pattern) {
    this.pattern = pattern;
  }

  function SimpleDateFormat_parse(dateStr) {
    var date  = new Date(1970, 1, 1)
      , c     = new Consumer(dateStr)
      , valid = true;
    this.eval({
      letters: consumeLetters
    , text   : consumeText
    });
    return valid ? date : null;

    //--- subroutines ---//

    /** 日付書式文字列を読み込む */
    function consumeLetters(letters) {
      var m;
      switch (letters) {
        case "yyyy":
          (m = c.consume(/^\d{1,4}/)) && date.setFullYear(Number(m[0]));
          break;

        case "yy":
          (m = c.consume(/^\d{1,4}/)) && setYear(date, Number(m[0]));
          break;

        case "M": case "MM":
          (m = c.consume(/^\d{1,2}/)) && date.setMonth(Number(m[0]) -1);
          break;

        case "d": case "dd":
          (m = c.consume(/^\d{1,2}/)) && date.setDate(Number(m[0]));
          break;

        default:
          m = null;
      }
      if (!m) {
        valid = false;
        return false;
      }
    }

    /** リテラル文字列を読み込む */
    function consumeText(text) {
      return c.consume("^" + RegExp.escape(text));
    }

    /** 2桁表記の年を設定する。(設定年は現在から80年前～20年後の範囲に収める) */
    function setYear(date, yy) {
      var currentCentury, year;

      if (yy.length > 2) {
        date.setFullYear(Number(yy));
        return;
      }

      currentCentury = new Date().getFullYear().toString().first(2);
      year = Date.create(currentCentury + ("0" + yy).last(2));

      year = year.isAfter("20 years after")  ? year.rewind("100 years")
           : year.isBefore("80 yeas before") ? year.advance("100 years")
           : year;

      date.setFullYear(year.getFullYear());
    }
  }

  function SimpleDateFormat_format(date, locale) {
    var buff = []
      , valid = null;
    locale = locale || "ja";

    if (!date || !Object.isDate(date)) {
      return "";
    }

    valid = this.eval({
      letters : consumeLetters
    , text    : consumeText
    });
    return valid ? buff.join("") : "";

    //--- subroutines ---//
    /** 日付書式文字を読み込む */
    function consumeLetters(letters) {
      switch (letters) {
        case "yyyy": buff.push(("000" + date.getFullYear()).last(4));  break;
        case "yy"  : buff.push(date.getFullYear().toString().last(2)); break;
        case "M"   : buff.push(date.getMonth()+1);                     break;
        case "MM"  : buff.push(("0" + (date.getMonth()+1)).last(2));   break;
        case "MMM" : buff.push(date.format("{Mon}", locale));          break;
        case "d"   : buff.push(date.getDate());                        break;
        case "dd"  : buff.push(("0" + date.getDate()).last(2));        break;
        case "EEEE": buff.push(date.format("{Weekday}", locale));      break;
        case "E"   : buff.push(date.format("{Dow}", locale));          break;
        default:;
      }
    }
    /** リテラル文字を読み込む */
    function consumeText(text) {
      buff.push(text);
    }
  }

  function SimpleDateFormat_eval(action) {
    var c = new Consumer(this.pattern);
    action = action || {};
    var result = c.some(token);
    return result;

    function token(c) {
      return c.consume(letters, action.letters)
          || c.consume(text,    action.text);
    }

    function letters(c) {
      return c.consume(/^([a-zA-Z])\1*/);
    }

    function text(c) {
      return c.consume(quotedText)
          || c.consume(unquotedText);
    }

    function quotedText(c) {
      return c.consume(/^'([^']|'')+'/);
    }

    function unquotedText(c) {
      return c.consume(/^[^a-zA-Z']+/);
    }
  }

  /**
   * 簡易スキャナ
   */
  Consumer.prototype = {
    // properties
    source  : null
  , pos     : null
  , action  : null
    // methods
  , some    : Consumer_some
  , consume : Consumer_consume
  , ended   : function() { return (this.pos > this.source.length); }
  };

  /**
   * コンストラクタ
   * @param source   入力文字列
   * @param actions  実行するアクション
   * @returns {Consumer} インスタンス
   */
  function Consumer(source) {
    this.source  = source;
    this.pos     = 0;              // 次回読み出し開始位置
  }

  /**
   * 指定された正規表現、もしくはルールを読み込む
   * @param pattern {RegExp} 読み込むパターン
   * @param pattern {String} 読み込むパターン
   * @param pattern {Function} 読み込むルール
   */
  function Consumer_consume(pattern, action) {
    var self = this
      , head = this.pos
      , m    = null;

    m = Object.isRegExp(pattern)   ? consumePattern(pattern)
      : Object.isString(pattern)   ? consumePattern(new RegExp(pattern))
      : Object.isFunction(pattern) ? consumeFunction(pattern)
      : null;

    if (!m) {
      this.pos = head;
    }

    if (m && action && Object.isFunction(action)) {
      if (action.apply(self, m) === false) {
        return null;
      }
    }
    return m;

    //--- subroutines ---//
    /** パターンを読み込む */
    function consumePattern(regex) {
      var m = regex.exec(self.source.substring(self.pos));
      if (m) {
         self.pos += m[0].length;
      }
      return m;
    }

    /** ルールを読み込む */
    function consumeFunction(func) {
      return func.call(null, self);
    }
  }

  /**
   * 指定されたルールを1回以上読み込む。
   * @param func {Function} ルール
   */
  function Consumer_some(func) {
    var m = this.consume(func)
      , result = m;

    while (m && !this.ended()) {
      m = this.consume(func);
    }
    return result;
  }

  return define();
});

