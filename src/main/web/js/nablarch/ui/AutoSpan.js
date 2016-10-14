define(['./Widget', 'jquery', 'sugar'],
function(Widget, $) { "use strict";
  /**
   * カラム値による自動行連結機能
   * =========================================
   * 上下に隣接するセルにおいて、特定の属性値が同じあった場合に自動的にセルを連結させる機能。
   * 本機能を用いることで場合、一般的な実装に比べてサーバサイド側のロジックを軽減することができる。
   *
   * なお、データのソートはサーバ側の処理で 事前に行っておく必要がある。
   *
   * 動作仕様
   * -------------------------------------
   * 以下の条件を満たすセルをrowspan を用いて連結する。
   * 連結後に残るのは、一番上側の列に存在するセルのみである。
   *
   * 1. selector属性に合致する。
   * 2. 上下方向に隣接している。
   * 3. data-autospan属性の値が一致している。
   *
   * マークアップ仕様
   * -------------------------------------
   * 次の例では「ユーザ名」カラムの data-autospan の値が一致する隣接セルが結合される。
   *
   *     <table>
   *       <tr>
   *         <th class="nablarch_AutoSpan -selector td.userName">ユーザ名</th>
   *         <th> 利用年月 </th>
   *         <th> 月別課金額 </th>
   *       </tr>
   *       <tr>
   *         <td class="userName" data-autospan="user001">ユーザ001</td>
   *         <td> 2009/12 </td>
   *         <td> 4321 円 </td>
   *       </tr>
   *       <tr>
   *         <td class="userName" data-autospan="user001">ユーザ001</td>
   *         <td> 2010/12 </td>
   *         <td> 5832 円 </td>
   *       </tr>
   *       <tr>
   *         <td class="userName" data-autospan="user001">ユーザ001</td>
   *         <td> 2011/1 </td>
   *         <td> 899 円 </td>
   *       </tr>
   *        ...
   *       <tr>
   *         <td class="userName" data-autospan="user002">ユーザ002</td>
   *         <td> 2009/10 </td>
   *         <td> 3455 円 </td>
   *       </tr>
   *       ...
   *     </table>
   *
   * @class nablarch.ui.AutoSpan
   *
   * @author Iwauo Tajima
   * @since 1.4
   */
  AutoSpan.prototype = Object.merge(new Widget(), {
  /**
   * コンストラクタ
   *
   * @method AutoSpan
   * @constructor
   * @param {HTMLElement} element マーカCSSを指定したDOMノード
   * @param {Object} option オプションを格納したオブジェクト
   *  **selector:** 結合対象のセルを指定するセレクタ式
   * @return {AutoSpan} インスタンス
   */
    constructor: AutoSpan
  /**
   * 結合対象のセルを指定するセレクタ式
   *
   * @property selector
   * @type String
   */
  , selector: null
  /**
   * 結合対象のセルを格納する結果セット
   * @property $cols
   * @type jQuery
   */
  , $cols: null
  /**
   * 結合対象のセルを含むテーブル
   * @property $table
   * @type jQuery
   */
  , $table: null
  /**
   * 現在の状態に沿って、カラムの結合処理を実行する。
   * method render
   * @type AutoSpan
   */
  , render: AutoSpan_render
  });
  /**
   * モジュール識別名
   * @property widgetType
   * @type String
   * @static
   * @final
   */
  AutoSpan.widgetType = 'nablarch_AutoSpan';
  Widget.register(AutoSpan);

  function AutoSpan(element, opts) {
    this.constructor = AutoSpan;
    Object.merge(this, opts);
    Widget.call(this, element);
    this.$table = this.$node.closest('table');
    this.render();
  }

  function AutoSpan_render() {
    var $rows = this.$table.find('tr:not(.nablarch_AdditionalColumnInlay)')
      , selector = this.selector;

    $rows.get().reduce(function(spanningCell, row) {
      var $cell = $(row).find(selector)
        , $spanning = $(spanningCell)
        , span;

      if (!spanningCell) {
        return $cell[0];
      }
      if ($spanning.attr('data-autospan') !== $cell.attr('data-autospan')) {
        return $cell[0];
      }
      span = Number($spanning.attr('rowspan')) || 1;
      $spanning.attr('rowspan', span + 1);
      $cell.remove();
      return $spanning[0];

    }, null);
    return this;
  }

  return AutoSpan;
});
