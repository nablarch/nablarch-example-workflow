/**
 * ユーティリティ関数など
 * 
 * @module nablarch.util 
 * @author Iwauo Tajima
 */
define(function() {

  return {
    error : error
  };
 
  /**
   * 指定されたメッセージにより、例外を送出する。
   * 
   * @param {String} 例外メッセージ
   */ 
  function error(message) {
    message = message + '\n' + (new Error().stack || ""); 
    throw new Error(message);
  }
});
