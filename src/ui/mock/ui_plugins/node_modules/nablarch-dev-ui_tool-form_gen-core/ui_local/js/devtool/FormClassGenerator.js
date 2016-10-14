define([
  'jquery'
, './resource'
, 'text!./resource/フォーム基底クラステンプレート.java'
, './SpecSheetItems'
, 'sugar'],
function($, resource, template) { 'use strict';


  $.fn.spec_formFields = function() {
    return $.findJspTag('field:', this)
            .filter(function(){return !resource.tagSpec($(this)).ignoredInForm })
            .spec_flattenComplexFields();
  };

  $.fn.spec_usesListSearchInfo = function() {
    return (this.find('[listsearchinfoname]').length > 0);
  };

  $.fn.spec_getAnnotationsOnFormProperty = function() {
    var $tag = $(this);
    return [
      PropertyName()
    , Required()
    ]
    .concat(Validators())
    .compact()
    .join('\n    ')
    .trimRight();

    // ----- subroutines ----- //
    function PropertyName() {
      return '@PropertyName("' + $tag.spec_attr('title') + '")';
    }

    function Required() {
      return $tag.spec_attr('required') === 'required'
           ? '@Required'
           : null;
    }

    function Validators() {
      var domainInfo = resource.domainInfo($tag.spec_attr('domain'))
        , codeId     = $tag.spec_attr('codeId')
        , params     = {};

      if (codeId) {
        params.codeId  = codeId;
        params.pattern = $tag.spec_attr('pattern') || 'PATTERN01';
      }
      return domainInfo ? domainInfo.validators(params) : null;
    }
  };

  $.fn.spec_javaType = function() {
    var $tag       = $(this)
      , domainInfo = resource.domainInfo($tag.spec_attr('domain'))
      , tagSpec    = resource.tagSpec($tag);
    return (domainInfo && domainInfo.isNumeric()) ? 'BigDecimal'
         : ((tagSpec && tagSpec.multiple) || isMultiple($tag)) ? 'String[]'
                                                  : 'String';

    function isMultiple($tag) {
      var jspAttrs = $tag.jsp_attrs('multiple');
      return jspAttrs && jspAttrs.multiple === 'true';

    }
  };

  $.fn.spec_entityNames = function() {
    return $(this.find('[dataFrom]').map(function() {
      return $(this).spec_attr('dataFrom').split('.').first().camelize();
    }).get().unique());
  };

  $.fn.spec_flattenComplexFields = function() {
    var fields = [];
    this.each(function() {
      var $tag       = $(this)
        , fieldTitle = $tag.spec_attr('title')
        , tagSpec    = resource.tagSpec($tag);

      if (!tagSpec.complex) {
        fields.push(this);
      }
      else {
        tagSpec.complex.split('|').each(function(def, i) {
          var m     = /([^(]+)\(([^)]+)\)/.exec(def)
            , title = m && m[1]
            , name  = m && m[2]
            , domains   = $tag.spec_attrAsArray('domain')
            , dataFroms = $tag.spec_attrAsArray('dataFrom');

          fields.push(
            $tag.clone()
                .attr('title',fieldTitle + '(' + title + ')')
                .attr('name', $tag.spec_attr(name))
                .attr('domain', domains[i])
                .attr('dataFrom', dataFroms[i])
                .get(0)
          );
        });
      }
    });
    return $(fields);
  };

  $.fn.jsp_downloadFormSource = function(preview) {
    return this.wrap($('<a>').on('click', download));

    // ----- subroutines ----- //
    function download() {
      var $jsp       = $('<div>').append(preview.$jsp)
        , gamenId    = document.location.pathname.replace(/^.*?([^\/]+)\.jsp$/, '$1')
        , fileName   = gamenId.first(7) + 'FormBase.java'
        , sourceCode = evalTemplate(template);

      this.download = fileName;
      this.href     = 'data:text/plain;charset=utf-8,'
                    + sourceCode.escapeURL(true);

      // ----- subroutines ---- //
      function evalTemplate(str, item) {
        var buffer   = []
          , template = null
          , regex    = /([\s\S]*?)\{\{(=|@[A-Z]+)([\s\S]*?)\}\}/g
          , lastIndex, m;

        while (m = regex.exec(str))  {
          var content    = m[1]
            , directive  = m[2]
            , expression = m[3]
            , eachList;

          lastIndex = m.index + m[0].length;
          if (template && (directive === '@END')) {
            template.push(content);
            eachList.each(function() {
              buffer.push(evalTemplate(template.join(''), this));
            });
            template = null;
            continue;
          }

          if (template) {
            template.push(m[0]);
            continue;
          }

          buffer.push(content);

          if (directive === '=') {
            buffer.push(interpolate(expression, item));
          }

          if (directive === '@EACH') {
            template = [];
            eachList = interpolate(expression, item);
          }
          if (directive === '@IF') {
            var condition = interpolate(expression, item);
            template = [];
            eachList = condition ? [condition] : []
          }
        }
        buffer.push(str.slice(lastIndex));
        return buffer.join('');
      }

      function interpolate(expr, item) {
        var result = new Function('jsp', '$jsp', 'gamenId', 'item',
          'return (' + expr.replace('\n', ' ') + ');'
        ).apply(null, [$.findJspTag.bind($jsp), $jsp, gamenId, item]) || '';
        return result;
      }
    }
  }
});
