/**
 * @module jsp
 * @author Iwauo Tajima
 */
define(['nablarch/util/Consumer', 'jsp/taglib/function', 'sugar'],
function(Consumer, jstlFunctions) { 'use strict';
  var identifireFragment = "[_$a-zA-Z][_0-9a-zA-Z]*";

  return el_interpolate;

  /**
   * EL式の簡易パーサー
   *
   * 渡された文字列について、文字列中の `${...}` 形式で埋め込まれたel式を
   * 展開した結果の文字列を返す。
   *
   * @method el
   * @for jsp
   * @static
   * @param {String} str 評価対象文字列
   * @param {Object} [context] コンテキスト変数を格納したオブジェクト
   * @return {String} 評価結果文字列
   */
  function el_interpolate(str, context) {
    var m = /^\$\{([^}]*)\}$/.exec(str)
      , v;

    if (m) {
      v = el_eval(m[1], context);
    }
    else {
      v = str.replace(/\$\{([^}]*)\}/g, function(_, expr) {
        var v = el_eval(expr, context);
        return (typeof v === 'undefined' || v === null) ? ''
             : (v === false)                            ? 'false'
                                                        : v;
      });
    }
    return v;
  }

  /**
   * EL式を評価する。
   */
  function el_eval(expr, context) {
    var c = new Consumer(expr)
      , v;
    c.data = context;
    v = expression(c);
    return v[0];
  }

  /**
   * 式
   */
  function expression(c) {
    return c.once(ternaryExpression)
        || c.once(bareExpression);
  }

  function bareExpression(c) {
    return c.once(binaryExpresstion)
        || c.once(term);
  }

  /**
   * 2項演算式
   */
  function binaryExpresstion(c) {
    var op, v1, v2;
    return (v1 = term(c))
        && (op = binaryOp(c))
        && (v2 = term(c))
        && op.fill(v1[0], v2[0]).call(c);
  }

  /**
   * 3項演算式
   */
  function ternaryExpression(c) {
    var cond, branch1, branch2;
    return (cond = bareExpression(c))
        && c.consume('\\?')
        && (branch1 = expression(c))
        && c.consume('\\:')
        && (branch2 = expression(c))
        && !!cond[0] ? branch1 : branch2;
  }

  /**
   * 項
   */
  function term(c) {
    return c.once(expressionValue)
        || c.once(unaryExpression)
        || c.once(literal)
        || c.once(value);
  }

  /**
   * 単項演算
   */
  function unaryExpression(c) {
    var op, v;
    return (op = unaryOp(c))
        && (v = term(c))
        && op.fill(v[0]).call(c);
  }

  /**
   * 式を括弧でくくって項にする。
   */
  function expressionValue(c) {
    var v;
    return c.consume('\\(')
        && (v = expression(c))
        && c.consume('\\)')
        && v;
  }

  /**
   * 単項演算子
   */
  function unaryOp(c) {
    return c.consume('-')     && function(a) { return [-1 * a] }
        || c.consume('!|not') && function(a) { return [!a]     }
        || c.consume('empty') && function(a) {
             return (a && a.hasOwnProperty('length')) ? [a.length == 0]
                                                      : [!a];
           };
  }

  /**
   * 2項演算子
   */
  function binaryOp(c) {
    return c.consume('\\&\\&|and') && function(a,b) { return [a && b] }
        || c.consume('\\|\\||or')  && function(a,b) { return [a || b] }
        || c.consume('\\+')        && function(a,b) { return [a + b]  }
        || c.consume('\\-')        && function(a,b) { return [a - b]  }
        || c.consume('\\*')        && function(a,b) { return [a * b]  }
        || c.consume('\\/|div')    && function(a,b) { return [a / b]  }
        || c.consume('%|mod')      && function(a,b) { return [a % b]  }
        || c.consume('>|gt')       && function(a,b) { return [a > b]  }
        || c.consume('<|lt')       && function(a,b) { return [a < b]  }
        || c.consume('>=|ge')      && function(a,b) { return [a >= b] }
        || c.consume('<=|le')      && function(a,b) { return [a <= b] }
        || c.consume('==|eq')      && function(a,b) { return [a == b] }
        || c.consume('!=|ne')      && function(a,b) { return [a != b] };
  }

  /**
   * 変数
   */
  function value(c) {
    var key, val;
    return (val = c.once(functionInvocation)) && val
        || (key = c.once(identifier))         && resolve(c, key);
  }

  /**
   * 識別子
   */
  function identifier(c) {
    var m;
    return !reserved(c)
        && (m = c.consume(identifireFragment + '(\\.' + identifireFragment + ')*'))
        && m[0].trim();
  }

  /**
   * 関数呼び出し
   */
  function functionInvocation(c) {
    var m, fname, args, func;
    return !reserved(c)
        && (m = c.consume(identifireFragment + '\\:(' + identifireFragment + ')\\('))
        && (fname = m[1])
        && (args = functionArguments(c))
        && c.consume('\\)')
        && (func = jstlFunctions[fname])
        && [func.apply(c, args)];
  }

  function functionArguments(c) {
    var args = []
      , arg  = c.once(expression);
    if (!arg) {
      return [];
    }
    args = c.some(additionalArg);
    if (args) {
      args.unshift(arg[0]);
    }
    else {
      args = [arg[0]];
    }
    return args;
  }

  function additionalArg(c) {
    var arg;
    return c.consume(',')
        && (arg = expression(c))
        && arg[0];
  }

  /**
   * 予約語
   */
  function reserved(c) {
    return c.consume([
      'and', 'or', 'not', 'eq', 'ne', 'lt', 'gt', 'le', 'ge'
    , 'true', 'false', 'null', 'instanceof', 'empty', 'mod'
    ].join(' |'));
  }

  /**
   * コンテキスト変数の値解決を行う。
   */
  function resolve(c, key) {
    var value = c.data.getVar(key);
    return [value];
  }

  /**
   * リテラル値
   */
  function literal(c) {
    return c.once(booleanLiteral)
        || c.once(numberLiteral)
        || c.once(stringLiteral)
        || c.once(nullLiteral);
  }

  /**
   * 真偽値リテラル
   */
  function booleanLiteral(c)  {
    return c.consume('true')  && [true]
        || c.consume('false') && [false];
  }

  /**
   * 数値リテラル
   */
  function numberLiteral(c) {
    var m;
    return (m = c.consume('[0-9]+(\\.[0-9]+)?([eE][-+]?[0-9]+)?')) && [Number(m[0])];
  }

  /**
   * 文字列リテラル
   */
  function stringLiteral(c) {
    var m;
    // IE8 bug. Two RegExp bugs in Internet Explorer 8
    // http://blogs.perl.org/users/mauke/2010/11/two-regexp-bugs-in-internet-explorer-8.html
    return (m = c.consume('\"([^\"]*)\"')) && [m[1]]
        || (m = c.consume("\'([^\']*)\'")) && [m[1]];
  }

  /**
   * nullリテラル
   */
  function nullLiteral(c) {
    return c.consume('null') && [null];
  }
});
