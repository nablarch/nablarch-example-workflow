/**
 * タブウィジェットのエミューレーションを行う。
 * 
 * JSPタグ `<tab:xxx>` は下記のタグファイルにより描画される。  
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/tab/xxx.tag
 * 
 * <tab:group>タグのname属性、<tab:content>タグのvalue属性は値は
 * 自動的に採番するため、設計段階で指定する必要はない。
 * (これらの属性を明示的に指定した場合、ローカル動作においては単に無視される。)
 * 
 * 
 * @module jsp.taglib
 * @class jsp.taglib.tab
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  var tabGroupSeq = 0;
  return function($tagBody, context, tagName, _context) {
    var tabSeq = 0
      , selected = $(this).jsp_attrs().selected;
    if (tagName === 'group') {
      $(this).attr('name', 'tabgroup_' + (tabGroupSeq++));
    }
    $tagBody.filter('div[data-jsp="tab:content"]').each(function() {
      $(this).attr('value', 'tab_' + tabGroupSeq + '_' + (tabSeq++));
    });

    context.selected = selected === 'true';

    return $.loadTagfile.apply(
      this, ['../WEB-INF/tags/widget/tab/', $tagBody, context, tagName, _context]
    );
  };
});
