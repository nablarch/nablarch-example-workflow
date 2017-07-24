/**
 * @module nablarch.util
 */
define(['sugar'],
function() { 'use strict';
  /**
   * 簡易汎用パーサー
   * ---------------------
   * 
   * @class nablarch.util.Consumer
   * @author Iwauo Tajima
   * @since 1.3
   */
  Consumer.prototype = {
    /**
     * コンストラクタ関数
     * @mehtod Consumer
     * @constructor
     */
    constructor: Consumer
    /**
     * 解析対象文字列
     * @property source
     * @type String
     */
  , source: null
    /**
     * 現在位置
     * @property head
     * @type Number
     */
  , head: 0
    /**
     * コンテキスト変数
     * @property data
     * @type Object
     */
  , data: null
    /**
     * 現在位置を起点として指定された正規表現にマッチする文字列を読み進める。
     * @method consume
     * @param {String} パターン文字列
     * @return {Array|null} マッチ結果(マッチに失敗した場合は`null` 
     */
  , consume: Consumer_consume
    /**
     * 解析対象文字列の終端に到達したかどうかを返す。
     * 
     * @method eof
     * @return {Boolean} 終端に到達していれば`true`、そうでなければ`false`。
     */
  , eof: Consumer_eof
    /**
     * 構文ルールを表す関数を"アトミックに"実行する。
     * 
     * 引数として渡された構文ルールを、このオブジェクト自体を引数として実行し、
     * その結果が偽とみなせる値であった場合は、読み込み起点をルール実行前の状態に戻す。  
     * 
     * この関数の戻り値として、構文ルールの戻り値をそのまま返す。
     * 
     * @method once
     * @param {Function} rule 構文ルール関数
     * @return {Anything} 構文ルールの実行結果
     */
  , once: Consumer_once
    /**
     * 構文ルールを表す関数を複数回実行する。
     * 
     * 引数として渡された構文ルールを、このオブジェクト自体を引数として実行する。
     * その結果が偽とみなせる値であった場合は、読み込み起点をルール実行前の状態に戻した上で
     * `null` を返す。  
     * 
     * そうでない場合は、構文ルールの戻り値が偽とみなせる値を返却するまで繰り返し実行する。
     * この際、最後に構文ルールを実行する直前の位置に起点を戻し、
     * 各実行時の結果の配列をこの関数の戻り値として返却する。  
     * (ただし、最後の結果はこの配列に含まれない。)
     * 
     * @metod some
     * @param {Function} rule 構文ルール関数
     * @return {Array|null} 構文ルールの各実行結果を収めた配列。(初回実行に失敗した場合は`null`)
     */
  , some: Consumer_some
    /**
     * このオブジェクトの文字列表現を返却する。(デバッグ用)
     * 
     * @method toString
     * @return {String} このオブジェクトの文字列表現
     */
  , toString: Consumer_toString
  };

  Consumer.Error = Consumer_Error;

  function Consumer(source) {
    this.source = source;
    this.data   = {};
  }

  function Consumer_consume(pattern) {
    pattern = new RegExp('^[\\s\\S]{'+this.head+'}(\\s*(?:'+pattern+')\\s*)');
    var match = pattern.exec(this.source);
    if (match) {
      this.head += match[1].length;
      match = [].slice.call(match, 1);
    }
//console.log(pattern, !!(match), this.source.slice(this.head, this.head + 20))
    return match;
  }

  function Consumer_toString() {
    return 'head: ' + this.head + ' [[' + this.source.slice(this.head, this.head + 20) + ']]';
  }

  function Consumer_eof() {
    return (this.head == this.source.length) && this.head++;
  }

  function Consumer_once(rule) {
    var savepoint = this.head
      , result    = rule.apply(null, [this]);
    if (!result) this.head = savepoint;
    return result;
  }

  function Consumer_some(rule) {
    var result = this.once(rule)
      , results;
    if (!result) return result;
    results = [result];
    while (result = this.once(rule)) {
      results.push(result);
    }
    return results;
  }

  function Consumer_Error(c, rule) {
    this.name = 'Consumer.Error';
    this.message = rule.name;
  }
  Consumer_Error.prototype = new Error();

  return Consumer;
});

