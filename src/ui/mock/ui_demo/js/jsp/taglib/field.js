/**
 * フィールドウィジェットのエミューレーションを行う。
 * 
 * JSPタグ `<field:xxx>` は下記のタグファイルにより描画される。  
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/field/xxx.tag
 * 
 * @module jsp.taglib
 * @class jsp.taglib.column
 * @author Iwauo Tajima 
 */
define(['jsp', 'sugar'],
function($) { 'use strict'; 
return function($tagBody, context, tagName, _context) {
  var attrs = $(this).jsp_attrs(context)
    , sample = attrs.sample
    , separator = attrs.sampleseparator;
    
  if (sample && separator) {
    context.setVar('sample', sample.split(separator));
  }
  if (tagName === 'listbuilder') {
    context.setVar(attrs.name, ['']);
  }
  if (tagName === 'label' || tagName === 'text') {
    context.setVar(attrs.name, attrs.sample);
  }
  if (tagName === 'label_id_value' && attrs.sample) {
    context.setVar("idName",    "__sample_id");
    context.setVar("valueName", "__sample_value");
    context.setVar("__sample_id",    attrs.sample.split(':')[0] || '');
    context.setVar("__sample_value", attrs.sample.split(':')[1] || '');
  }
  
  return $.loadTagfile.apply(
    this, ['../WEB-INF/tags/widget/field/', $tagBody, context, tagName, _context]
  );
};});
