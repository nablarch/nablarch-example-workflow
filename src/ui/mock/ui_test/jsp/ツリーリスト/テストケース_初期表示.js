
  runTest(
        初期表示時に論理的な階層構造に従って自動的に並びかえられること
      , 前画面から送信された開閉状態が初期表示に反映されること
      , アイコン部をクリックすることでサブ階層を開閉できること     
      , チェックボックスラジオボタンの一括変更が可能なこと
      , サブミット時に開閉状態が送信されること
      , 区切り文字による階層構造定義が可能なこと
  );

  var $dateField, $radiobuttons
    , $treeTable, $treeTable2, $treeTable3
    , $subsection;
  
  function setup() {
    $treeTable  = $(".nablarch_TreeList table").first();
    $treeTable2 = $(".nablarch_TreeList table").eq(1);
    $treeTable3 = $(".nablarch_TreeList table").eq(2);
    $subsection = $("h2.nablarch_Collapsible");
  }
 
  function 初期表示時に論理的な階層構造に従って自動的に並びかえられること() {
    setup();
    equal($treeTable.find("tr:has(td)").map(function(){ return this.id; }).get().join(","),
    [ "RW11AA"
    , "RW11AA0101"
    , "RW11AA0102"
    , "RW11AB"    
    , "RW11AB0101"
    , "RW11AC"
    , "RW11AC01"
    , "RW11AC0101"
    , "RW11AC0102"
    , "RW11AC0103"
    , "RW11AC0104"
    , "RW11AC02"
    , "RW11AC0201"
    , "RW11AC0202"
    , "RW11AC0203"
    , "RW11AC0205"
    , "RW11AC0204"
    , "RW11AC03"
    , "RW11AC0301"
    , "RW11AC0302"
    , "RW11AC0303"
    , "RW11AC0304"
    ].join(","), "IDの階層定義順に並び替えられること");
  }
  
  function 前画面から送信された開閉状態が初期表示に反映されること() {
    setup();
    var $openStatus = $(":input[name='formdata.blockOpenStatus']");
    equal($openStatus.val(),  "RW11AB", "前画面でRW11ABが閉じた状態");
    ok($("tr#RW11AB td:first").is(".-closed"), "当該の要素のアイコン部にclosedクラスが付加される");
    ok($rows("RW11AB0").length > 0 && $rows("RW11AB0").not(":hidden").length === 0,
       "RW11AB配下の要素が非表示になる");
    ok($rows("RW11AA0").length > 0 && $rows("RW11AA0").add($rows("RW11AC")).filter(":hidden").length === 0,
       "その他の要素は表示される");    
  }
  
  function アイコン部をクリックすることでサブ階層を開閉できること() {
    setup();
    var $button_RW11AC = $("tr#RW11AC td:first");
    ok($button_RW11AC.not(".-closed"), "アイコンは開いた状態");
    ok($rows("RW11AC0").length > 0 && $rows("RW11AC0").filter(":hidden").length === 0,
       "配下の列も全て開いた状態");
    
    $button_RW11AC.click(); // ボタンをおす
    
    ok($button_RW11AC.is(".-closed"), "クリックするとアイコンは閉じた状態に変化");
    ok($rows("RW11AC0").length > 0 && $rows("RW11AC0").not(":hidden").length === 0, 
       "配下の列も全て閉じる");
    
    $button_RW11AC.click(); // 再度ボタンをオス
    ok($button_RW11AC.not(".-closed"), "再度クリックするとアイコンは開いた状態に");
    ok($rows("RW11AC0").length > 0 && $rows("RW11AC0").filter(":hidden").length == 0,
       "配下の列も全て開いた状態にもどる");
    
    var $button_RW11AC02 = $("tr#RW11AC02 td:first");
    $button_RW11AC02.click();
    
    ok($button_RW11AC02.is(".-closed"), "サブ階層の開閉ボタンをクリックして閉じる");
    ok($rows("RW11AC020").length > 0 && $rows("RW11AC020").not(":hidden").length === 0,
       "サブ階層の要素が閉じる");
    ok($rows("RW11AC030").add($rows("RW11AC010")).filter(":hidden").length === 0,
      "サブ階層他の要素は開いたまま");
    
    $button_RW11AC.click(); //親階層を閉じる
    $button_RW11AC.click(); //親階層を開く
    
    ok($rows("RW11AC020").length > 0 && $rows("RW11AC020").not(":hidden").length === 0,
       "親階層を開閉してもサブ階層の開閉状態は維持される。");
    ok($rows("RW11AC030").add($rows("RW11AC010")).filter(":hidden").length === 0,
       "親階層を開閉してもサブ階層の開閉状態は維持される。");
  }
  
  function チェックボックスラジオボタンの一括変更が可能なこと() {
    
    ok($rows("RW11AC0").length > 0 && $rows("RW11AC0").find(":checkbox:checked").length === 0,
       "チェックは全てはずれている");
    
    $("#RW11AC02 .toggleAll").click(); 
    
    ok($rows("RW11AC020").find(":checkbox").length > 0 && $rows("RW11AC020").find(":checkbox").not(":checked").length === 0,
       "RW11ACの一括チェックボタンをおすと配下のチェックボックスが全てチェックされる。");
    
    equal($rows("RW11AC010").add($rows("RW11AC030")).find(":checkbox:checked").length, 0, 
          "RW11ACの兄弟要素はチェックされない。");
    
    $("#RW11AC02 .toggleAll").click();
    
    ok($rows("RW11AC020").find(":checkbox").length > 0 && $rows("RW11AC020").find(":checkbox").filter(":checked").length === 0,
       "RW11ACの一括チェックボタンをもう一度押すと配下のチェックボックスの選択が全て解除される。");
 
    equal($rows("RW11AC010").add($rows("RW11AC030")).find(":checkbox:checked").length, 0, 
          "RW11ACの兄弟要素はチェックされない。");
    
    $("#RW11AC .toggleAll").click();
    
    ok($rows("RW11AC0").find(":checkbox").length > 0 && $rows("RW11AC0").find(":checkbox").not(":checked").length === 0, 
       "親階層の一括チェックボタンをおすと兄弟要素も含めて全てチェックされる。");
  }  
   
  function サブミット時に開閉状態が送信されること() {
    setup();
    $(document).one("beforeSubmit", function(event, submitName, form) {
      var $openstatus = $(form).find(":input[name='formdata.blockOpenStatus']");
      equal($openstatus.length, 2, "サブミット時に開閉状態が送信されること");
      equal($openstatus.map(function(){return $(this).val();}).get().join(","),
            "RW11AB,RW11AC_02",
            "サブミット時に開閉状態が送信されること");

      form.reset();
      return false;
    });
    $("#check").click(); // 「登録」ボタンをクリック
  }
  
  function 区切り文字による階層構造定義が可能なこと() {
    setup();
    equal($treeTable2.find("tr:has(td)").map(function(){ return this.id; }).get().join(","),
    [ "RW11AA"
    , "RW11AA_1_1"
    , "RW11AA_1_2"
    , "RW11AB"
    , "RW11AB_1_1"
    , "RW11AC"
    , "RW11AC_1"
    , "RW11AC_1_1"
    , "RW11AC_1_2"
    , "RW11AC_1_3"
    , "RW11AC_1_4"
    , "RW11AC_2"
    , "RW11AC_2_1"
    , "RW11AC_2_2"
    , "RW11AC_2_10"
    , "RW11AC_2_20"
    , "RW11AC_2_30"
    , "RW11AC_3"
    , "RW11AC_3_1"
    , "RW11AC_3_2"
    , "RW11AC_3_3"
    , "RW11AC_3_4"
    ].join(","), "IDの階層定義順に並び替えられること");     
  }
  function $rows(id) {
    return $treeTable.find("tr[id^='"+id+"']");
  }

