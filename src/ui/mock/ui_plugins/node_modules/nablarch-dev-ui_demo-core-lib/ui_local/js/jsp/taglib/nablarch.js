/**
 * Nablarchタグライブラリ(`<n:xxx>`)のエミューレーションを行う。
 *
 * @module jsp.taglib
 * @class jsp.taglib.nablarch
 * @author Iwauo Tajima
 */
define(['jsp', 'devtool/resource', 'devtool/resource/メッセージ定義', 'sugar'],
function($, resource, messageMap) { 'use strict';
  return {
    /**
     * `<n:set>`タグのエミュレーションを行う。
     *
     * `name`属性値で指定したコンテキスト変数の値として
     * `var`属性で指定したコンテキスト変数の値、もしくは、`value`属性値に直接指定した値
     * を設定する。
     *
     * @method set
     */
    set: doSetTag
    /**
     * `<n:script>`タグのエミュレーションを行う。
     *
     * 対応する`<script>`タグを生成し、HTMLヘッド部に追加する。(動的ロード)
     * ただし、下記のスクリプトは無視する。
     *
     *   - qunit.js
     *   - require.js
     *   - その他、'test'が名称に含まれるスクリプト
     *
     * @method script
     */
  , script: doScriptTag
    /**
     * `<n:write>`タグのエミュレーションを行う。
     *
     * `name`属性に指定されたコンテキスト変数の値を出力する。
     *
     * @method write
     */
  , write: doWriteTag
    /**
     * `<n:code>`タグのエミュレーションを行う。
     *
     * `sample`属性が指定されていない場合には、`codeId`属性値に指定された使用コードのコードIDに対応する値を出力する。
     * コード定義は、下記ファイルに記述する。
     *
     *     js/devtool/resource/コード値定義.js
     *
     * @method code
     */
  , code: doCodeTag
    /**
     * `<n:prettyPrint>`タグのエミュレーションを行う。
     *
     * `name`属性に指定されたコンテキスト変数の値を出力する。
     * この際、HTML特殊文字もエスケープせずにそのまま展開する。
     *
     * @method prettyprint
     */
  , prettyprint: doPrettyPrintTag
    /**
     * `<n:rawWrite>`タグのエミュレーションを行う。
     *
     * `name`属性に指定されたコンテキスト変数の値を出力する。
     * この際、HTMLをエスケープせず、そのまま出力する。
     *
     * @method rawwrite
     */
  , rawwrite : doRawWriteTag
    /**
     * `<n:submitLink>`タグのエミュレーションを行う。
     *
     * `dummyUri`属性を、出力する`<a>`タグの`href`属性値として使用する。
     * `dummyUri`属性を指定しない場合、固定値`"dummy"`となる。
     *
     * @method submitlink
     */
  , submitlink: doSubmitLink
    /**
     * `<n:downloadLink>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:submitLink>'タグと同じ。
     *
     * @method downloadlink
     */
  , downloadlink: doSubmitLink
    /**
     * `<n:popupLink>`タグのエミュレーションを行う。
     *
     *  `<a>`タグを出力し、`onClick`イベントに`dummyUri`属性値に設定した
     *  URIを別画面に表示するイベントハンドラを登録する。
     *  (`porpupwindowname`属性が指定されている場合は、その値を別画面のウィンドウ名とする。)
     *
     * @method popuplink
     */
  , popuplink: doPopupLink
    /**
     * `<n:link>`タグのエミュレーションを行う。
     *
     * @method link
     */
  , link: doLinkTag
    /**
     * `<n:a>`タグのエミュレーションを行う。
     *
     * @method a
     */
  , a : doAnchorTag
    /**
     * `<n:img>`タグのエミュレーションを行う。
     *
     * @method img
     */
  , img : doImageTag
    /**
     * `<n:text>`タグのエミュレーションを行う。
     *
     * `<input type="text">`タグを出力する。`value`属性値に`sample`属性の値を使用する。
     * また、確認画面表示時には、`<input>`ではなく`<span>`タグを出力し、
     * `sample`属性の値をテキストノードに出力する。
     *
     * @method text
     */
  , text: htmlINPUT.fill({type:'text'})
    /**
     * `<n:submit>`タグのエミュレーションを行う。
     *
     *  `<input>`タグを出力し、`onClick`イベントに`dummyUri`属性値に設定した
     *  URIに画面遷移するイベントハンドラを登録する。
     *  (type属性はsubmit/image/buttonのいずれか。)
     *
     *  @method submit
     */
  , submit: doSubmitTag
    /**
     * `<n:downloadSubmit>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:submit>'タグと同じ。
     *
     * @method downloadsubmit
     */
  , downloadsubmit: doSubmitTag
    /**
     * `<n:popupSubmit>`タグのエミュレーションを行う。
     *
     *  `<input>`タグを出力し、`onClick`イベントに`dummyUri`属性値に設定した
     *  URIを別画面に表示するイベントハンドラを登録する。
     *  (`porpupwindowname`属性が指定されている場合は、その値を別画面のウィンドウ名とする。)
     *
     * @method popupsubmit
     */
  , popupsubmit: doPopupSubmitTag
    /**
     * `<n:button>`タグのエミュレーションを行う。
     *
     *  `<button>`タグを出力し、`onClick`イベントに`dummyUri`属性値に設定した
     *  URIに画面遷移するイベントハンドラを登録する。
     *
     *  @method button
     */
  , button: doButtonTag
    /**
     * `<n:downloadButton>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:button>'タグと同じ。
     *
     * @method downloadbutton
     */
  , downloadbutton: doButtonTag
    /**
     * `<n:popupButton>`タグのエミュレーションを行う。
     *
     *  `<button>`タグを出力し、`onClick`イベントに`dummyUri`属性値に設定した
     *  URIを別画面に表示するイベントハンドラを登録する。
     *  (`porpupwindowname`属性が指定されている場合は、その値を別画面のウィンドウ名とする。)
     *
     *  @method popupbutton
     */
  , popupbutton: doPopupButtonTag
    /**
     * `<n:file>`タグのエミュレーションを行う。
     *
     * `<input type="file">`タグを出力する。
     * `file`タグのvalue属性はセキュリティ上の制約でスクリプト制御が不可能なため。
     * `sample`属性値が反映されるのは、確認画面表示時(`<span>`タグ)のみである。
     *
     * @mehtod file
     */
  , file: doFileTag
    /**
     * `<n:error>`タグのエミュレーションを行う。
     *
     * (未サポート)現状では単に無視される。
     *
     * @method error
     */
  , error: noop
    /**
     * `<n:errors>`タグのエミュレーションを行う。
     *
     * (未サポート)現状では単に無視される。
     *
     * @method errors
     */
  , errors: noop
    /**
     * `<n:hidden>`タグのエミュレーションを行う。
     *
     * 単に無視される。
     *
     * @method hidden
     */
  , hidden: noop
     /**
      * `<n:plainHidden>`タグのエミュレーションを行う。
      *
      * 単に無視される。
      *
      * @method plainhidden
      */
  , plainhidden: noop
    /**
     * `<n:form>`タグのエミュレーションを行う。
     *
     * `nablarch_submit`等、`NablarchTagHandler`が設定するグローバル関数の
     * 空実装を出力する。
     *
     * @method form
     */
  , form: doFormTag
    /**
     * `<n:nocache>`タグのエミュレーションを行う。
     *
     * 単に無視する。
     *
     * @method nocache
     */
  , nocache: noop
    /**
     * `<n:param>`タグのエミュレーションを行う。
     *
     * (未サポート) 現状では単に無視される。
     *
     * @method param
     */
  , param: noop
    /**
     * `<n:changeParamName>`タグのエミュレーションを行う。
     *
     * (未サポート) 現状では単に無視される。
     *
     * @method changeparamname
     */
  , changeparamname: noop
    /**
     * `<n:password>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:text>'タグと同じ。
     *
     * @method password
     */
  , password: htmlINPUT.fill({type:'password'})
    /**
     * `<n:checkbox>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:text>'タグと同じ。
     *
     * @method checkbox
     */
  , checkbox: htmlINPUT.fill({type:'checkbox'})
    /**
     * `<n:radioButton>`タグのエミュレーションを行う。
     *
     * 挙動は'<n:text>'タグと同じ。
     *
     * @method checkbox
     */
  , radiobutton: htmlINPUT.fill({type:'radio'})
    /**
     * `<n:textarea>`タグのエミュレーションを行う。
     *
     * `<textarea>`タグを出力し`sample`属性値の値を入力値に設定する。
     * また、確認画面表示時には、`<div>`タグを出力し、`sample`属性値をテキストノードにする。
     * (この際、sample値の改行は`<br/>`タグに置換される。)
     *
     * @method textarea
     */
  , textarea: doTextareaTag
    /**
     * `<n:select>`タグのエミュレーションを行う。
     *
     * `<select>`タグおよび、その子要素の`<option>`タグを出力する。
     *
     * `sample`属性値の値を縦棒(`|`)で分割した文字列を`<option>`タグで囲んだものを
     * 使用する。
     * 縦棒で分割した文字列が(`[...]`)で囲われている場合は、その要素を初期選択される。
     *
     * 確認画面では、初期選択された`<option>`の内容を`<span>`タグ内に出力する。
     *
     * @method select
     */
  , select: doSelectTag.fill(false)
    /**
     * `<n:codeSelect>`タグのエミュレーションを行う。
     *
     * 挙動は`<n:select>`タグと同じ。
     * `sample`属性が指定されていない場合には、`codeId`属性値に指定された使用コードのコードIDに対応する値を出力する。
     * コード定義は、下記ファイルに記述する。
     *
     *     js/devtool/resource/コード定義値.js
     *
     * @method codeselect
     */
  , codeselect: doSelectTag.fill(true)
    /**
     * `<n:radioButtons>`タグのエミュレーションを行う。
     *
     * `<input type="radio">`タグおよび、`<label>`タグを出力する。
     *
     * `sample`属性値の値を縦棒(`|`)で分割した文字列を`<label>'タグのテキストとして使用する。
     * `name`属性、`value`属性は明示的に指定されなければ自動的に発番された値を設定する。
     * 縦棒で分割した文字列が(`[...]`)で囲われている場合は、その要素が初期選択される。
     *
     * 確認画面表示時は、初期選択項目のテキストを`<span>`タグ内に出力する。
     *
     * @method radiobuttons
     */
  , radiobuttons: doPushButtonsTag.fill('radio', false)
    /**
     * `<n:checkboxes>`タグのエミュレーションを行う。
     *
     * `<input type="checkbox">`タグおよび、`<label>`タグを出力する。
     *
     * `sample`属性値の値を縦棒(`|`)で分割した文字列を`<label>'タグのテキストとして使用する。
     * `name`属性、`value`属性は明示的に指定されなければ自動的に発番された値を設定する。
     * 縦棒で分割した文字列が(`[...]`)で囲われている場合は、その要素が初期選択される。
     *
     * 確認画面表示時は、初期選択項目のテキストを`<span>`タグ内に出力する。
     *
     * @method checkboxes
     */
  , checkboxes: doPushButtonsTag.fill('checkbox', false)
    /**
     * `<n:codeRadioButtons>`タグのエミュレーションを行う。
     *
     * `sample`属性が指定されていない場合には、`codeId`属性値に指定された使用コードのコードIDに対応する値を出力する。
     * コード定義は、下記ファイルに記述する。
     *
     *     js/devtool/resource/コード値定義.js
     *
     * @method coderadiobuttons
     */
  , coderadiobuttons: doPushButtonsTag.fill('radio', true)
    /**
     * `<n:codeCheckboxes>`タグのエミュレーションを行う。
     *
     * `sample`属性が指定されていない場合には、`codeId`属性値に指定された使用コードのコードIDに対応する値を出力する。
     * コード定義は、下記ファイルに記述する。
     *
     *     js/devtool/resource/コード値定義.js
     *
     * @method codecheckboxes
     */
  , codecheckboxes: doPushButtonsTag.fill('checkbox', true)
    /**
     * `<n:codeCheckbox>`タグのエミュレーションを行う。
     *
     *  挙動は'<n:codeCheckboxes>'タグと同じ。
     *
     * @method codecheckbox
     */
  , codecheckbox: doPushButtonsTag.fill('checkbox', true)
    /**
     * `<n:compositeKeyRadioButton>`タグのエミュレーションを行う。
     *
     *  挙動は'<n:radiobuttons>'タグと同じ。
     *
     * @method compositekeyradiobutton
     */
  , compositekeyradiobutton : doPushButtonsTag.fill('radio', false)
    /**
     * `<n:compositeKeyCheckbox>`タグのエミュレーションを行う。
     *
     *  挙動は'<n:checkboxes>'タグと同じ。
     *
     * @method compositekeycheckbox
     */
  , compositekeycheckbox : doPushButtonsTag.fill('checkbox', false)
    /**
     * `<n:forInputPage>`タグのエミュレーションを行う。
     *
     * 確認画面表示時は、タグボディを無視する。
     * それ以外はタグボディをそのまま出力する。
     *
     * @method forinputpage
     */
  , forinputpage: doForInputPageTag
    /**
     * `<n:forConfirmationPage>`タグのエミュレーションを行う。
     *
     * 確認画面表示時のみタグボディを出力する。
     * それ以外の場合は単に無視する。
     *
     * @method forconfirmationpage
     */
  , forconfirmationpage : doForConfirmationPageTag
    /**
     * `<n:confirmationPage>`タグのエミュレーションを行う。
     *
     * `path`属性値に指定されたパス上に存在するJSPをロードし、その結果を展開する。
     * この際、コンテキスト変数`nablarch_confirmationpage`を`true`に設定することにより、
     * `<n:forConfirmationPage>` / `<n:forInputPage>`の動作を制御する。
     *
     * @method confirmationpage
     */
  , confirmationpage: doConfirmationPageTag
    /**
     * `<n:ignoreConfirmation>`タグのエミュレーションを行う。
     *
     * (未サポート)現状では単に無視される。
     *
     * @method ignoreconfirmation
     */
  , ignoreconfirmation : noop
    /**
     * `<n:include>`タグのエミュレーションを行う。
     *
     * (未サポート)現状では単に無視される。
     *
     * @method include
     */
  , include : doIncludeTag
    /**
     * `<n:includeParam>`タグのエミュレーションを行う。
     *
     * `<n:includeParam>`タグの評価は、親要素の評価時に行なうため、
     * ここでは単に無視してよい。
     *
     * @method includeparam
     */
  , includeparam : noop
    /**
     * `<n:message>`タグのエミュレーションを行う。
     *
     * `messageId`属性値に指定されたメッセージIDに対応するサンプル値を出力する。
     * メッセージIDとサンプル値の対応は、下記ファイルに記述する。
     *
     *     js/devtool/resource/メッセージ定義.js
     *
     * @method message
     */
  , message : doMessageTag
  };

  function noop($tagBody, context) {
    return $tagBody;
  }

  function doConfirmationPageTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , path  = attrs.path;

    document.location = path+"?nablarch_confirmationPage=true";
    return false;
  }

  function doForInputPageTag($tagBody, context) {
    if (isConfirmationPage(context)) {
      $(this).remove();
      return false;
    }
    return $tagBody;
  }

  function doForConfirmationPageTag($tagBody, context) {
    if (isConfirmationPage(context)) {
      return $tagBody;
    }
    $(this).remove();
    return false;
  }

  function doIncludeTag($tagBody, context) {
    var tag  = this
      , path = $(tag).jsp_attrs(context)['path'].replace(/^\//, '')
      , base = (context.__jsp_load_base_path && path.indexOf('./') === 0)
             ? context.__jsp_load_base_path
             : '';

    if (base) {
      path = path.slice(2, path.length);
    }
    $tagBody.filter('[data-jsp="n:includeparam"]').each(function() {
      var attrs = $(this).jsp_attrs(context)
        , value = attrs.name ? context.getVar(attrs.name) : attrs.value;
      context.setVar(attrs.paramname,  value);
    });
    // encodeURI for IE8,9 bug
    require(['text!../' + encodeURI(base + path)], function(include) {
      var $include = $.jsp(include);
      $(tag).replaceWith($include);
      $include.jsp_eval(context);
    });
    return false;
  }

  function isConfirmationPage(context) {
    return !!context['nablarch_confirmationpage'];
  }

  function doAnchorTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context);
      // encodeURI for IE8,9 bug
    attrs.href = encodeURI((attrs.href || ""));
    return $('<a>', attrs).append($tagBody);
  }

  function doImageTag($tagBody, context) {
    return $('<img>', $(this).jsp_attrs(context)).append($tagBody);
  }

  function doSubmitLink($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.dummyuri;
    // encodeURI for IE8,9 bug
    attrs.href = encodeURI((uri || 'dummy'));
    return $('<a>', attrs).append($tagBody);
  }

  function doPopupLink($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.getVar('dummyUri') || attrs.uri
      , popupWindowName = (attrs.popupwindowname || '_blank');

    // encodeURI for IE8,9 bug
    attrs.href = encodeURI((uri || 'dummy'));
    return $('<a>', attrs)
          .append($tagBody)
          .on('click', emulatePopupEvent(uri, popupWindowName, attrs));
  }

  function doWriteTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , name  = attrs.name
      , value = context.getVar(name) || context.sample || ''
      , texts;
    texts = (value+'').split('\n').map(function(text) {
      return [document.createTextNode(text), document.createElement('br')];
    }).flatten().slice(0, -1);
    return $(texts);
  }

  function doRawWriteTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , name  = attrs.name
      , value = context.getVar(name) || context.sample || '';
    return $('<span>').html((value+'').replace('\n', '<br>')).contents();
  }

  function doMessageTag($tagBody, context) {
    var attr = $(this).jsp_attrs(context)
      , messageId = attr.messageid
      , value = messageMap[messageId] || '';

    return $(document.createTextNode(value));
  }

  function doPrettyPrintTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , name  = attrs.name
      , value = context[name] || context.getVar(name);
    if (!value && context.sample) {
      value = context.sample;
    }
    return $('<span>').html(value).contents();
  }

  function doSetTag($tagBody, _, __, context) {
    var $tag    = $(this)
      , attrs   = $tag.jsp_attrs(context)
      , varName = attrs['var']
      , name    = attrs['name']
      , value   = name ? context.getVar(name) : attrs['value'];

    if (typeof varName === 'undefined') {
      throw new Error('n:set tag needs "var" attribute. : ' + this.outerHTML);
    }

    context.setVar(varName, value);
    $tag.remove();
    return false;
  }

  function doScriptTag($tagBody, context) {
    var attrs  = $(this).jsp_attrs(context)
      , path   = (attrs.src || '').replace(/^\//, '')
      , script = document.createElement('script')
      , $src   = $('<div>').append($tagBody).jsp_eval(context);


    if (/test|require|qunit/.test(path)) {
      $(this).remove();
      return false;
    }
    /** ローカルレンダリングではminifyではなく、通常のnablarch.jsを読み込むように切り替える。 */
    if (/nablarch-minify/.test(path)) {
      path = path.replace("nablarch-minify", 'nablarch');
    }
    script.type = attrs.type || 'text/javascript';
    $(document).on('jsp_processed', function() {
      if (path) {
        script.src  = path;
      }
      else {
        script.text = $src.text();
      }
      document.getElementsByTagName('head')[0].appendChild(script);
    });
    $(this).remove();
    return false;
  }

  function doLinkTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , stylesheet;
    attrs.href = (attrs.href || '').replace(/^\//, '');
    if (document.createStyleSheet) {
      stylesheet = document.createStyleSheet(attrs.href); // for oldIE
      if (attrs.media !== undefined) {
        stylesheet.media = attrs.media;
      }
    }
    else {
      $('<link>', attrs).appendTo('head');
    }
    $(this).remove();
    return false;
  }

  function htmlINPUT(attrs, $tagBody, context) {
    var attrs  = Object.merge($(this).jsp_attrs(context), attrs)
      , sample = context.sample;

    attrs.value =  attrs.value
                || attrs.name && context.getVar(attrs.name)
                || (Object.isArray(sample) ? sample.shift() : sample)
                || '';

    return isConfirmationPage(context) ? $('<span>').text(label(attrs))
                                       : $('<input>').attr(attrs).val(attrs.value);

    function label(attrs) {
      type = attrs.type;
      if (type === 'password') {
        return '*'.repeat(attrs.value.length);
      }
      if (type === 'checkbox' || type === 'radio') {
        return attrs.label || '';
      }
      return attrs.value || '';
    }
  }

  function doTextareaTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , text  = context.sample || $(this).text() || '';

    if (!isConfirmationPage(context)) {
      return $('<textarea>', attrs)
             .val(text);
    }
    return $('<div>').append(
      text.split('\n').map(function(line) {
        return [
          document.createTextNode(line)
        , document.createElement('br')
        ];
      }).flatten()
    );
  }

  function doCodeTag($tagBody, context) {
    var format    = context.listformat
      , status    = context.nablarch_status
      , inColumn  = !!status
      , useSample = !!context.sample
      , useCodeId = !!context.codeid
      , codeList  = useSample ? context.sample.split('|')
                  : useCodeId ? getCodeLabels(context)
                  : ['']
      , values    = codeList.map(function(t) {
                      var selected = (t.indexOf('[') === 0)
                        , value    = t.replace(/(^\[|\]$)/g, '')
                        , text     = document.createTextNode(value);
                      return inColumn ? text
                           : (useSample || useCodeId || selected) ? wrap(format, text)
                           : null;
                    }).flatten().compact(true)
      , $items    = inColumn ? context.samplepattern ?
                               rowItems(format, values)
                             : $(wrap(format, values[status.index % values.length]))
                             : $(values);

    return (format == 'ul') ? $('<ul>').append($items)
         : (format == 'ol') ? $('<ol>').append($items)
         : $items;

    function rowItems(format, texts) {
      var rowIndex   = status.index
        , patterns = increase(context.samplepattern, rowIndex)
        , from     = (0).upto(rowIndex).map(function(index){ return patterns[index-1];}).compact().sum()
        , to       = patterns[rowIndex]
        , items    = collect(texts, from, to);
      return $(items);

      function increase(samplepattern, rows) {
        var patterns = samplepattern.split(/\s*,\s*/g).map(function(p) {return p.toNumber();});
        while (rows >= patterns.length) {
          patterns.add(patterns);
        }
        return patterns.flatten();
      }

      function collect(texts, from, to) {
        var length = texts.length
          , texts  = times(texts, ((from + to) / length + 1));
        return texts.from(from).to(to).map(function(text) {return wrap(format, text);}).flatten().compact(true);

        function times(texts, num) {
          var result = [];
          num.times(function() {result.add(texts);});
          return result.flatten();
        }
      }
    }
  }

  function doPushButtonsTag(tagName, usesCode, $tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , checkedLabels = []
      , seq = 1
      , baseId = attrs.name
      , format = attrs.listformat
      , labels = (context.sample) ? context.sample.split('|')
               : (usesCode && context.codeid) ? getCodeLabels(context)
               : ['']
      , $items = $(labels.map(function(text) {
          var checked = /^\[.*\]$/.test(text)
            , $label  = $('<label>')
            , $item   = $('<input>', {type:tagName}).attr(attrs)
            , id      = baseId + '_' + (seq++);

          $item.prop('id', id);
          $label.prop('for', id);

          if (checked) {
            text = text.substring(1, text.length-1);
            checkedLabels.push(text);
            $item.prop('checked', 'checked');
          }
          return isConfirmationPage(context)
               ? (checked ? wrap(format, document.createTextNode(text)) : null)
               : wrap(format, $item[0], $label.text(text)[0]);

        }).flatten().compact(true));

    return (format == 'ul') ? $('<ul>').append($items)
         : (format == 'ol') ? $('<ol>').append($items)
         : $items;
  }


  function wrap(format /*, elements*/) {
    var elements = [].slice.apply(arguments);
    elements.shift(); //remove 1st argument;
    elements.push(separator());
    return (format == 'span') ? $('<span>').append(elements)[0]
         : (format == 'div')  ? $('<div>').append(elements)[0]
         : (format == 'ul')   ? $('<li>').append(elements)[0]
         : (format == 'ol')   ? $('<li>').append(elements)[0]
         : elements;

    function separator() {
      return (format == 'sp') ? document.createTextNode(' ')
           : (format == 'br') ? $('<br>')[0]
           : null;
    }
  }


  function getCodeLabels(context) {
    var codeMap = resource.codeMap(context.codeid, context.pattern);
    return codeMap.map(function(v) { return fillCodeLabelPattern(context.labelpattern, v, context.optioncolumnname) });
  }

  function fillCodeLabelPattern(pattern, codeNames, optionalNameColumn) {
    if (!pattern) {
      return pattern
    }

    var label = pattern;
    if (pattern.has('$NAME$')) {
      label = label.replace('$NAME$', codeNames['codeName']);
    }
    if (pattern.has('$SHORTNAME$')) {
      label = label.replace('$SHORTNAME$', codeNames['shortName']);
    }
    if (pattern.has('$OPTIONALNAME$')) {
      label = label.replace('$OPTIONALNAME$', codeNames[optionalNameColumn]);
    }
    if (pattern.has('$VALUE$')) {
      label = label.replace('$VALUE$', codeNames['value']);
    }
    return label;
  }


  function doSubmitTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.getVar('dummyUri');
    return $('<input>', attrs)
          .addClass(attrs.cssclass)
          .append($tagBody)
          .on('click', function() {
            if (uri) {
              // encodeURI for IE8,9 bug
              document.location = encodeURI(uri);
            }
            return false;
          });
  }

  /**
   * ローカル表示でbeforeSubmit, afterSubmitをトリガーしないと、エラーとなり、紙芝居ができないため、
   * ポップアップのイベントをエミュレートする。
   *
   */
  function emulatePopupEvent(uri, popupWindowName, attrs) {
    return function(event) {
      var beforeEvent = $.Event("beforeSubmit", { target: event.target })
        , afterEvent  = $.Event("afterSubmit",  { target: event.target });
      if (uri) {
        $.event.trigger(beforeEvent);
        // 途中のイベントハンドラでデフォルトアクションの実行が抑止されていた場合は、
        // サブミット処理を中断する。
        if (beforeEvent.isDefaultPrevented()) {
            return false;
        }
        window.nablarch_opened_windows[popupWindowName] = window.open(uri, popupWindowName, attrs.popupoption);
        $.event.trigger(afterEvent);
      }
      event.preventDefault();
    };
  }

  function doPopupSubmitTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.getVar('dummyUri')
      , popupWindowName = (attrs.popupwindowname || '_blank');

    return $('<input>', attrs)
          .addClass(attrs.cssclass)
          .append($tagBody)
          .on('click', function() {
              if (uri) {
                // encodeURI for IE8,9 bug
                window.open(encodeURI(uri), popupWindowName, attrs.popupoption);
              }
              return false;
           });
    }

  function doButtonTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.getVar('dummyUri');
    return $('<button>', attrs)
          .addClass(attrs.cssclass)
          .append($tagBody)
          .on('click', function(event) {
            if (uri) {
              // encodeURI for IE8,9 bug
              document.location = encodeURI(uri);
            }
            event.preventDefault();
          });
  }

  function doPopupButtonTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , uri   = context.getVar('dummyUri')
      , popupWindowName = (attrs.popupwindowname || '_blank');

    return $('<button>', attrs)
          .addClass(attrs.cssclass)
          .append($tagBody)
          .on('click', emulatePopupEvent(uri, popupWindowName, attrs));
  }

  function doSelectTag(usesCode, $tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , $select = $('<select>').attr(attrs)
      , sample  = context.getVar('sample')
      // 他のタグと同様、sample値が空の場合に空文字を出力するのはなく、導出される値を利用する。
      , optionTexts = (Object.isString(sample) && !!sample) ? sample.split('|')
                    : Object.isArray(sample) ? sample.shift().split('|')
                    : (usesCode && context.codeid) ? getCodeLabels(context)
                    : ['']
      , selectedOpts = [];

    if (attrs.withnoneoption === 'true') {
      $select.append($('<option>').text(attrs.noneoptionlabel || ''));
    }

    $(optionTexts.compact(true).each(function(text) {
      var selected = /^\[.*\]$/.test(text)
        , $option  = $('<option>')
        , text     = selected ? text.substring(1, text.length-1) : text;

      $select.append($option.text(text));
      if (selected) {
        selectedOpts.push($option[0]);
      }
    }));

    $(document).on('jsp_processed', function() {
      selectedOpts.each(function(opt) {opt.selected = true});
    });

    return isConfirmationPage(context)
         ? $('<div>').html(selectedOpts.map(function(opt){return $(opt).text()}).join('<br/>'))
         : $select;
  }

  function doFormTag($tagBody, context) {
    if (!window.nablarch_submit) {
      window.nablarch_submit = function() {};
    }
    if (!window.nablarch_submitToNewForm) {
      window.nablarch_submitToNewForm = function() {};
    }
    if (!window.nablarch_submitOnWindow) {
      window.nablarch_submitOnWindow = function() {};
    }
    if (!window.nablarch_submission_info) {
      window.nablarch_submission_info = {};
    }
    if (!window.nablarch_opened_windows) {
      window.nablarch_opened_windows = {};
    }
    return $('<form method="POST"></form>').append($tagBody);
  }

  function doFileTag($tagBody, context) {
    var attrs = $(this).jsp_attrs(context)
      , sample = (attrs.value || context.sample || '');
    // input type="file"の場合はvalueに書き込みを行えないので、入力画面ではサンプル値は表示しない。
    return isConfirmationPage(context) ? $('<span>').text(sample)
                                       : $('<input>', Object.merge(attrs, {type: 'file'}));
  }
});
