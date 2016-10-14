
  runTest(
    精査エラー時に前回選択した項目が保持されていること
  , 精査エラー後に再送信した場合に正しく送信できること
  );

  var $from, $to, $control;
  
  function setup() {
    $from    = $("#permissionUnit_from");
    $to      = $("#permissionUnit_to");
    $control = $(".nablarch_ListBuilder:first");
    
    $from2    = $("#groups_from");
    $to2      = $("#groups_to");
    $control2 = $(".nablarch_ListBuilder:eq(1)");
  }
  
  function 精査エラー時に前回選択した項目が保持されていること() {
    setup();
    equal($from.find("option").get().map("text").join(",")
        , "ユーザ情報登録"
        , "選択元リストの選択状態が保持される。");
    
    equal($to.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,テスト用"
        , "選択先リストの選択状態が保持される。");
  }
  
  function 精査エラー後に再送信した場合に正しく送信できること() {
    setup();
    $(document).one("beforeSubmit", function(event, submitName, form) {
      equal(
        $(form["formdata.permissionUnits"]).val().join(",")
      , "0000000001,0000000002"
      , "選択リスト上にある項目が送信される。"
      );
      form.reset();
      // firefoxはresetで画面表示時の状態の戻しても「display:none」は解除されないので、強制的に解除する
      $from.find('option').show();
      return false;
    });
    $("#check").click(); // 「確認」ボタンをクリック    
  }

