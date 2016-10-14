/**
 * テーブルカラムウィジェットのエミューレーションを行う。
 *
 * JSPタグ `<column:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/column/xxx.tag
 *
 * 各レコードには、各columnタグのsample属性に設定された値を表示する。
 * この際、sample属性に縦棒("|")で区切られた複数の値を指定することで、
 * それらの値を各レコードに順次表示することができる。
 * (sampleに指定した値のよりレコード件数が多い場合は最初の値からループする。)
 *
 * @module jsp.taglib
 * @class jsp.taglib.column
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  return function($tagBody, context, tagName, _context) {
    var attrs     = $(this).jsp_attrs(context)
      , sample    = attrs.sample && attrs.sample.split('|')
      , separator = attrs.sampleseparator
      , status    = context.nablarch_status;

    if (sample && status) {
      context.value = sample[status.index % sample.length];
      context.sample = separator
                     ? context.value.split(separator)
                     : context.value;
    }

    if (attrs.width) {
      // IE対策。指定されたwidth属性の値を退避する。
      // ここで退避したwidth属性は、html.jsで使用する
      context.css = {'width': attrs.width};
    }
    if (tagName === "code") {
      context.samplepattern = attrs.samplepattern;
    }

    return $.loadTagfile.apply(
      this, ['../WEB-INF/tags/widget/column/', $tagBody, context, tagName, _context]
    );
  };
});
