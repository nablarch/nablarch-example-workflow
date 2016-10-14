/**
 * JSTLタグライブラリ標準の組み込み関数(`<fn:xxx>`)のエミューレーションを行う。
 *
 * @module jsp.taglib
 * @class jsp.taglib.function
 * @author Iwauo Tajima
 */
define(['sugar'],
function($) { 'use strict';
  return {
    /**
     * `fn:contains()` 関数のエミュレーションを行う。
     * Tests if an input string contains the specified substring.
     * @method contains
     */
    contains: function_contains
    /**
     * `fn:containsIgnoreCase()` 関数のエミュレーションを行う。
     * Tests if an input string contains the specified substring in a case insensitive way.
     * @method containsIgnoreCase
     */
  , containsIgnoreCase: function_containsIgnoreCase
    /**
     * `fn:startsWith()` 関数のエミュレーションを行う。
     * Tests if an input string starts with the specified prefix.
     * @method startsWith
     */
  , startsWith: function_startsWith

    /**
     * `fn:endsWith()` 関数のエミュレーションを行う。
     * Tests if an input string ends with the specified suffix.
     * @method endsWith
     */
  , endsWith: function_endsWith
    /**
     * `fn:escapeXml()` 関数のエミュレーションを行う。
     * Escapes characters that could be interpreted as XML markup.
     * @method escapeXml
     */
  , escapeXml: function_escapeXml
    /**
     * `fn:indexOf()` 関数のエミュレーションを行う。
     * Returns the index withing a string of the first occurrence of a specified substring.
     * @method indexOf
     */
  , indexOf: function_indexOf
    /**
     * `fn:join()` 関数のエミュレーションを行う。
     * Joins all elements of an array into a string.
     * @method join
     */
  , join: function_join
    /**
     * `fn:length()` 関数のエミュレーションを行う。
     * Returns the number of items in a collection, or the number of characters in a string.
     * @method length
     */
  , length: function_length
    /**
     * `fn:replace()` 関数のエミュレーションを行う。
     * Returns a string resulting from replacing in an input string all occurrences
     * of a "before" string into an "after" substring.
     * @method replace
     */
  , replace: function_replace
    /**
     * `fn:split()` 関数のエミュレーションを行う。
     * Splits a string into an array of substrings.
     * @method split
     */
  , split: function_split
    /**
     * `fn:substring()` 関数のエミュレーションを行う。
     * Returns a subset of a string.
     * @method substring
     */
  , substring: function_substring
    /**
     * `fn:substringAfter()` 関数のエミュレーションを行う。
     * Returns a subset of a string following a specific substring.
     * @method substringAfter
     */
  , substringAfter: function_substringAfter
    /**
     * `fn:substringBefore()` 関数のエミュレーションを行う。
     * Returns a subset of a string before a specific substring.
     * @method substringBefore
     */
  , substringBefore: function_substringBefore
    /**
     * `fn:toLowerCase()` 関数のエミュレーションを行う。
     * Converts all of the characters of a string to lower case.
     * @method toLowerCase
     */
  , toLowerCase: function_toLowerCase
    /**
     * `fn:toUpperCase()` 関数のエミュレーションを行う。
     * Converts all of the characters of a string to upper case.
     * @method toUpperCase
     */
  , toUpperCase: function_toUpperCase
    /**
     * `fn:trim()` 関数のエミュレーションを行う。
     * Removes white spaces from both ends of a string.
     * @method trim
     */
  , trim: function_trim

  };

  function function_trim(text) {
    return (text || "").trim();
  }

  function function_toLowerCase(text) {
    return (text || "").toLowerCase();
  }

  function function_toUpperCase(text) {
    return (text || "").toUpperCase();
  }

  function function_substringBefore(text, pattern) {
    text = text || "";
    var pos = text.indexOf(pattern);
    return (pos === -1) ? ''
                        : text.substring(0, pos);
  }

  function function_substringAfter(text, pattern) {
    text = text || "";
    var pos = text.indexOf(pattern);
    return (pos === -1) ? ''
                        : text.substring(pos+1, text.length);
  }

  function function_substring(text, start, end) {
    text = text || "";
    return (end === -1) ? text.substring(start)
                        : text.substring(start, end);
  }

  function function_split(text, separator) {
    text = text || "";
    if (!separator) return text;
    return text.split(separator);
  }

  function function_replace(text, pattern, replacement) {
    text = text || "";
    pattern = new RegExp(RegExp.escape(pattern || ""), 'g');
    replacement = replacement || "";
    return text.replace(pattern, replacement);
  }

  function function_length(obj) {
    obj = obj || "";
    return obj.length + "";
  }

  function function_join(arr, separator) {
    arr = arr || [];
    separator = separator || "";
    return arr.join(separator);
  }

  function function_indexOf(str, substr) {
    str    = str || "";
    substr = substr || "";
    return str.indexOf(substr) + '';
  }

  function function_contains(str, substr) {
    str    = str || "";
    substr = substr || "";
    return str.indexOf(substr) >= 0;
  }

  function function_containsIgnoreCase(str, substr) {
    str    = str || "";
    substr = substr || "";
    return str.toLowerCase().indexOf(substr.toLowerCase()) >= 0;
  }

  function function_startsWith(str, prefix) {
    str = str || "";
    prefix = prefix || "";
    return str.startsWith(prefix);
  }

  function function_endsWith(str, suffix) {
    str = str || "";
    suffix = suffix || "";
    return str.endsWith(suffix);
  }

  function function_escapeXml(str) {
    str = str || "";
    return str; // テキストノード化するので明示的なエスケープは不要。
  }
});


