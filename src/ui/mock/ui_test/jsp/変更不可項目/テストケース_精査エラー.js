require(["nablarch/ui/DatePicker"],
function(DatePicker) {
  var $dateField, $radiobuttons;
  
  runTest(
    初期表示時にnablarch_readonlyが指定された要素は全てdisabledになること
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
 
});
