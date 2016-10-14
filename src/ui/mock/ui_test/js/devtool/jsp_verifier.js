define(['jquery', 'sugar'],
function($){

  return {
    verify : verify
  };
  // ------------------------
  function verify(moduleName, $tag) {
    if (isUnsupported()) return; //  IE8で精査すると必ずエラーになってしまう。
    var meta = $.jsp.meta[moduleName];
    verifyAllRequiredAttributesAreAssigned(meta, $tag);
    verifyAllAttributesAreConfirmedByTLD(meta, $tag);
    verifyAllAttributesNeededForSpecSheetAreAssined(meta, $tag);
//    verifyAllFieldsAreIncludedInALayout(meta, $tag);
  }

  /**
   * ローカルレンダリングをサポートするブラウザのうち
   * 精査機能をサポートできるブラウザかどうか判定する。
   * ローカルレンダリング時にはIE8で開いた場合に、互換表示モードで動作し、
   * IE7になることがあるので、userAgentがIE7を示す場合もサポート対象外にする。
   */
  function isUnsupported() {
    var userAgent = navigator && navigator.userAgent || "";
    return !!userAgent.match(/msie\s*[78]/i);
  }

  function verifyAllFieldsAreIncludedInALayout(meta, $tag) {
    var tagName = $tag.attr('data-jsp');
    if (!tagName.match(/^(column:|field:)/)) return;
    if (tagName === 'field:block') return;

    if(!$tag.closest('[data-jsp="spec:layout"]').length) {
      $tag.jsp_addError(
        '設計書画面上に項目を表示するには<'
      + $tag.attr('data-jsp')
      + '>タグを<spec:layout>タグ内に記述する必要があります。'
      );
    }
  }

  function verifyAllRequiredAttributesAreAssigned(meta, $tag) {
    Object.each(meta.attributes, function(attrName, attrSpec) {
      if (!attrSpec.description) {
        return;
      }
      if (attrSpec.description.has('[ローカル表示必須]') && !$tag.attr(attrName)) {
        $tag.jsp_addError(
          'プレビュー画面を表示するために<' + $tag.attr('data-jsp') + '>タグには' + attrName + '属性が必要です。'
        );
      }
    });
  }

  function verifyAllAttributesNeededForSpecSheetAreAssined(meta, $tag) {
    Object.each(meta.attributes, function(attrName, attrSpec) {
      if (!attrSpec.description) {
        return;
      }
      if (attrSpec.description.has('[設計書表示必須]') && !$tag.attr(attrName)) {
        $tag.jsp_addError(
          '設計書ビューを表示するために<' + $tag.attr('data-jsp') + '>タグには' + attrName + '属性が必要です。'
        );
      }
    });
  }

  function verifyAllAttributesAreConfirmedByTLD(meta, $tag) {
    var attrs = $tag[0].attributes
      , attr, name , i, len;
    for (i=0, len=attrs.length; i < len; i++) {
      attr = attrs[i]; name = attr.nodeName;
      if (name.startsWith('data-') || name.startsWith('_')) continue;
      if (!(name.toLowerCase() in meta.attributes)) {
        $tag.jsp_addError( '<' + $tag.attr('data-jsp') + '>タグに' + name + '属性は使用できません。' );
        return false;
      }
    }
  }

});