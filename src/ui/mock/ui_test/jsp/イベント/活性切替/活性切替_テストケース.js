require(["nablarch/ui/readonly", "nablarch/ui/selector"], function (readonly) {"use strict";

  runTest(
       必須項目のみで動作することの確認
     , reverse属性の確認
     , ラジオボタンをサポートすることの確認
     , プルダウンをサポートすることの確認
     , checkboxをサポートすることの確認
  );

  function 必須項目のみで動作することの確認() {
    var context = $("div#require_only_test")
      , $disabled  = context.find("#require_only_target_disable")
      , $readonly  = context.find("#require_only_target_readonly");
    doChange(context, 'input[name="formdata.require_only"]', 'available');
    ok($disabled.is(':enabled'), "値が条件に一致しない場合は活性状態(非活性)");

    doChange(context, 'input[name="formdata.require_only"]', "disable");
    ok($disabled.is(':disabled'), "値が条件に一致する場合は非活性状態");

    doChange(context, 'input[name="formdata.require_only"]', 'available');
    ok($readonly.is(':enabled'), "値が条件に一致しない場合は活性");
    doChange(context, 'input[name="formdata.require_only"]', 'readonly');
    ok($readonly.is(':disabled'), "値が条件に一致しない場合は活性");
  }

  function reverse属性の確認() {
    var context = $('div#reverse_attr_test')
      , trigger = 'input[name="formdata.reverse"]'
      , $targets = context.find('input:text.target')
      , reverse = ".reverse"
      , readonlyMark = ".onReadonly"
      , disabledMark = ".onDisabled";

    doChange(context, trigger, 'available');
    $targets.filter(not(reverse)).each(assertEnable("reverseがtrueでない項目は活性"));
    $targets.filter(reverse).each(assertDisable("reverseがtrueな項目は非活性"));

    doChange(context, trigger, 'readonly');
    $targets.filter(readonlyMark + not(reverse)).each(assertDisable("readonly && reverseでない => 非活性"));
    $targets.filter(readonlyMark + reverse).each(assertEnable("readonly && reverse => 活性"));

    doChange(context, trigger, 'disable');
    $targets.filter(disabledMark + not(reverse)).each(assertDisable("diabled && reverseでない => 非活性"));
    $targets.filter(disabledMark + reverse).each(assertEnable("disabled && reverse => 活性"));

    function not(selector) {
      return ':not(' + selector + ")";
    }

    function assertEnable(msg) {
      return function() {
        var $this = $(this);
        ok($this.is(':enabled'), msg + "[ " + this.id + " ]");
      };
    }
    function assertDisable(msg) {
      return function() {
        var $this = $(this);
        ok($this.is(':disabled'), msg + "[ " + this.id + " ]");
      };
    }
  }

  function ラジオボタンをサポートすることの確認() {
    var context = $("div[class*='toggle-radio']")
      , values = ["owner", "sales", "agency", "support"]
      , expected = {
          owner : { // 本人
             enable   : ['kanjiName', 'mailAddress', 'card', 'mobilePhoneNumber']
           , readonly : ['before']
          }
        , sales : { // 営業
            enable   : ['kanjiName']
          , readonly : ['before', 'mailAddress', 'card', 'mobilePhoneNumber']
          }
        , agency : { // 代理店
            enable   : ['kanjiName', 'mailAddress']
          , readonly : ['before', 'card', 'mobilePhoneNumber']
          }
        , support : { // サポート
            enable   : ['kanjiName', 'mailAddress', 'mobilePhoneNumber']
          , readonly : ['before', 'card']
        }
      }
      , assertReadonly = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                , msg   = "readonly fail [if " + key + " selected. " + $node.attr('name') + " is readonly]";
              ok($node.prop('disabled') && $node.is('.' + readonly.markerCss), msg);
            });
          };
        }
      , assertEnabled = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                 , msg   = "enabled fail [if " + key + " selected. " + $node.attr('name') + " is enabled]";
              ok(!$node.prop('disabled') && !$node.is('.' + readonly.markerCss), msg);
            });
          };
        };

    // 基点となるラジオが持つ値ごとにテストを実施。
    values.each(function(key){
      var select  = function (name) { return selector('formdata', name); }
        , readonly = expected[key]['readonly'].map(select)
        , enabled  = expected[key]['enable'].map(select);
      doChange(context, 'input:radio[name="formdata.switch-radio"]', key);

      readonly.each(assertReadonly(key, context));
      enabled.each(assertEnabled(key, context));

      ['kanjiName', 'mobilePhoneNumber', 'mailAddress', 'card'].map(select).each(function(selector){
        $(selector, context).readonly(false);
      });

    });
  }

  function プルダウンをサポートすることの確認() {
    var context = $("div[class*='toggle-pulldown']")
      , values = ["lawyer", "piper", "chef", "spaceman"]
      , expected = {
	      lawyer : { // 弁護士
            enable  : ['kanjiName', 'mailAddress', 'card']
          , disable : ['mobilePhoneNumber', 'before']
          }
        , piper : { // 配管工
            enable  : ['kanjiName', 'mobilePhoneNumber']
          , disable : ['mailAddress', 'card', 'before']
          }
        , chef : {  // 料理人
            enable  : ['kanjiName']
          , disable : ['mailAddress', 'card', 'mobilePhoneNumber', 'before']
          }
        , spaceman : { // 宇宙飛行士
            enable  : ['kanjiName', 'card']
          , disable : ['mailAddress', 'mobilePhoneNumber', 'before']
          }
        }
      , assertDisabled = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                , msg   = "if " + key + " selected. " + $node.attr('name') + " is disabled";
              ok($node.prop('disabled') && !$node.is('.' + readonly.markerCss), msg);
            });
          };
        }
      , assertEnabled  = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                 , msg   = "if " + key + " selected. " + $node.attr('name') + " is enabled";
              ok(!$node.prop('disabled') && !$node.is('.' + readonly.markerCss), msg);
            });
          };
        };

    values.each(function(key) {
      var select = function(name) {return selector('formdata_disabled', name);}
        , disabled = expected[key]['disable'].map(select)
        , enabled  = expected[key]['enable'].map(select);

      doChange(context, 'select[name="formdata_disabled.switch-select"]', key);

      disabled.each(assertDisabled(key, context));
      enabled.each(assertEnabled(key, context));

      ['kanjiName', 'mobilePhoneNumber', 'mailAddress', 'card'].map(select).each(function(selector){
        $(selector, context).prop('disabled', false);
      });
    });
  }

  function checkboxをサポートすることの確認() {
    var context = $("div[class*='toggel_checkbox']")
      , values = ["lawyer", "piper", "chef", "spaceman"]
      , expected = {
	      lawyer : { // 弁護士
            enable  : ['office']
          , disable : ['office', 'before']
          , reverse : true
          }
        , piper : { // 配管工
            enable  : ['dailyPay']
          , disable : ['dailyPay','before']
          , reverse : true
          }
        , chef : {  // 料理人
            enable  : []
          , disable : ['before']
          }
        , spaceman : { // 宇宙飛行士
            enable  : ['allergy']
          , disable : ['allergy', 'before']
          }
        }
      , assertDisabled = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                , msg   = "if " + key + " unselected. " + $node.attr('name') + " is disabled";
              ok($node.prop('disabled') && !$node.is('.' + readonly.markerCss), msg);
            });
          };
        }
      , assertEnabled  = function(key, context) {
          return function(selector) {
            $(selector, context).each(function () {
              var $node = $(this)
                 , msg   = "if " + key + " selected. " + $node.attr('name') + " is enabled";
              ok(!$node.prop('disabled') && !$node.is('.' + readonly.markerCss), msg);
            });
          };
        };

    values.each(function(key) {
      var select = function(name) {return selector('formdata_checkbox', name);}
        , disabled = expected[key]['disable'].map(select)
        , enabled  = expected[key]['enable'].map(select)
        , reverse = expected[key]['reverse']
        , $target   = $(context).find(":checkbox[value='" + key + "']");

      $target.prop('checked', !reverse).change();
      disabled.each(assertDisabled(key, context));

      $target.prop('checked', !!reverse).change();
      enabled.each(assertEnabled(key, context));

      ['office', 'dailyPay', 'allergy'].map(select).each(function(selector){
        $(selector, context).prop('disabled', false);
      });
    });
  }


 /**
  * 指定された値を設定した状態でchangeイベントを発火させる。
  *
  * @param context
  */
 function doChange(context, selector, val) {
   $(context).find(selector).val(val).prop('checked', true).change();
 }

 function selector(prefix, name) {
    return 'input[name^="' + prefix + '.' + name + '"]';
 }
});
