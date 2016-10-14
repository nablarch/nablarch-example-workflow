/**
 * テンプレートウィジェット(`<template:xxx>`)のエミュレーションを行う。
 *
 * JSPタグ `<t:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/template/xxx.tag
 *
 * @module jsp.taglib
 * @class jsp.taglib.template
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  return function($tagBody, context, tagName, _context) {
    if (tagName === 'errorpage_template') {
      context.trackingnumber = Date.create().format('{yyyy}{MM}{dd}{HH}{mm}{ss}{fff}') + (Number.random(1000, 9999)+'');
    }
    if (tagName === 'ui_test_template') {
      context.__jsp_load_base_path = 'tools/ui_test/jsp/' + encodeURI(context.suite) + '/'; // encodeURI for IE8,9 bug
    }
    return $.loadTagfile.apply(
      this, ['../WEB-INF/tags/template/', $tagBody, context, tagName, _context]
    );
  };
});
