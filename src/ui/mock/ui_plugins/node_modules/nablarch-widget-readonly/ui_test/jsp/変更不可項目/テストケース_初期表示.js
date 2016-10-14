require(["nablarch/ui/DatePicker"],
function(DatePicker) {
  var $dateField, $radiobuttons;
  
  runTest(
    初期表示時にnablarch_readonlyが指定された要素は全てdisabledになること
  , サブミット時にはdisabledが解除され値が送信されること        
  , API呼び出しによるnablarch_readonly属性の設定と解除が可能なこと
  );
  
  function setup() {
    $dateField    = $("input[name='formdata.flightDate']");
    $radiobuttons = $("input[name='formdata.sheetGrade']");
  }
 
  function 初期表示時にnablarch_readonlyが指定された要素は全てdisabledになること() {
    setup();
    ok($dateField.is(":disabled"), "入力フィールドがdisabled状態になる");
    ok($radiobuttons.is(":disabled"), "ラジオボタンもdisabled状態になる");
  }
  
  function サブミット時にはdisabledが解除され値が送信されること() {
    setup();
    $(document).one("beforeSubmit", function(event, submitName, form) {
      equal($(form["formdata.flightDate"]).filter(":not(:disabled)").val(),
            "2012/10/10", "disabledが解除され送信される");
      equal($(form["formdata.sheetGrade"]).filter(":checked:not(:disabled)").val(),
            "business", "disabledが解除され送信される");
      form.reset();
      return false;
    });
    $("#check").click(); // 「登録」ボタンをクリック
  }
  
  function API呼び出しによるnablarch_readonly属性の設定と解除が可能なこと() {
    setup();
    $("input[type='radio']").readonly(true); // 更新不可に
    
    equal($radiobuttons.filter(":disabled").length, 3,
          "readonly(true) でdisabledに");
    equal($radiobuttons.filter(".nablarch_readonly").length, 3,
          "nablarch_readonly クラスが指定される");    
    
    $("input[type='radio']").readonly(false); // 更新可能に
    
    equal($radiobuttons.not(":disabled").length, 3,
          "readonly(false) でdisabledが解除");
    equal($radiobuttons.not(".nablarch_readonly").length, 3,
          "nablarch_readonly クラスも外れる");
  }
});
