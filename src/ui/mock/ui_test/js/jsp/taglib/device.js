/**
 * デバイスウィジェットのエミューレーションを行う。
 *
 * JSPタグ `<device:xxx>` は下記のタグファイルにより描画される。
 *
 *     (サーブレットコンテキスト)/WEB-INF/tags/widget/device/xxx.tag
 *
 * @module jsp.taglib
 * @class jsp.taglib.device
 * @author tani takanori
 */
define(['jsp', 'sugar'],
function($) { 'use strict';
  var p      = new RegExp("(windows|mac os x)[\\D]*([\\d\\.]*).+(firefox|chrome|msie|trident)[/\\s]([\\d\\.]*)", 'i')
    , group  = p.exec(navigator.userAgent.toLowerCase())
    , type     = (group && group[1] || "").replace(" ", "_")
    , typevers = (group && group[2] || "").split(/\D/)
    , browser  = (group && group[3] || "")
    , browservers = (group && group[4] || "").split(/\D/)
    , path   = '../WEB-INF/tags/device/';

  if (browser == "msie") {
    browser = "ie";
  }

  if (browser == "trident") {
    browservers[0] = browservers[0] ? (browservers[0].toNumber() + 4) + ""
                                    : browservers[0];
    browser = "ie";
  }

  return {
      script : $.loadTagfile.fill(path, undefined, undefined, undefined)
    , set    : doSetTag
    , media  : $.loadTagfile.fill(path, undefined, undefined, undefined)
  };

  /**
   * グローバルコンテキストに値を設定する。
   * 内部の実装(n:set)はtagBodyでは行わないので、明示的にfalseをreturnする。
   */
  function doSetTag($tagBody, context, tagName, _context) {
    var deviceVersion = verExpr(typevers, "-")
      , browserVersion = verExpr(browservers, "_");

    _context.setVar("nablarch_deviceType",     type);
    _context.setVar("nablarch_deviceVersion",  deviceVersion);
    _context.setVar("nablarch_browserType",    browser);
    _context.setVar("nablarch_browserVersion", browserVersion);
    $('body').addClass([type, deviceVersion, browser, browserVersion].join(' '));
    $tagBody.remove();
  }

  function verExpr(vers, sep) {
    var formated = "";
    (0).upto(2, function(i) {
      formated = formated.add(sep.repeat(i+1) + (vers[i] || "") + " ");
    });
    return formated.trim();
  }
});
