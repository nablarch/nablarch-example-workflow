define([
  './resource/タグ定義'
, './resource/メッセージ定義'
, './resource/画面一覧'
, './resource/ドメイン定義'
, './resource/データタイプ定義'
, './resource/精査処理定義'
, './resource/コード値定義'
, 'sugar'],
function(tagSpec, messageDef, pageList, domainDef, dataTypeDef, validationDef, codeDef) { 'use strict';

  function getDomainInfo(id) {
    var data = domainDef[id];
    return data ? new DomainInfo(id, data)
                : null;
  }

  DomainInfo.prototype = {
    id   : null
  , data : null
  , name : null
  , validators: DomainInfo_validators
  , isNumeric: DomainInfo_isNumeric
  , isVariableLength: DomainInfo_isVariableLength
  };

  function DomainInfo(id, data) {
    this.data  = data;
    this.id    = id;
    this.name  = data[0];
    this.type  = data[1];
    this.cType = data[4];
    this.size  = Number(data[2]);
    this.frac  = Number(data[3]);
    this.desc  = data[5];
  }

  function DomainInfo_isNumeric() {
    var dataType = dataTypeDef[this.type];
    return dataType && dataType[0].has('数値桁');
  }

  function DomainInfo_isVariableLength() {
    return this.cType.has('VAR') || this.cType.has('LOB');
  }

  function DomainInfo_validators(tagParams) {
    var self     = this
      , dataType = dataTypeDef[this.type]
      , rules    = {}
      , results  = [];

    rules[dataType[0]] = sizeRuleParams();
    rules[dataType[1]] = formatRuleParams();

    Object.each(additionalRules(), function(typeName, params) {
      Object.merge(params, tagParams);
      if (rules[typeName]) {
        Object.merge(rules[typeName], params);
      }
      else {
        rules[typeName] = params;
      }
    });

    Object.each(rules, function(typeName, params) {
      results.push(validationRule(typeName, params));
    });

    return results.compact();

    //---- subroutines ----//
    function sizeRuleParams() {
      var result = {};
      if (self.isNumeric()) {
        result.integer  = self.size - self.frac;
        result.fraction = self.frac;
      }
      else {
        result.max = self.size;
        if (!self.isVariableLength()) {
          result.min = self.size;
        }
      }
      return result;
    }

    function formatRuleParams() {
      var params = dataType.slice(2)
        , result = Object.merge({}, tagParams)
        , i, len, k, v;
      for (i=0, len=params.length; i < len; i=i+2) {
        k = params[i];
        v = params[i+1];
        if (v) {
          result[k] = v;
        }
      }
      return result;
    }

    function additionalRules() {
      var results = {}
        , pattern = new RegExp(/\[([^:\[]+):([^:\]]+)\]/g)
        , match, typeName, params;

      while (match = pattern.exec(self.desc)) {
        typeName = match[1];
        params   = {};

        match[2].split(',').each(function(param) {
          param = param.split('=');
          params[param[0].trim()] = param[1].trim();
        });
        results[typeName] = params;
      }
      return results;
    }

    function validationRule(type, params) {
      var def        = validationDef[type]
        , annotation = def && def[0]
        , paramNames = def && def.slice(1, -2)
        , rules  = [];

      if (!def) return;

      if (annotation === "@CodeValue") {
        paramNames.push('codeId');
        paramNames.push('pattern');
      }

      params = Object.select(params, paramNames);
      Object.each(params, function(k, v) {
        if (v) {
          rules.push('{1} = {2}'.assign(k, literal(v)));
        }
      });
      return def[0] + "(" + rules.compact().join(', ') + ")";
    }

    function literal(value) {
      var m;
      return (m = /^(TRUE)|FALSE$/i.exec(value)) ? !!(m[1])
           : (m = /^\d+(\.\d+)?$/.exec(value))   ? value
           : '"' + value + '"';
    }
  }

  function getMessage(id) {
    var definition = messageDef[id];
    return definition ? definition[0]
                      : '';
  }

  function getUiType(tagName) {
    var tag = tagSpec[tagName];
    return tag ? tag[0] : '';
  }

  function getDefaultLabel(tagName) {
    var tag  = tagSpec[tagName]
      , opts = tag && tag.last();
    return opts.defaultLabel || '';
  }

  function getTagSpec($tag) {
    var tagName = $tag.jsp_tagName()
      , spec = tagSpec[tagName];

    return spec
         ? { uiType       : spec[0]
           , defaultLabel : spec[1].defaultLabel || ''
           , complex      : spec[1].complex || ''
           , multiple     : !!spec[1].multiple
           , ignoredInForm: !!spec[1].ignoredInForm}
         : {};
  }

  function getPageName(pageId) {
    var page = pageList[pageId];
    return page ? page[0] : '';
  }

  function getCodeMap(codeId, pattern) {
    var values = codeColumn('codeValue')
      , sortOrder = codeColumn('sortOrder')
      , codeNames = codeColumn('codeValueName')
      , shortNames = codeColumn('SHORT_NAME')
      , optionalNames01 = codeColumn('OPTION01')
      , optionalNames02 = codeColumn('OPTION02')
      , optionalNames03 = codeColumn('OPTION03')
      , optionalNames04 = codeColumn('OPTION04')
      , optionalNames05 = codeColumn('OPTION05')
      , optionalNames06 = codeColumn('OPTION06')
      , optionalNames07 = codeColumn('OPTION07')
      , optionalNames08 = codeColumn('OPTION08')
      , optionalNames09 = codeColumn('OPTION09')
      , optionalNames10 = codeColumn('OPTION10')
      , pattern = codeColumn(pattern)

    var filtered = pattern.map(function(value, idx) {
      if (value === '1') {
        return {
            "value": values[idx]
          , "sortOrder": sortOrder[idx]
          , "codeName": codeNames[idx]
          , "shortName": shortNames[idx]
          , "OPTION01": optionalNames01[idx]
          , "OPTION02": optionalNames02[idx]
          , "OPTION03": optionalNames03[idx]
          , "OPTION04": optionalNames04[idx]
          , "OPTION05": optionalNames05[idx]
          , "OPTION06": optionalNames06[idx]
          , "OPTION07": optionalNames07[idx]
          , "OPTION08": optionalNames08[idx]
          , "OPTION09": optionalNames09[idx]
          , "OPTION10": optionalNames10[idx]
        };
      }
      return null;
    }).compact(true).sortBy(function(e) { return e['sortOrder'] })

    return filtered;

    function codeColumn(type) {
      var values = codeDef[codeId + '.' + type];
      if (!values || values.isEmpty()) {
        return []
      }
      return values[0].split('|')
    }
  }

  return {
    message      : getMessage
  , uiType       : getUiType
  , defaultLabel : getDefaultLabel
  , tagSpec      : getTagSpec
  , pageName     : getPageName
  , domainInfo   : getDomainInfo
  , codeMap      : getCodeMap
  };

});
