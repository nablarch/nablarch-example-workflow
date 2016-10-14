define(function(){ return {"":""
// [TagName              UiType                  Options
, 'field:block'         : ['テキスト表示',       {}]
, 'field:text'          : ['単行テキスト入力',   {}]
, 'field:pulldown'      : ['プルダウン',         {}]
, 'field:code_pulldown' : ['プルダウン',         {}]
, 'field:password'      : ['パスワード',         {}]
, 'field:calendar'      : ['カレンダー日付入力', {}]
, 'field:checkbox'      : ['チェックボックス',   {multiple:true}]
, 'field:code_checkbox' : ['チェックボックス',   {multiple:true}]
, 'field:code_radio'    : ['ラジオボタン',       {}]
, 'field:file'          : ['ファイル選択',       {ignoredInForm:true}]
, 'field:hint'          : ['テキスト表示',       {ignoredInForm:true}]
, 'field:label_block'   : ['(複合項目)',         {ignoredInForm:true}]
, 'field:label_code'    : ['テキスト表示',       {ignoredInForm:true}]
, 'field:label_id_value': ['テキスト表示',       {ignoredInForm:true}]
, 'field:label'         : ['テキスト表示',       {ignoredInForm:true}]
, 'field:listbuilder'   : ['リストビルダー',     {multiple:true}]
, 'field:radio'         : ['ラジオボタン',       {}]
, 'field:textarea'      : ['複数行テキスト入力', {}]

// [TagName              UiType               Options
, 'column:checkbox'     : ['チェックボックス', {multiple:true}]
, 'column:radio'        : ['ラジオボタン',     {}]
, 'column:link'         : ['リンクテキスト',   {}]
, 'column:label'        : ['テキスト表示',     {}]
, 'column:code'         : ['テキスト表示',     {}]



// [TagName              UiType       Options
, 'button:search'       : ['ボタン',  {defaultLabel:'検索'}]
, 'button:download'     : ['ボタン',  {defaultLabel:'ダウンロード'}]
, 'button:back'         : ['ボタン',  {defaultLabel:'戻る'}]
, 'button:check'        : ['ボタン',  {defaultLabel:'確認'}]
, 'button:cancel'       : ['ボタン',  {defaultLabel:'キャンセル'}]
, 'button:confirm'      : ['ボタン',  {defaultLabel:'確定'}]
, 'button:delete'       : ['ボタン',  {defaultLabel:'削除'}]
, 'button:update'       : ['ボタン',  {defaultLabel:'更新'}]
, 'button:popup'        : ['ボタン',  {defaultLabel:''}]
, 'button:submit'       : ['ボタン',  {defaultLabel:''}]
, 'button:close'        : ['ボタン',  {defaultLabel:'閉じる'}]

// tutorial plugin
// [TagName                         UiType                Options
, 'field:extension_number'        : ['内線番号入力',      {complex: 'ビル番号(builName)|個人番号(personalName)'}]
, 'field:tel'                     : ['電話番号入力',      {complex: '市外局番(areaName)|市内局番(localName)|加入者局番(subscriberName)'}]
, 'field:mail'                    : ['メールアドレス入力',{}]
, 'field:label_extension_number'  : ['内線番号表示', {ignoredInForm:true}]
, 'field:label_tel'               : ['電話番号表示',              {ignoredInForm:true}]

};});

