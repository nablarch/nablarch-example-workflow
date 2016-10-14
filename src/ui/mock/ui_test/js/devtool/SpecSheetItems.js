/**
 * 設計情報をJSPから取得する拡張機能。(jQueryの拡張プラグインとして提供する。)
 *
 * 画面設計書ViewやForm自動生成機能など
 * レンダリングしたJSPの値を取得、変換する際に本拡張機能が利用できる。
 *
 */
define([
  'jquery'
, 'jsp/context'
, 'devtool/resource'
, 'devtool/resource/コード値定義'
, 'devtool/resource/DB項目定義'
, 'devtool/resource/外部インターフェース設計'
, 'sugar'],
function($, context, resource, codeDef, dbDef, interfaceDef) { "use strict";

  /** スタイル定義 */
  var errorStyle = {color:'red'}
    , linkStyle  = {color:'blue', 'text-decoration':'underline', cursor:'pointer'}
    , infoStyle  = {color:'blue'};

  /**
   * 排他制御対象を取得する。
   */
  $.fn.spec_lockTarget = function() {
    return getTableName(this, 'lockTarget');
  };

  /**
   * selectorに一致するjspタグの一覧を取得する。
   */
  $.findJspTag = function(selector, c) {
    var s  = selector.split(/\s+/)
            .map(function(t){
               return 'div[data-jsp*="'+t+'"]';
             }).join(', ')
      , $c = (c ? $(c) : this)
      /* 設計情報の対象としないタグの一覧。 */
      , blackList = ['field:block', 'field:hint', 'button:block'];
    return $c.find(s).addBack().filter(s).filter(function() {
      return blackList.none($(this).jsp_tagName());
    });
  };

  /**
   * 二重サブミット防止。
   */
  $.fn.spec_blocksDoubleSubmit = function() {
    var tagName = this.jsp_tagName()
      , allowed = this.spec_attr('allowDoubleSubmission');

    if (tagName === 'button:confirm') {
      return (allowed === 'true') ? '' : '◯';
    }
    return (allowed === 'false') ? '◯' : '';
  };

  /**
   * 画面項目の出力条件。
   */
  $.fn.spec_appearsWhen = function() {
    var $tag = this
      , confirmationPageOnly = $tag.closest('[data-jsp="n:forconfirmationpage"]').length > 0
      , inputPageOnly = $tag.closest('[data-jsp="n:forinputpage"]').length > 0
      , $conditionUnder = $tag.closest('[data-jsp="c:if"]')
      , fragment;

    if (!inputPageOnly && !confirmationPageOnly && !$conditionUnder.length) {
      return '';
    }

    fragment = document.createDocumentFragment();

    if (inputPageOnly) {
      fragment.appendChild(
        $('<div>').css(infoStyle).text('【入力画面のみ】')[0]
      );
    }

    if (confirmationPageOnly) {
      fragment.appendChild(
        $('<div>').css(infoStyle).text('【確認画面のみ】')[0]
      );
    }

    if ($conditionUnder.length) {
      fragment.appendChild(
        $('<div>').css(infoStyle).text(
          '【'
        + ($conditionUnder.spec_desc() || $conditionUnder.spec_attr('test') + 'の場合')
        + '】'
        )[0]
      );
    }
    return $(fragment);
  };

  /**
   * spec:descの内容を取得する。
   */
  $.fn.spec_desc = function() {
    var $desc = this.children('[data-jsp="spec:desc"]:first-child');
    return ($desc.text() || '').trim();
  };

  /**
   * 条件付き(filterされた)画面レイアウトを表示するリンクを出力する。
   */
  $.fn.spec_pageConditionLink = function() {
    var $tag         = this
      , name         = $tag.spec_attr('name')
      , layout       = $tag.spec_attr('layout')
      , confirmation = $tag.spec_attr('isConfirmationPage')
      , conditions   = $tag.spec_attrAsArray('when')
      , reloadOpts   = {nablarch_spec_open_specsheet: 'true'};

    if (layout) {
      reloadOpts.nablarch_spec_layout = layout;
    }

    if (confirmation) {
      reloadOpts.nablarch_confirmationPage = 'true';
    }

    if (conditions.length) {
      reloadOpts.nablarch_spec_conditions = conditions.join('|');
    }

    return $('<a>')
          .css(linkStyle)
          .on('click', reloadPage.fill(reloadOpts))
          .text($tag.attr('name'));
  };

  /*
   * ページをリロードする。
   */
  function reloadPage(params) {
    var pageName = document.location.pathname
                  .replace(/^.*?([^\/]+)\.jsp$/, '$1');

    window.location = '../../' + pageName + '.jsp'
                    + '?'
                    + Object.toQueryString(params);
    return false;
  }

  /**
   * 画面項目定義の項目にフォーカスした時、該当するレンダリング済みのレイアウト部分を(HTML)をハイライトする。
   */
  $.fn.spec_hoverLayout = function(cell) {
    var layoutName = $(this).attr('name')
      , $layout = window.spec_nodeRefs[layoutName].first().next();
    $layout.addClass('spec_layout');
    $(cell).closest('tr')
      .on('mouseenter', function(){highlight(this, $layout, true);})
      .on('mouseleave', function(){highlight(this, $layout, false);});
  };

  /**
   * 画面項目定義の項目にフォーカスした時、該当するレンダリング済みの要素部分を(HTML)をハイライトする。
   */
  $.fn.spec_hoverItem = function(cell) {
    var $target = targetOf(this);

    $(cell).closest('tr')
      .on('mouseenter', function(){highlight(this, $target, true);})
      .on('mouseleave', function(){highlight(this, $target, false);});

    return;

    // ---- subroutines ---- //
    function targetOf(tag) {
      var $tag    = $(tag)
        , tagName = $tag.attr('data-jsp')
        , title   = $tag.attr('title');

      if (tagName.startsWith(/field\:/)) {
        return $('div.field:contains('+title+')').find('label, .fieldinput');
      }
      else if (tagName.startsWith('column:')) {
        var $th = $('table th:contains('+title+')')
          , pos = $th.index()+1;
        return $('th:nth-child('+pos+'), td:nth-child('+pos+')');
      }
      else if (tagName.startsWith('button:')) {
        var label = buttonLabel($tag);
        return $('button:contains('+label+')').closest('div');
      }
    }
  };

  /*
   * ハイライトするスタイルを設定する。
   */
  function highlight(row, $target, on) {
    var $row  = $(row);
    if (on) {
      $target.addClass('spec_hover');
      $row.addClass('spec_hover');
    }
    else {
      $target.removeClass('spec_hover');
      $row.removeClass('spec_hover');
    }
  }

  /**
   * タグ名称を取得する。
   */
  $.fn.jsp_tagName = function() {
    return (this.attr('data-jsp') || '').trim();
  };

  /**
   * 属性値を取得する。
   * (空文字でガードされているので、nullやundefinedは返さない。)
   */
  $.fn.spec_attr = function(name) {
    return (this.attr(name) || '').trim();
  };

  /**
   * 属性値の文字列を「|」区切りで配列にしたものを取得する。
   */
  $.fn.spec_attrAsArray = function(name) {
    var attr = this.spec_attr(name);
    return attr ? attr.split('|').map('trim')
                : [];
  };

  /**
   * dataFrom属性を元に情報取得元を取得する。
   *
   * 「DB定義のテーブル論理名称」 または
   * 「外部インターフェース設計の相手先システム名 + 取引名称」
   * を書き出す。
   *
   * @return 情報取得元
   *
   */
  $.fn.spec_getDataStoreName = function() {
    return getDataStoreName(this, 'dataFrom');
  };

  // 定義の情報を構築する。
  var dataStoreDef = Object.create(null);
  dataStoreDef = Object.merge(dataStoreDef, dbDef);
  Object.keys(interfaceDef, function(key, values){
    dataStoreDef[key] = key.has(".") ? values : [values[0] + ":" + values[1]];
  });

  /*
   * データストアの名称を取得する。
   */
  function getDataStoreName($tag, attrName) {
    var colNames = $tag.spec_attrAsArray(attrName);
    return $(
      colNames.map(resourceName)
              .compact()
              .unique()
              .map(renderIdentifier.using(dataStoreDef))
    );
    function resourceName(columnName) {
      return columnName.split('.')[0];
    }
  }

  /*
   * テーブル名称を取得する。
   */
  function getTableName($tag, attrName) {
    var colNames = $tag.spec_attrAsArray(attrName);
    return $(
      colNames.map(tableName)
              .compact()
              .unique()
              .map(renderIdentifier.using(dbDef))
    );
    function tableName(columnName) {
      return columnName.replace(/\.[^\s.]+$/, '');
    }
  }

  /*
   * warning情報(引数のtext)を出力したDOM要素を取得する。
   */
  function renderWarning(text) {
    return $('<span class="spec_unknown_identifier" style="color:red;">').text(text)[0];
  }

  /**
   * 定義情報の論理名とキーを書き出したDocumentFragmentを生成する。
   *
   * @param identifier {String} 定義情報のキー
   * @param definition {Object} 値にArrayを持つ定義情報
   * @return 情報を出力した要素を持つDocumentFragment
   */
  function renderIdentifier(identifier, definition) {
    var dispName = definition[identifier] && definition[identifier][0]
      , fragment = document.createDocumentFragment();

    if (!identifier) {
      fragment.appendChild(
        $('<span>').addClass('spec_not_any')[0]
      );
    }
    else if (dispName === null || (typeof dispName === 'undefined')) {
      fragment.appendChild(
        renderWarning(identifier.split('.').join(' .'))
      );
    }
    else {
      fragment.appendChild($('<span>').text(dispName)[0]);
      fragment.appendChild($('<br>')[0]);
      fragment.appendChild($('<span>')
        .text('(' + identifier.split('.').join(' .') + ')')[0]);
    }
    fragment.appendChild($('<br>')[0]);
    return fragment;
  }

  renderIdentifier.using = function(definition) {
    return renderIdentifier.fill(undefined, definition);
  };

  /**
   * データフィールド名称を取得する。
   */
  $.fn.spec_getDataFieldName = function() {
    var columnNames = this.spec_attrAsArray('dataFrom');
    return $(
      columnNames
        .map(function(n){return (!n || n.has('.')) ? n : '(未指定)';})
        .map(renderIdentifier.using(dataStoreDef))
    );
  };

  /**
   * 編集仕様を取得する。
   */
  $.fn.spec_getDisplayingFormat = function() {
    var $tag    = this
      , tagName = $tag.jsp_tagName();

    return tagName.has('code') ? getCodeDisplayingSpec()
                               : getValueFormat();

    // --------- subroutines -------//
    function getCodeDisplayingSpec() {
      var codeId     = $tag.spec_attr('codeId')
        , pattern    = $tag.spec_attr('pattern') || 'PATTERN01'
        , label      = $tag.spec_attr('labelPattern') || '$NAME$'
        , optionName = $tag.spec_attr('optionColumnName') || 'OPTION01';

      if (!codeId) {
        return $(renderWarning('(コードID未定義)'));
      }

      $content = $('<div>');
      $('<div>').html('<b>コードID: </b>' + codeId)
                .appendTo($content);
      $('<div>').html('<b>コード名称: </b><br/>')
                .append(renderIdentifier(codeId, codeDef)).appendTo($content);
      $('<div>').html('<b>コードパターン: </b>' + pattern)
                .appendTo($content);
      $('<div>').html('<b>表示内容: </b><br/>' + labelContent())
                .appendTo($content);
      return $content;

      // ---- subroutines ----- //
      function labelContent() {
        return label.replace(/\$([a-zA-Z]+)\$/, function(_, token) {
          return {
            NAME        : '【コード名称】'
          , SHORTNAME   : '【コード略称】'
          , VALUE       : '【コード値】'
          , OPTIONALNAME: '【オプション名称(' + optionName + ')】'
          }[token] || '';
        });
      }
    }

    function getValueFormat() {
      return  $tag.spec_attr('format') || $tag.spec_attr('formatSpec');
    }
  };

  /**
   * ドメイン名を取得する。
   */
  $.fn.spec_getDomainName = function() {
    var domainList = this.spec_attrAsArray('domain')
      , fragment   = document.createDocumentFragment()
      , index      = !arguments.length ? null : arguments[0];

    domainList.each(function(domainId) {
      var domainInfo = resource.domainInfo(domainId)
        , $node = !domainInfo    ? $('<div>').css(errorStyle).text(domainId)
                : index === null ? $('<div>').text(domainInfo.name + '(' + domainId + ')')
                                 : $('<div>').text(domainInfo.data[index || 0]);
      fragment.appendChild($node[0]);
    });
    return $(fragment);
  };

  /**
   * 画面イベント名を取得する。
   */
  $.fn.spec_getEventName = function() {
    var tagName = this.jsp_tagName();
    if (tagName.indexOf('button:') >= 0) {
      return buttonLabel(this);
    }
    else if (tagName.indexOf('link') >= 0) {
      return this.attr('title');
    }
    else if (tagName.indexOf('table:search_result') >= 0) {
      return this.attr('title') + 'ページ遷移' ;
    }
    else if (tagName.has('event:listen')) {
      return this.spec_attr('title') || $(renderWarning('titleが定義されていません。'));
    }
    return '-';
  };

  /**
   * ボタンのラベル名称を取得する。
   */
  function buttonLabel($tag) {
    var tagName = $tag.jsp_tagName();
    return $tag.spec_attr('label') || resource.defaultLabel(tagName);
  }

  /**
   * イベントを発生させる操作名称を取得する。
   */
  $.fn.spec_getEventTrigger = function() {
    var tagName = this.jsp_tagName();
    if (tagName.has('button:')) {
      return buttonLabel(this) + 'ボタン押下時';
    }
    else if (tagName.has('link')) {
      return this.attr('title') + 'リンク押下時';
    }
    else if (tagName.has('table:search_result')) {
      return this.attr('title') + 'テーブルのページ番号リンク押下時';
    }
    else if (tagName.has('event:listen')) {
      return this.spec_attr('operation') || $(renderWarning('operationが定義されていません。'));
    }
    return '-';
  };

  /**
   * 画面イベントの概要を取得する。
   */
  $.fn.spec_getEventDesc = function() {
    return this.attr('comment');
  };

  /**
   * 遷移先のページ名称を取得する。
   */
  $.fn.spec_getMoveToPageName = function() {
    var uri      = this.spec_attr('dummyUri') || ''
      , pageId   = uri.replace(/(^|.*\/)([^\/]+)\.jsp$/, '$2')
      , pageName = resource.pageName(pageId);

    return pageName ? pageName
                    : $(renderWarning(pageId));
  };

  /**
   * メッセージを取得する。
   */
  $.fn.spec_getMessage = function() {
    var messageId    = this.spec_attr('messageId')
      , messageParam = this.spec_attrAsArray('messageParam')
      , message      = resource.message(messageId);

    if (!messageId) {
      return $(renderWarning('(メッセージID未指定)'));
    }
    if (!message) {
      return $(renderWarning(messageId));
    }
    return $('<span>').html(
      message.escapeHTML().replace(/\{([0-9]|[-_A-Za-z0-9]+)\}/g, function(_, param) {
        return (param.length === 1)
             ? ('<b>【' + messageParam[Number(param)] + '】</b>')
             : (messageDef[param] || param);
      }) + '(' + messageId + ')'
    );
  };

  /**
   * 画面項目種類を取得する。
   */
  $.fn.spec_uiType = function() {
    var tagName = this.jsp_tagName()
      , uiType  = resource.uiType(tagName);

    return uiType ? uiType
                  : $(renderWarning(tagName));
  };
});
