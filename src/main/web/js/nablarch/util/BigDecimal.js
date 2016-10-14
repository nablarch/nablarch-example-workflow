/**
 * @module nablarch.util
 */
define(function () {

  "use strict";
  
  function BigDecimal(value, /* option */ scale) {
    if (overflow(value)) {
      return BigDecimal.NaN;
    }

    // 非数値の場合は、BigDecimal.NaNとする
    if (!isNumber(value)) {
      return BigDecimal.NaN;
    }

    /** 文字列に変換した値 */
    this._value = value.toString();

    /** スケール(スケールが指定されない場合は、値を元に導出する) */
    this._scale = isNumber(scale) ? Math.floor(scale) : getScale(this._value);
  }

  /**
   * Javascriptによる簡易BigDecimal実装
   * ------------------------------------
   * 
   * **許容される10進桁数**  
   * javascriptの数値(number)は全て浮動小数点によって内部的に保持される。
   * このBigDecimalの実装では、数値部分をjavascriptのnumberとして保持するので、
   * 数値部分の計算で浮動小数の実数部の最大値(=2^53)を超過すると精度が下がり、
   * 計算結果がずれる。
   * 
   * このため、計算結果の数値部分が一定の桁数を越えた場合はNaNを返す。
   * log(2^53) = 15.95 なので、デフォルトの設定値では10^15未満の数(15桁の)数を許容する。
   * 
   * @class nablarch.util.BigDecimal
   * @author Hisaaki Sioiri
   * @since 1.2
   */
  BigDecimal.prototype = {
    /**
     * コンストラクタ。
     * @param {Number} value 値。(数値以外の値が指定された場合はNaNに変換する。)
     * @param {Number} scale スケール(数値以外の値が指定された場合は、0に変換する。)
     * @constructor
     */  
    constructor: BigDecimal,
    /**
     * 加算を行う。
     * 
     * @method add
     * @param {Number|String} value 加算する値
     * @param {Number|String} [scale] 加算後のスケール  
     * (未指定の場合は、このオブジェクトのスケールとaddValueのスケールの大きいスケールが適用される。)
     * @return {BigDecimal} 加算後の値
     */    
    add:BigDecimal_add,
    /**
     * 減算を行う。
     * @method subtract
     * @param {Number|String} value 減算する値
     * @param {Number|String} [scale] 減算後のスケール  
     * (未指定の場合は、このオブジェクトのスケールとaddValueのスケールの大きいスケールが適用される。)
     * @return {BigDecimal} 減算後の値
     */
    subtract:BigDecimal_subtract,
    /**
     * 乗算を行う。
     * @method multiply
     * @param {Number|String} value 乗算する値
     * @param {Number|String} [scale] 乗算後のスケール  
     * (未指定の場合は、このオブジェクトのスケールとaddValueのスケールの大きいスケールが適用される。)
     * @return {BigDecimal} 乗算後の値
     */
    multiply:BigDecimal_multiply,
    /**
     * 文字列に変換する。
     * @method toString
     * @return {String} 変換後の文字列
     */    
    toString:BigDecimal_toString,
    /**
     * 数値に変換する。
     * @method toNumber
     * @return {Number} 変換後の数値
     */
    toNumber:BigDecimal_toNumber
  };
  
  /**
   * 最大数値
   * @property maxDigit
   * @static
   * @final
   */
  BigDecimal.maxDigit =  1000 * 1000 * 1000 * 1000 * 1000 - 1; // 最大数値
  
  /**
   * 最小数値
   * @property minDigit
   * @static
   * @final
   */  
  BigDecimal.minDigit = -1000 * 1000 * 1000 * 1000 * 1000 + 1; // 最小数値
  
  function overflow(digit) {
    if (typeof digit === "string") {
      digit = toInteger(digit);
    }
    return (digit > BigDecimal.maxDigit)
        || (digit < BigDecimal.minDigit);
  }
  
  /**
   *  Not A Number
   *  @class nablarch.util.BigDecimal.NaN
   *  @final
   *  @for nablarch.util.BigDecimal
   */
  BigDecimal.NaN = new BigDecimal(0,0);
  BigDecimal.NaN.add = function() {return this;};
  BigDecimal.NaN.subtract = function() {return this;};
  BigDecimal.NaN.multiply = function() {return this;};
  BigDecimal.NaN.toString = function() {return "NaN";};
  BigDecimal.NaN.toNumber = function() {return Number.NaN;};
  
  return BigDecimal;

  function BigDecimal_add(value, /* option */ scale) {
    return expression(this, value, scale,
        function (v1, v2) {
          return v1 + v2;
        },
        function (scale) {
          return scale;
        });
  }

  function BigDecimal_subtract(value, /* option */ scale) {
    return expression(this, value, scale,
        function (v1, v2) {
          return v1 - v2;
        },
        function (scale) {
          return scale;
        });
  }

  function BigDecimal_multiply(value, /* option */ scale) {
    return expression(this, value, scale,
        function (v1, v2) {
          return v1 * v2;
        }, function (scale) {
          return scale * 2;
        });
  }

  function BigDecimal_toString() {
    var str = this._value,
    sign = "";
    if (str.substring(0,1) === "-"){
      str = str.substring(1);
      if (str.match(/[^0.]/)){
        sign = "-";
      }
    }
    var split = str.split(".");
    split[0] = split[0].length == 0 ? "0" : split[0];
    if (this._scale === 0) {
      return sign + split[0];
    } else if (split.length === 1) {
      return sign + split[0] + "." + addZero("", this._scale);
    } else if (split[1].length < this._scale) {
      return sign + split[0] + "." + addZero(split[1], this._scale);
    } else {
      return sign + split[0] + "." + split[1].substring(0, this._scale);
    }
  }

  function BigDecimal_toNumber() {
    return Number(this.toString());
  }

  /**
   * 計算を行う。
   * @param value1 計算対象の値1
   * @param value2 計算対象の値2
   * @param scale 計算時のスケール
   * @param expressionInner 計算処理を行う関数
   * @return {BigDecimal} 計算後の値
   */
  function expression(value1, value2, scale, expressionInner, newScale) {
    var thisNumber,
        addNumber,
        maxScale,
        resultNumber;

    if (!(value2 instanceof BigDecimal)) {
      value2 = new BigDecimal(value2);
    }

    if (value2 === BigDecimal.NaN) {
      return BigDecimal.NaN;
    }
    maxScale = Math.max(value1._scale, value2._scale);
    thisNumber   = toInteger(value1._value, maxScale);
    addNumber    = toInteger(value2._value, maxScale);
    if (overflow(thisNumber) || overflow(addNumber)) {
      return BigDecimal.NaN;
    }
    resultNumber = expressionInner(thisNumber, addNumber);
    if (overflow(resultNumber)) {
      return BigDecimal.NaN;
    }
    return new BigDecimal(toBigDecimalString(resultNumber, newScale(maxScale)),
        isNumber(scale) ? scale : maxScale);
  }

  /**
   * 文字列値からスケールを導出する。
   * @param value 値
   * @return {Number} スケール
   */
  function getScale(value) {
    if (value.indexOf(".") === -1) {
      return 0;
    }
    return value.split(".")[1].length;
  }

  /**
   * スケール分桁をずらした数値に変換する。
   * @param value 値
   * @param scale スケール
   * @return {Number} 変換後の値
   */
  function toInteger(value, scale) {
    var split = value.split(".");
    if (split.length === 1) {
      return Number(value + addZero("", scale));
    }
    if (split[1].length >= scale) {
      return Number(split[0] + split[1].substring(0, scale));
    } else {
      return Number(split[0] + addZero(split[1], scale));
    }
  }

  /**
   * 指定されたスケールを持つ数値文字列に変換する。
   * 
   * 数値部が BigDecimal.maxDigit を超過した場合は"NaN" を返す。
   * 
   * @param value 値
   * @param scale スケール
   * @return {String}
   */
  function toBigDecimalString(value, scale) {
    var str = value.toString();
    if (scale === 0) {
      return str;
    }
    var sign = "";
    if (str.substring(0,1) === "-"){
      str = str.substring(1);
      if (str !== "0"){
        sign = "-";
      }
    }
    if (str.length <= scale){
      str = addZero("", scale - str.length + 1) + str;
    }
    return sign + str.substring(0, str.length - scale) + "." + str.substring(str.length - scale);
  }

  /**
   * 指定した長さになるように末尾に「0」を付加する。
   * @param value 値
   * @param length 長さ
   * @return {String} 指定された長さの値
   */
  function addZero(value, length) {
    var i,
        ret = value;
    for (i = ret.length; i < length; i += 1) {
      ret += "0";
    }
    return ret;
  }

  /**
   * 指定した値が数値か否か。
   * @param value 値
   * @return {Boolean} 数値の場合は、true
   */
  function isNumber(value) {
    if (value === undefined) {
      return false;
    }
    if (value.toString().length === 0) {
      return false;
    }
    return !isNaN(value);
  }
});

