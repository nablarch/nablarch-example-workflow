/**
 * テーブルウィジェット(`<table:xxx>`)のエミューレーションを行う。
 *
 * ウィジェットの`sampleResults`属性値に指定した件数分だけ、
 * ダミーのレコード(空配列)を作成してコンテキストに詰める。
 * 各レコードの内容は、`<column:xxx>`ウィジェットのsample属性の内容が表示される。
 *
 * @module jsp.taglib
 * @class jsp.taglib.table
 * @author Iwauo Tajima
 */
define(['jsp', 'nablarch/ui/Widget', 'nablarch/ui/TreeList', 'sugar'],
function($, Widget, TreeList) { 'use strict';
  $(document).on('jsp_processed', function() {
    $('.' + TreeList.widgetType).widgets(TreeList).each(function(){this.render()});
  });

  return function($tagBody, context, tagName, _context) {
    var attrs    = $(this).jsp_attrs(context)
      , rowNum   = Number(attrs.sampleresults) || 0
      , infoName = attrs.listsearchinfoname || 'listsearchinfo'
      , rowsName = attrs.resultsetname
      , numName  = attrs.resultnumname
      , rows     = []
      , cols     = $tagBody.filter("div[data-jsp^='column']")
                  .add($tagBody.find("div[data-jsp^='column']"))
                  .map(function(){return $(this).jsp_attrs(context)})
                  .get()
      , i, col, len;

    if (!rowsName && !numName) {
      rowsName = 'sampleresult';
    }

    // 件数情報(listSearchInfo)のダミーデータ
    context.setVar('listsearchinfoname', infoName);
    context.setVar(infoName + '.resultCount', rowNum);
    context.setVar(infoName + '.pageNumber', 1);
    context.setVar(infoName + '.pageCount', 1);
    context.setVar(infoName + '.startPosition', 1);
    context.setVar('resultcount', rowNum);

    // 検索結果(resultSet/resultNum)のダミーデータ
    context.setVar('resultsetname', rowsName);
    context.setVar('resultnumname', numName);

    for (i = 0, len = rowNum; i < len; i++) {
      row = {};
      cols.each(function(col) {
        if (!col.sample) return;
        var key    = (col.key || '').toLowerCase()
          , sample = (col.sample) ? col.sample.split('|') : []
          , val    = (sample.length) ? sample[i % sample.length] : '';
        row[key] = val;
      });
      rows.push(row);
    }
    rowsName && context.setVar(rowsName, rows);
    numName  && context.setVar(numName, rowNum);

    return $.loadTagfile.apply(
      this, ['../WEB-INF/tags/widget/table/', $tagBody, context, tagName, _context]
    );
  };
});
