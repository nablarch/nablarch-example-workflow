/**
 * 設計書表示用タグ
 * @author Iwauo Tajima
 */

define(['jsp', 'sugar'],
function($) { 'use strict';
  window.spec_nodeRefs = {};
  return {
    author      : noop
  , updated_by  : noop
  , created_date: noop
  , updated_date: noop
  , condition   : noop
  , layout      : doLayoutTag
  , validation  : noop
  , desc        : noop
  };

  function noop(b, c, tagName) {
    $(this).jsp_verify('../WEB-INF/tags/widget/spec/', tagName);
    $(this).remove();
  };

  function doLayoutTag($tagBody, context, tagName) {
    var layout = context.getVar('nablarch_spec_layout') || ''
      , thisLayout = $(this).attr('name');

    $(this).jsp_verify('../WEB-INF/tags/widget/spec/', tagName);

    window.spec_nodeRefs[thisLayout] = $tagBody;

    if (!layout || layout.indexOf(context.getVar('name')) !== -1) {
      return $tagBody;
    }
    else {
      $(this).remove();
    }
  }
});

