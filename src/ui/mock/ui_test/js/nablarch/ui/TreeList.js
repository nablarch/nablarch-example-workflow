define([
  "jquery"        // jQueryライブラリ
, "global"        // グローバル(Window)オブジェクト
, "./Widget"      // Widget基底クラス
, "./Collapsible" // 開閉機能
, "./readonly"
, "sugar"         // sugar.js ライブラリ
],
function($, global, Widget, Collapsible, readOnly) { "use strict";
  /**
   * ツリーリスト
   * ============================================
   * ツリーリストは、論理的階層構造をもつ要素のリストを階層化して表示する機能をもつ。
   *
   * 本機能は、テーブルやプルダウンリストを含む、任意の要素リストを階層化して表示することができる。
   * 各階層はアイコンをクリックすることで開閉することができる。
   * また、階層の状態はサブミット時に送信される。
   * このため、ウィンドウスコープと併用すれば、画面遷移間で階層の状態を維持することができる。
   *
   * **階層構造の定義**
   * ツリーリスト内の各要素はid属性値の値に従って階層化される。
   * ユーザIDや商品コードの体系に論理的な階層構造が存在している場合は、その値をid属性に出力する
   * ことにより、階層表示が可能となる。
   *
   * また、コードが正規化されていて、親コードと明細コードに分離している場合は、それらを連結した値を
   * id属性に出力すればよい。
   *
   * 階層構造の定義は、文字数による分割、区切り文字による分割のいずれかの方法で行う。
   *
   * **階層操作**
   * 親項目の先頭部分に開閉処理を行うアイコンが追加される。
   * これをクリックすることで、子階層の表示・非表示を切り替えることができる。
   * また、各要素上のチェックボックス・ラジオボタンの内容を一括操作するコントロール(リンクorボタン)を
   * 追加することが可能である。
   *
   * マークアップ仕様
   * ------------------------
   *
   * **階層構造の定義**
   * リストとなる要素にマーカCSSクラス `nablarch_TreeList` を指定する。
   * また、リスト上の各要素に `nablarch_ListItem` を指定する。
   *
   * 以下は、テーブル内の各行をid属性値でソートし、階層表示する例である。
   *
   *     <table class="nablarch_TreeList
   *                   -name       formdata.treeListState
   *                   -hierarchy  chars:4|2|2|2
   *                   -items      tr:has(td)
   *                   -navigation td:first">
   *     ...
   *     </table>
   *
   * このウィジェットに指定するオプションは以下の5つである。
   *
   *   **-name (属性値):**
   *     各階層の開閉状態を保持するフォーム要素のname属性値。
   *     基本的に任意の文字列で構わないが
   *     開閉状態を画面遷移間で保持するには適切なウィンドウスコーププレフィックスから
   *     開始させる必要がある。
   *
   *   **-hierarchy (階層定義式):**
   *     各要素の階層構造を定義する方法。
   *     以下の3つの書式のうち、いずれかの方法で指定する。
   *
   *     1. chars:(数値)|(数値)|...|(数値)
   *       各要素のid属性値を先頭からの文字数で分割し階層を決定する方法。
   *
   *     2. separator:(区切り文字列)
   *       各要素のid属性値を区切り文字列で分割し階層を決定する方法。
   *
   *   **-depth (整数値):**
   *     階層の深さを指定する。
   *
   *   **-items (セレクタ式):**
   *     ツリー表示の対象要素を指定するセレクタ式
   *     例えば、"#table1 tr:has(td)" のように指定した場合は、テーブル内の各`<tr>`タグが
   *     対象となる。 (`has(td)` としているのは、ヘッダー行(th)を除外するため。)
   *
   *   **-navigation (セレクタ式):**
   *     各要素内でツリーの開閉を行うアイコンを挿入する要素を指定するセレクタ式。
   *     例えば、`td:first` とした場合は各`<tr>`要素の先頭列に開閉用のアイコンを挿入する。
   *
   * **階層の操作**
   * 階層を操作するための要素(input:checkboxタグ)に以下のマーカCSSクラスを指定する。
   *
   *   `toggleAll`
   *       チェックボックスまたはラジオボタンの全選択/全解除を行う事を表すクラス。
   *
   *     <td colspan="2">階層名</td>
   *     <td class="check">
   *       <input class="toggleAll
   *             -name  formdata.availableRequestIds
   *             -value ${row.id}"
   *             type="checkbox"
   *             name="formdata.availableRequestIds"
   *             value="${row.id}" />
   *     </td>
   *
   * ここで指定するオプションは以下の2つである。
   *
   *   **-name (属性値):**
   *     操作対象のチェックボックスまたはラジオボタンのname属性値。
   *
   *  **-value:**
   *    操作対象のチェックボックスまたはラジオボタンのvalue値(先頭一致)。
   *    ここで設定した値で開始されるvalue属性を持つチェックボックスまたはラジオボタンが操作対象となる。
   *
   * @class nablarch.ui.TreeList
   *
   * @author Iwauo Tajima
   * @since  1.2
   */
  TreeList.prototype = Object.merge(new Widget(),  {
    /**
     * コンストラクタ関数
     *
     * 第2引数に渡すオプションオブジェクトの内容は以下のとおり。
     *
     *   - name: 各階層の開閉状態を保持するフォーム要素のname属性値
     *   - hierarchy: 各要素の階層構造を定義する方法を表す文字列
     *   - depth: 階層の深さ
     *   - items: ツリー表示の対象要素を指定するセレクタ式
     *   - navigation: 各要素内でツリーの開閉を行うアイコンを挿入する要素を指定するセレクタ式。
     *
     * @method TreeList
     * @constructor
     *
     * @param {Element} element マーカCSSを指定したDOMノード
     * @param {Object} opts 各種オプションを保持するオブジェクト
     * @return {TreeList} インスタンス
     */
    constructor : TreeList
    /**
     * ツリーの開閉状態の保持に使用するフォーム要素のname属性値
     * @property name
     * @type {String}
     */
  , name: null
    /**
     * 階層定義関数
     * @property hierarchy
     * @type {Function}
     */
  , hierarchy: null
    /**
     * 階層の深さ
     * @property depth
     * @type {Number}
     */
  , depth: null
    /**
     * ツリー表示の対象要素を格納したjQuery結果セット
     * @property $items
     * @type {jQuery}
     */
  , $items: null
    /**
     * フォーム要素に保持した開閉状態を表示に反映させる。
     *
     * @method render
     * @chainable
     */
  , render: TreeList_render
    /**
     * 子階層のチェックボックスをまとめて切り替える。
     *
     * @method toggleAll
     * @param {jQuery.Event} event イベントオブジェクト
     * @chainable
     */
  , toggleAll: TreeList_toggleAll
  });

  /**
   * イベント定義
   * @property event
   * @static
   * @readOnly
   * @type Object
   * @for nablarch.ui.TreeList
   */
  TreeList.event = {
    "$toggleCheckBox click": "toggleAll"
  };

  /**
   * ウィジェットの識別名
   * @property widgetType
   * @static
   * @readOnly
   * @type String
   * @for nablarch.ui.TreeList
   */
  TreeList.widgetType = "nablarch_TreeList";

  /** 各要素の階層値の格納キー */
  TreeList.dataKey = "data-hierarchy";

  Widget.register(TreeList);

  /** コンストラクタ */
  function TreeList(element, opts) {
    this.name       = opts.name;
    this.hierarchy  = parseHierarchy(opts.hierarchy);
    this.depth      = opts.depth;
    this.navigation = opts.navigation;
    this.$items     = $(element).find(opts.items);
    this.$container = this.$items.first().parent();

    this.constructor = TreeList;
    Widget.call(this, element);

    this.$toggleCheckBox = $(element).find("input:checkbox").hasClass(".toggleAll.-name.-value");

    this.render();
  }

  /**
   * 子階層のチェックボックスおよびラジオボタンをまとめてON/OFFする。
   * @param {jQuery.Event} event イベントオブジェクト
   */
  function TreeList_toggleAll(event) {
    var $target   = $(event.target)
      , opts      = $target.widgetOption()
      , name      = opts.name
      , value     = opts.value || ""
      , hierarchy = this.hierarchy
      , check     = $target.prop('checked')
      , $checkboxes
      , currentValue;

    if (!name) {
      return this;
    }
    value = hierarchy(value).join("_");
    $checkboxes = this.$items.find("input")
                 .filter("[name='" + name + "']")
                 .filter(":checkbox, :radio")
                 .filter(":not(." + readOnly.markerCss + ")")
                 .filter(function() {
                    currentValue = hierarchy($(this).val()).join("_");
                    if (currentValue.length < value.length) {
                      return false;
                    } else if (currentValue.length == value.length) {
                      return currentValue === value;
                    } else {
                      return currentValue.indexOf(value) == 0 && currentValue[value.length] === '_';
                    }
                  });
    check = (check === true)  ? true
          : (check === false) ? false
          : ($checkboxes.filter(":not(:checked)").length > 0);
    $checkboxes.prop("checked", check);
    return true;
  }

  function TreeList_render() {
    var self = this
      , tree = new TreeNode()
      , nodeList = [];

    this.$items.detach().each(function() {
      var currentNode = tree
        , $item       = $(this)
        , hierarchy   = self.hierarchy(this.id)
        , maxDepth    = self.depth
        , key
        , depth
        , len;

      $item.attr(TreeList.dataKey, hierarchy.join("_"));
      for (depth = 0, len = hierarchy.length; depth < len; depth++) {
        key = hierarchy[depth];
        if (depth === len-1) {
          $item.addClass("depth_" + (depth + 1));
          if (depth !== maxDepth-1) {
            $item.addClass("folder");
          }
          currentNode.add(key, this);
        }
        else {
          currentNode.add(key);
        }
        currentNode = currentNode.children[key];
      }
      nodeList.push([hierarchy.join("_"), $item]);
    });
    nodeList.sort();

    // 最下層の背景色を交互に色付けする。
    this.$items.filter(".depth_" + (this.depth) + ":even").addClass("even_row");
    this.$items.filter(".folder").each(function() {
      var $item = $(this)
        , hierarchy = $item.attr(TreeList.dataKey);

      $item.find(self.navigation)
      .widget(Collapsible, {
         name   : self.name
       , value  : hierarchy
       , content: findChildren()
      });

      function findChildren() {
        var item, i, len, results = [], inRange = false;
        for (i = 0, len = nodeList.length; i < len; i++) {
          item = nodeList[i];

          if (item[0].indexOf(hierarchy) == 0) {
            inRange = true;
            if (item[0].length != hierarchy.length) {
              results.push(item[1]);
            }
          } else {
            if (inRange) break;
          }
        }
        return results;
      }
    });

    var root = document.createDocumentFragment();
    tree.walk(function(node, k) {
      var item = node.value;
      if (item) {
        root.appendChild(node.value);
      }
    });
    //this.$node.append(root);
    this.$container.append(root);
  }

  /**
   * -hierarchy オプションの内容をパースする。
   */
  function parseHierarchy(definition) {
      var m    = /^(chars|separator|function)\s*\:\s*(.*)/.exec(definition)
        , type = m && m[1]
        , expr = m && m[2];

    return (type === "chars")     ? charsHierarchy(expr)
         : (type === "separator") ? separatedHierarchy(expr)
         : (type === "function")  ? customHierarchy(expr)
         : null;
  }

  function separatedHierarchy(separator) {
    return function(id) {
      return id.split(separator).compact();
    };
  }

  function customHierarchy(funcname)  {
    var func = funcname && global[funcname];
    if (!Object.isFunction(func)) {
      throw new Error("undefined global function: " + funcname);
    }
    return func;
  }

  /**
   * -hierarchy オプションが
   * 　chars:(数値)|(数値)|...
   * 形式で指定された場合に、その内容をパースする。
   */
  function charsHierarchy(expr) {
    var hierarchy = expr.split("|").map(function(d){ return Number(d); });
    return function(id) {
      var head = 0;
      return hierarchy.map(function(chars) {
        var segment = id.substr(head, chars);
        head = head + chars;
        return segment.length ? segment : null;
      }).compact();
    };
  }

  /**
   * 階層型のデータ構造を保持するためのヘルパークラス。
   */
  TreeNode.prototype = {
    // properties
    children : null // このノードの子ノード
  , value    : null // このノードの値
    // methods
    /**
     * このノードに指定された名前の子ノードを追加し、そのノードに値を設定する。
     * 既に同じ名前のノードが追加されていた場合は値のみを上書く。
     * 値を省略した場合はノードの追加のみ行う。
     *
     * @param {String} k 追加する子ノードの名前
     * @param {Object} v 追加する子ノードに設定する値
     */
  , add: function(k, /*optional*/ v) {
      if (!Object.has(this.children, k)) {
        this.children[k] = new TreeNode();
      }
      if (arguments.length >= 2) {
        this.children[k].value = v;
      }
    }
    /**
     * このノードおよび配下の全ノードに対して、指定された処理を順次実行する。
     * @param {Function(TreeNode)} 各ノードに対して実行する処理。
     */
  , walk: function(action) {
      action.call(this, this, "");
      Object.keys(this.children, function(k, child) {
        action.call(child, child, k);
        child.walk(action);
      });
    }
  };

  /**
   * コンストラクタ関数
   * @returns {TreeNode}
   */
  function TreeNode() {
    this.children = {};
    this.value    = null;
  }

  return TreeList;
});

