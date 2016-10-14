/**
 * @module devtool
 */
define(['jquery'
, 'jsp/context'
, './SpecSheetItems'
, 'sugar'],
function($, context) { "use strict";
  /**
   * 画面設計書ビュー
   *
   * JSPのDOMノードから画面設計情報を抽出し、
   * 画面設計書テンプレート上に出力する。
   *
   * @class devtool.SpecSheetInterpreter
   * @author Iwauo Tajima
   * @since 1.4
   */
  SpecSheetInterpreter.prototype = {
    /**
     * コンストラクタ関数
     *
     * @method ToolMain
     * @constructor
     * @param {jQuery} $specSheet 業務画面設計書テンプレートの
     *                 DOMノードを格納するjQuery結果セット
     */
    constructor: SpecSheetInterpreter
    /**
     * 業務画面設計書テンプレートのDOMノードを格納するjQuery結果セット
     * @property $specSheet
     * @type jQuery
     */
  , $specSheet: null
    /**
     * 業務画面JSPのDOMノードの内容を業務画面設計書テンプレート上に出力する。
     * @method eval
     * @param {jQuery} $jsp 業務画面JSPのDOMノードを
     *                      格納したjQuery結果セット
     */
  , eval: SpecSheetInterpreter_eval
  };

  function SpecSheetInterpreter($specSheet) {
    tidyUp();
    this.$specSheet = $specSheet;

    // --- subroutines --- //
    function tidyUp() {
      var $head = $specSheet.find('tr:contains(COMMAND)').first();
      $specSheet.find('tr').slice(0, $head.index()+4).remove();
      $specSheet.find('ruby > span').remove();
    }
  };

  function SpecSheetInterpreter_eval($jsp) {
    var $rows = this.$specSheet.find('tr')
      , instructionOf = {
          INTERPOLATE: interpolate
        , TEMPLATE   : template
        , 'TEMPLATE{': nestedTemplate
        , '}'        : function() {}
        };

    $rows.each(function(){
      exec(this, Object.create(null));
    });

    this.$specSheet.find('col:nth-child(1), col:nth-child(2)').remove();
    this.$specSheet.find('td:nth-child(2)').remove();
    this.$specSheet.find('td:nth-child(1)').remove();
    return;

    //--------- subroutines -----------//
    function exec(row, data) {
      var $row = $(row)
        , name = $row.find('td').eq(0).text().trim()
        , arg  = $row.find('td').eq(1).text().trim()

      instruction = instructionOf[name];
      instruction && instruction.apply(row, [arg, data]);
    }

    function interpolate(arg, data) {
      $(this).find('td').each(function() {
        var cell    = this
          , $cell   = $(cell)
          , content = $(cell).text();
        data.cell = cell;
        $cell.empty();
        content = content.replace(/\{\{([^}]+)\}\}/g, function(_, expr) {
          var evaled = evalExpression(expr, data);
          if (evaled instanceof jQuery) {
            $cell.append(evaled);
            return '';
          }
          return evaled;
        });
        $cell.append(document.createTextNode(content));
      });
    }

    function evalExpression(expr, data) {
      var result = new Function('jsp', 'context', 'count', 'item', 'cell',
        'return (' + expr.replace('\n', ' ') + ');'
      ).apply(context, [$.findJspTag.bind($jsp), context, data.count, data.item, data.cell]) || '';
      //console.log(expr, ' --> ', result)
      return result;
    }

    function template(arg, data, nesting) {
      var template  = this
        , $template = $(template)
        , $nextRow  = $template.next('tr')
        , $items    = evalExpression(arg, data);

      $template.find('td').each(function() {
        var $cell = $(this)
          , w = Object.map($cell.css([
              'borderTopWidth'
            , 'borderRightWidth'
            , 'borderBottomWidth'
            , 'borderLeftWidth'
            ]), function(k, v){return parseInt(v) > 0 ? '0.5pt' : '0'})
          , style = 'border-width: '
                  + w.borderTopWidth    + ' '
                  + w.borderRightWidth  + ' '
                  + w.borderBottomWidth + ' '
                  + w.borderLeftWidth   + ';'
                  + 'border-style: solid;'
                  + 'word-break: break-all;'
                  + 'vertical-align: top;';
        $cell.attr('style', style);
      });

      $items.each(function(index) {
        var row  = $template.clone(true)[0]
          , base = data.base ? $(data.base) : $template;
        data.item = this;
        data.count = index + 1;
        interpolate.call(row, arg, data);
        if (nesting) {
          base.before(row);
          exec($nextRow[0], {item: data.item, count: 1, base: $(row).next('tr')[0]});
        }
        else {
          base.before(row);
        }
      });
      $template.remove();
      if (nesting) {
        $nextRow.remove();
      }
    }

    function nestedTemplate(arg, data) {
      template.apply(this, [arg, data, true]);
    }

  }
  return SpecSheetInterpreter;
});
