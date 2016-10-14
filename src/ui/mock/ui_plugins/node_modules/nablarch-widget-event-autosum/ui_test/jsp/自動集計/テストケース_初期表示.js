  runTest(
    自動集計できること
  , 自動集計で減算もできること
  , カンマ編集されていても自動計算できること
  , 数字以外を入力フィールドに入力した場合は結果がNaNになること
  , disabled属性およびnablarch_readonly項目が正しく処理されること
  , 有効桁のテスト
  );  
//  , 確認画面の遷移では自動集計が行われないこと
// ,  エラー時の再描画で自動集計できること


  var $input1,
    $input2,
    $input3,
    $input4,
    $input5,
    $input_disabled,
    $input_readonly,
    $sum1,
    $sum2;

  /**
   * テスト用のセットアップ処理。
   */
  function testSetup() {
    $input1 = $("#amount1_1");
    $input2 = $("#amount1_2");
    $input3 = $("#amount1_3");
    $input4 = $("#amount2_1");
    $input5 = $("#amount2_2");
    $input_disabled = $("#amount3_1");
    $input_readonly = $("#amount3_2");
    $sum1 = $("#autoSum1");
    $sum2 = $("#autoSum2");
  }

  /**
   * 自動集計のテスト。
   * 単純に複数項目の入力フィールドを順に入力していき、
   * 合計部の表示値がリアルタイムに変更されていくことを確認する。
   *
   * 合計部には、spanタグを使用
   */
  function 自動集計できること() {
    testSetup();
    
    // 0クリア
    $input1.val("0");
    $input2.val("0");
    $input3.val("0");
    $input1.trigger('focusout');
    equal($sum1.text(), "0", "全ての入力フィールドが0なので合計も0になる。");

    // 1つめの入力フィールドに値を設定
    $input1.val("999.99");
    $input1.trigger('focusout');
    equal($sum1.text(), "999.99", "1つめの入力フィールドに値をいれたので、その値が合計に設定される。");

    // 2つめの入力フィールドに値を設定
    $input2.val("0.05");
    $input2.trigger('focusout');
    equal($sum1.text(), "1,000.04", "2つめの入力フィールドに値を入れたので、input1との合計が設定される。");

    // 3つめの入力フィールドに値を設定
    $input3.val("0.06");
    $input2.trigger('focusout');
    equal($sum1.text(), "1,000.1", "3つめの入力フィールドに値を入れたので、input1とinput2との合計が設定される。");
  }

  /**
   * 減算を含む自動集計のテスト。
   *
   * 合計部には、input type=textを使用。
   */
  function 自動集計で減算もできること() {
    testSetup();
    
    // 0クリア
    $input4.val("0");
    $input5.val("0");
    $input_disabled.val("0");
    $input_readonly.val("0");
    
    
    $input4.trigger('focusout');
    equal($sum2.val(), "0", "全ての入力フィールドが0なので合計も0になる。");

    // 1つめの入力フィールドに値を設定
    $input4.val("1000");
    $input4.trigger('focusout');
    equal($sum2.val(), "1,000", "1つめの入力フィールドに値を設定したので、その値が合計に設定される。");

    // 2つめの入力フィールドに値を設定
    $input5.val("1000");
    $input5.trigger('focusout');
    equal($sum2.val(), "0", "2つめのフィールドは減算対象なので、1つめと同じ値を入れた場合結果は0になる。");

    // 2つめの入力フィールドの値が大きい場合(マイナスになる計算)
    $input4.val("999.99");
    $input5.val("1000");
    $input5.trigger('focusout');
    equal($sum2.val(), "-0.01", "2つめのフィールドの値が大きいので、結果はマイナスになる");
  }
  
  /**
   * 減算を含む自動集計のテスト。
   *
   * 合計部には、input type=textを使用。
   */
  function disabled属性およびnablarch_readonly項目が正しく処理されること() {
    testSetup();
    
    // 初期化
    $input4.val("10");
    $input5.val("100");
    $input_disabled.val("0");
    $input_readonly.val("0");
    
    $input4.trigger('focusout');
    equal($sum2.val(), "-90", "初期状態");
    
    $input_disabled.val("10000");
    $input4.trigger('focusout');
    equal($sum2.val(), "-90", "disabled項目は集計対象とならないこと。");
    
    $input_readonly.val("90");
    $input4.trigger('focusout');
    equal($sum2.val(), "0", "readonly項目は集計対象となること。");    
  }  

  /**
   * カンマ編集されている場合の自動集計のテスト。
   */
  function カンマ編集されていても自動計算できること() {
    testSetup();

    // 入力内容クリア
    $input1.val("");
    $input2.val("");
    $input3.val("");
    $input3.trigger('focusout');
    equal($sum1.text(), "0", "全ての入力フィールドが空なので0になる。");

    // 1つめの入力フィールドに値を設定
    $input1.val("1,000");
    $input2.val("1,000,000");
    $input3.val("2,0,0,0,");    // カンマの位置が不正な場合も無視される。
    $input3.trigger('focusout');
    equal($sum1.text(), "1,003,000", "全ての入力フィールドの合計が設定される。");
  }

  /**
   * カンマ編集されている場合の自動集計のテスト。
   */
  function カンマ編集されていても自動計算できること() {
    testSetup();

    // 入力内容クリア
    $input1.val("");
    $input2.val("");
    $input3.val("");
    $input3.trigger('focusout');
    equal($sum1.text(), "0", "全ての入力フィールドが空なので0になる。");

    $input1.val("1,000");
    $input2.val("1,000,000");
    $input3.val("2,000.123");
    $input3.trigger('focusout');
    equal($sum1.text(), "1,003,000.123", "全ての入力フィールドの合計が設定される。");
  }

  /**
   * 数字以外を入力した場合
   */
  function 数字以外を入力フィールドに入力した場合は結果がNaNになること() {
    testSetup();
  
    // 入力内容クリア
    $input1.val("");
    $input2.val("");
    $input3.val("");
    $input3.trigger('focusout');
    equal($sum1.text(), "0", "全ての入力フィールドが空なので0になる。");

    $input1.val("abcd");
    $input2.val("あいうえお");
    $input3.val("2.123");    // カンマの位置が不正な場合も無視される。
    $input3.trigger('focusout');
    equal($sum1.text(), "NaN", "NaNとなる");
  }

  /**
   * 有効桁のテスト
   */
  function 有効桁のテスト() {
    testSetup();

    // 入力内容クリア
    $input1.val("");
    $input2.val("");
    $input3.val("");
    $input3.trigger('focusout');
    equal($sum1.text(), "0", "全ての入力フィールドが空なので0になる。");

    // 最大桁15桁を入力
    $input1.val("999999999999999");
    $input1.trigger('focusout');

    equal($sum1.text(), "999,999,999,999,999", "最大桁なので計算できる");

    // 最大桁をマイナスした場合結果は0になる
    $input2.val("-999999999999999");
    $input2.trigger('focusout');
    equal($sum1.text(), "0", "最大桁 - 最大桁は0");

    // 最大桁 + 1はNaN
    $input2.val("1");
    $input2.trigger('focusout');
    equal($sum1.text(), "NaN", "桁数超過でNaN");

  }

  /**
   * エラー時の自画面遷移（再描画）でも自動集計が行われること
   */
  function エラー時の再描画で自動集計できること() {
    testSetup();
  
    equal($sum1.text(), "3", "数値が入力されたフィールドの合計が設定されていること");
    equal($sum2.val(), "-1,000", "数値が入力されたフィールドの合計が設定されること");
  }

  /**
   * 確認画面への遷移時は、自動集計が行われないこと。
   */
  function 確認画面の遷移では自動集計が行われないこと() {
    testSetup();
  
    equal($sum1.text(), "600", "サーバ再度で計算した値が表示されること");
  }


