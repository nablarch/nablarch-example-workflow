
  runTest(
      初期選択項目が1つも無い場合の初期表示確認                         
    , 項目を1つ選択して追加できること
    , サブミット時に選択した項目のみ送信されること
    , 選択中の項目を選択先リストから外せること
    , 全項目を追加できること
    , 全項目を削除できること
    , 複数のリストビルダーが存在していても正常に動作すること
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

  function 初期選択項目が1つも無い場合の初期表示確認() {
    setup();
    equal($from.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,テスト用,ユーザ情報登録"
        , "選択元リストに全候補がある。");
    
    equal($to.find("option").length, 0, "選択先リストは空");
  }
    
  function 項目を1つ選択して追加できること() {
    setup();
    $from.val("0000000002");              // 上から2番目の項目を選択
    $control.find("button.add").click();  // 追加ボタンを押

    equal($from.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,ユーザ情報登録"
        , "選択元リストから除去される。");
    equal($to.find("option").get().map("text").join(",")
        , "テスト用"
        , "選択先リストに追加される。");
  }
  
  function サブミット時に選択した項目のみ送信されること(items) {
    setup();
    $(document).one("beforeSubmit", function(event, submitName, form) {
      equal(
        $(form["formdata.permissionUnits"]).val().join("")
      , "0000000002"
      , "2番目の項目のみ送信される。"
      );
      form.reset();

      // firefoxはresetで画面表示時の状態の戻しても「display:none」は解除されないので、強制的に解除する
      $from.find('option').show();
      return false;
    });
    $("#check").click(); // 「確認」ボタンをクリック
  }  
  
  function 選択中の項目を選択先リストから外せること() {
    setup();
    $to.val("0000000002");                  // 先に追加した項目を選択
    $control.find("button.remove").click(); // 削除ボタンを押下
    
    equal($to.find("option").length, 0, "選択先リストは空になる");        
    equal($from.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,テスト用,ユーザ情報登録"
        , "選択元リストに全候補が戻る。");
  }
  
  function 全項目を追加できること() {
    setup();
    $control.find("button.addAll").click(); // 「全て追加」ボタンを押下
    
    equal($to.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,テスト用,ユーザ情報登録"
        , "全ての候補が選択先リストに移動する。");    
    equal($from.find("option").length, 0, "選択元リストは空になる。");
    equal($from2.find("option").length, 10, "対象のリスト以外は影響を受けない");
  }
  
  function 全項目を削除できること() {
    setup();
    $control.find("button.removeAll").click(); // 「全て削除」ボタンを押下
    
    equal($to.find("option").length, 0, "選択先リストは空になる");
    equal($from.find("option").get().map("text").join(",")
        , "ユーザ一覧照会,テスト用,ユーザ情報登録"
        , "選択元リストに全候補が戻る。");
  }
  
  function 複数のリストビルダーが存在していても正常に動作すること() {
    setup();
    
    // 1,3番めの候補を選択        
    $from.val(["0000000001","0000000003"]); 
    $from2.val(["0000000001","0000000003"]);

    // 2番目のリストの「追加」ボタンを押す    
    $control2.find("button.add").click();
    
    equal($to2.find("option").get().length, 2, "ボタンを押したリストの要素が移動");    
    equal($from2.find("option").length, 8, "ボタンを押したリストの要素が移動");
    equal($from.find("option").length, 3, "対象のリスト以外は影響を受けない");
  }
 