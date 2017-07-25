define([
  "jquery"        // jQueryライブラリ
, "global"        // グローバル(Window)オブジェクト
, "./Widget"      // Widget基底クラス
, "./Collapsible" // 開閉機能
, "sugar"         // sugar.js ライブラリ
],
function($, global, Widget, Collapsible) { "use strict";

  /**
   * 階層表示メニュー(開閉可能)
   * ==================================
   * このウィジェットは、開閉可能な階層表示機能を提供する。
   *
   *
   * マークアップ仕様
   * ---------------------
   * 階層を持つメニューリストの領域を囲む要素に **nablarch_TreeMenu** を指定し、
   * -name にメニュー用のformの名前を設定する(リクエストを跨いだ開閉状態の維持のため)
   *
   * 開閉を行うタイトルとなる要素には **menu_title** を指定し、id属性に一意の値を設定する。
   * id属性の値は後述するフォルダー用の要素を紐付けるために指定が必須である。
   *
   * メニューのリンク要素などを固めるフォルダー用の要素には **menu_folder** を指定する。
   * 前述したタイトル用のid属性の値を**-title** の直後に指定することでタイトルとの紐付けが可能となる。
   *
   * **menu_folder** でない **menu_title**の開閉状態は最上位のtitleして常に表示されるが、
   * 最上位のtitleの開閉が変更された場合、他の最上位タイトルは閉じる。
   *
   *
   * 1つの要素にタイトルの機能とフォルダの機能を持たせることが可能である。
   * 以下に階層させた場合のマークアップを示す。
   *
   *     <h3 id="title">menu</h3>
   *     <ul class="menu_folder -title title" >
   *       <li><a href="./user_menu.html">user</a></li>
   *     </ul>
   *     <h3 id="sub_title" class="menu_folder -title title">user_links</h3> <!-- #title をクリックすることでこのフォルダが開閉する -->
   *     <ul class="menu_folder -title sub_title">
   *       <li><a href="./user_list.html">user_list</a></li>
   *       <li><a href="./update_user.html">update_user</a></li>
   *
   *     ......
   *     </ul>
   *
   * @class nablarch.ui.TreeMenu
   *
   * @author tani takanori
   * @since 1.3
   */
  TreeMenu.prototype = Object.merge(new Widget, {
    /**
     * コンストラクタ関数。
     *
     * @method TreeMenu
     * @constructor
     * @param {HTMLElement} element メニューの領域
     * @param {Object} [opts] 以下のオプションを保持するオブジェクト
     * **name:** (String) メニュー領域があるformのname属性
     */
    constructor:TreeMenu
    /**
     * 開閉されるメニューを持つ要素。
     *
     * @property $folders
     * @type jQuery
     */
  , $folders:null
    /**
     * 開閉するタイトルの要素。
     *
     * @property $titles
     * @type jQuery
     */
  , $titles:null
    /**
     * 開閉状態を保存するためのformの名前。
     *
     * @property name
     * @type String
     */
  , name   : null
    /**
     * 必ず表示されるメニューの最上位階層。
     *
     * @property $tops
     * @jQuery
     */
  , $tops  : null
    /**
     * 最上位のタイトルの開閉を行うメソッド。
     *
     * @method toggle
     */
  , toggle : TreeMenu_toggle
    /**
     * フォーム要素に保持した開閉状態を表示に反映させる。
     *
     * @method render
     */
  , render : TreeMenu_render
  });

  TreeMenu.widgetType = "nablarch_TreeMenu";

  TreeMenu.event = {
    ".menu_title click" : "toggle"
  };

  Widget.register(TreeMenu);

  function TreeMenu(element, option) {
    var $area = $(element);
    this.$titles = $area.find('.menu_title');
    this.$tops   = this.$titles.filter(':not(.menu_folder)');
    this.$folders = $area.find('.menu_folder');
    this.name = option.name;
    this.constructor = TreeMenu;
    Widget.call(this, element);
    this.render();
  }

  function TreeMenu_render() {
    this.$titles.map(attachCollapsible(this)).each(saveFormInfo);
    function saveFormInfo() {
      if(!this.isClosed()) {
        this.revertState();
        this.changeState();
      }
    }
  }

  function TreeMenu_toggle(event, $target) {
    var $toggle = $(event.currentTarget)
      , titleId = rootId($toggle);
    this.$tops.filter(":not(#" + titleId +")")
              .map(attachCollapsible(this))
              .each(function() { this.close(event);});
    function rootId($toggle) {
      var $root = $toggle
        , id  = $root.widgetOption().title;
      while($root.is('.menu_folder')) {
        $root = $('#' + id);
        id  = $root.widgetOption().title;
      }
      return $root.attr('id');
    }
  }

  function attachCollapsible(self) {
    var formName = self.name
      , $folders = self.$folders;
    return function(){
      var $title = $(this)
        , id = $title.attr('id')
        , contents = $title.map(collect);
      return $title.widget(Collapsible, {
        value  : id,
        name   : formName,
        content : contents,
        icon   : "",
        closed : true
      });
    };
    function collect() {
      var $title = $(this)
        , contents = $folders.filter('.-title.' + $title.attr('id'))
        , sub_contents = contents.filter('.menu_title').map(collect);
      contents = contents.length > 0 ? asArray(contents) :[];
      if (sub_contents.length > 0) {
         contents.add(asArray(sub_contents));
      }
      return contents.length > 0 ? contents : undefined;

      function asArray($contents) {
        return Array.prototype.slice.call($contents);
      }
    }
  }

  return TreeMenu;
});
