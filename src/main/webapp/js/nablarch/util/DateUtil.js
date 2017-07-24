/**
 * @module nablarch.util
 */
define(["./SimpleDateFormat", "sugar"], function(SimpleDateFormat) { "use strict";
  /**
   * 日付関連ユーティリティ関数
   * ---------------------------
   * 
   * 本モジュールでは日付の文字列表現と日付データ型(Date)との間の対応を定義する
   * 関数を提供する。
   * 
   * フォーマット定義はJavaの標準ライブラリであるSimpleDateFormatに沿った書式で指定する。
   *
   * @class nablarch.util.DateUtil
   * @author Iwauo Tajima
   * @since  1.2
   */
  return {
    /**
     * 日付の文字列表現を日付型に変換する。
     * 
     * @method parse
     * @param dateStr {String} 日付の文字列表現
     * @param format  {String} 日付のフォーマット定義
     * @return {Date} 日付データ型
     */
    parse: DateUtil_parse
    /**
     * 与えられた日付の文字列表現を取得する。
     * 
     * @method format
     * @param date   {Date}   日付のデータ型
     * @param format {String} 日付のフォーマット定義
     * @return {String} 日付の文字列表現
     */  
  , format: DateUtil_format
  };
    

  function DateUtil_parse(dateStr, format) {
    return new SimpleDateFormat(format).parse(dateStr);
  }
  
  function DateUtil_format(date, format, locale) {
    return new SimpleDateFormat(format).format(date, locale);
  }
 
});

