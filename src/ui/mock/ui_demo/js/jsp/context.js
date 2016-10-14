define(['sugar'],function() {
var c = Object.create({setVar: setVar, getVar: getVar}), FW="nablarch_"; Object.each({"":""
, projectName                : 'Nablarchチュートリアル'
, systemName                 : 'ユーザ情報管理システム'
, commonHeaderLoginUserName  : '田嶋 岩魚'
, commonHeaderLoginDate      : '2013/6/13'
, sortSubmitTag              : 'submitLink'
, sortSubmitType             : ''
, sortSubmitCss              : FW+'sort'
, ascSortSubmitCss           : FW+'asc'
, descSortSubmitCss          : FW+'desc'
, defaultSort                : 'asc'
, deleteUserCount            : '5'    // ユーザ情報一括削除完了(削除件数)
, recordCount                : '10'   // ユーザ一括登録(登録件数)
, resultCount                : '1'   // ユーザ一覧照会(検索結果件数)
, nablarch_confirmationpage  : Object.fromQueryString(document.location, true)[FW+'confirmationPage']
, nablarch_spec_layout       : Object.fromQueryString(document.location, true)[FW+'spec_layout']
, nablarch_spec_conditions   : Object.fromQueryString(document.location, true)[FW+'spec_conditions']
/*
 * 下記は削除すべきプロパティだが、
 * local rendering 時の問題のため残す。
 * これを残さないとlocal rendering と server 動作で出力される要素が変わってしまう。
 * serverとlocalで同様に動かす場合は演算の優先度も考慮して下記のように実装しないといけない。
 * e.g.
 *   ((useResultCount == true) || (useResultCount == 'true'))
 */
, useResultCount             : 'true'
, usePaging                  : 'true'
, usePrevSubmit              : 'true'
, useNextSubmit              : 'true'
, useCurrentPageNumber       : 'true'
, usePageNumberSubmit        : 'false'
, useFirstSubmit             : 'false'
, useLastSubmit              : 'false'

}, function(k,v) {c[k.toLowerCase()] = v;});
return c;

//--------- functions for managing the variables in context --------//
function setVar(name, value) {
  var target = this
    , i, len, key, next;

  name = name && name.toLowerCase().split('.');
  for (i = 0, len = name.length; i < len; i++) {
    var key = name[i];
    if (i === len-1) {
      target[key] = value;
    }
    else {
      next = target[key];
      if (next === null || typeof next === 'undefined') {
        next = target[key] = {};
      }
      target = next;
    }
  }
}

function getVar(name) {
  var target = this
    , i, len, key;

  if (key === 'disabled') return this.__disabled;

  name = name && name.toLowerCase().split('.');
  for (i = 0, len = name.length; i < len; i++) {
    var key = name[i];
    if (i === len-1) {
      return target[key];
    }
    else {
      target = target[key];
      if (target === null || typeof target === 'undefined') {
        return target;
      }
    }
  }
}

});

