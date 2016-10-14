/**
 * 一覧検索画面表示用タグ `<listSearchResult:xxx>` タグのエミュレーションを行う。
 *
 * `js/jsp/tagfile` 配下に存在するタグファイルをロードする。
 * 
 * @module jsp.taglib
 * @class  jsp.taglib.listsearchresult
 * @author Iwauo Tajima
 */
define(['jsp', 'sugar'],
function($) { 'use strict'; 
  var path = '../WEB-INF/tags/listSearchResult/';
  return {
    /**
     * `<listSearchResult:listSearchPaging>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchPaging.tag` の内容を展開する。
     *
     * @method listsearchpaging
     */
    listsearchpaging: $.loadTagfile.fill(path, undefined, undefined, 'listSearchPaging')
    /**
     * `<listSearchResult:listSearchParam>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchParam.tag` の内容を展開する。
     *
     * @method listsearchparam
     */
  , listsearchparam: $.loadTagfile.fill(path, undefined, undefined, 'listSearchParam')
    /**
     * `<listSearchResult:listSearchParams>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchParams.tag` の内容を展開する。
     *
     * @method listsearchparams
     */
  , listsearchparams: $.loadTagfile.fill(path, undefined, undefined, 'listSearchParams')
    /**
     * `<listSearchResult:listSearchResult>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchResult.tag` の内容を展開する。
     *
     * @method listsearchresult
     */
  , listsearchresult: $.loadTagfile.fill(path, undefined, undefined, 'listSearchResult')
    /**
     * `<listSearchResult:listSearchSortSubmit>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchSortSubmit.tag` の内容を展開する。
     *
     * @method listsearchsortsubmit
     */
  , listsearchsortsubmit: $.loadTagfile.fill(path, undefined, undefined, 'listSearchSortSubmit')
    /**
     * `<listSearchResult:listSearchSubmit>`タグのエミュレーションを行う。
     * 
     * タグファイル `listSearchSubmit.tag` の内容を展開する。
     *
     * @method listsearchsubmit
     */
  , listsearchsubmit: $.loadTagfile.fill(path, undefined, undefined, 'listSearchSubmit')
    /**
     * `<n:table>`タグのエミュレーションを行う。
     * 
     * タグファイル `table.tag` の内容を展開する。
     *
     * @method table
     */  
  , table: $.loadTagfile.fill(path, undefined, undefined, 'table')
  };
});