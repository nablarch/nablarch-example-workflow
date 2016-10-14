require(["nablarch/util/BigDecimal", "sugar"], function (BigDecimal) {

  module("nablarch/util/BigDecimal");

  test("#BigDeciaml コンストラクタのテスト", function () {

    //アサート関数
    var assertConstructor = function (actual, expected) {
      equal(actual.toString(), expected, actual.toString() + " = " + expected);
    };
    // 0
    assertConstructor(new BigDecimal("0"), "0");
    assertConstructor(new BigDecimal(0), "0");
    assertConstructor(new BigDecimal("0", 2), "0.00");
    assertConstructor(new BigDecimal(0, 2), "0.00");

    // 小数部のみ
    assertConstructor(new BigDecimal(".00"), "0.00");
    assertConstructor(new BigDecimal(.00), "0");
    assertConstructor(new BigDecimal("-.00"), "0.00");
    assertConstructor(new BigDecimal(-.00), "0");
    assertConstructor(new BigDecimal("-0.00"), "0.00");
    assertConstructor(new BigDecimal(-0.00), "0");
    assertConstructor(new BigDecimal(".00", 0), "0");
    assertConstructor(new BigDecimal(.00, 0), "0");

    // 整数部、小数部有り
    assertConstructor(new BigDecimal("1.11"), "1.11");
    assertConstructor(new BigDecimal(1), "1");
    assertConstructor(new BigDecimal("999999999999.999", 1), "999999999999.9");
    assertConstructor(new BigDecimal(999999999999, 3), "999999999999.000");


    // 非数字
    assertConstructor(new BigDecimal(""), BigDecimal.NaN);
    assertConstructor(new BigDecimal("abc"), BigDecimal.NaN);
    assertConstructor(new BigDecimal("1234abc", 2), BigDecimal.NaN);
    
    // 最大数、最小数超過
    assertConstructor(new BigDecimal(1000 * 1000 * 1000 * 1000 * 1000 -1), "999999999999999");
    assertConstructor(new BigDecimal(1000 * 1000 * 1000 * 1000 * 1000), "NaN");
    assertConstructor(new BigDecimal(-1000 * 1000 * 1000 * 1000 * 1000), "NaN");
    assertConstructor(new BigDecimal(-1000 * 1000 * 1000 * 1000 * 1000 +1), "-999999999999999");
  });

  test("#add Big加算のテスト", function () {

    // ZEROのテスト
    equal(new BigDecimal("0").add("0").toString(), "0", "0 + 0は0");
    equal(new BigDecimal("0.00").add("1.0").toString(), "1.00", "少数有りの場合は、大きいほうが優先される。");
    equal(new BigDecimal("0.00").add("1.0", 1).toString(), "1.0", "スケールを指定して加算した場合は、そのスケールの結果が得られる。");
    equal(new BigDecimal("10000").add("90000").toString(), "100000", "桁の繰り上がりも正しく計算される。");
    equal(new BigDecimal("1.001").add(new BigDecimal("9.009")).toString(), "10.010", "小数部の繰り上がりも正しく計算される。");
    equal(new BigDecimal("1.001").add(new BigDecimal("9.009"), 1).toString(), "10.0", "小数部の繰り上がりでスケール設定ありでも正しく計算される。");
    equal(new BigDecimal("1.001", 3).add(new BigDecimal("9.009", 3), 1).toString(), "10.0",
      "加算対象のBigDecimalにスケール設定があっても、add時に指定したスケールが優先される");

    equal(new BigDecimal("999999999999").add("-999999999999").toString(), "0", "マイナス値を加算してもOK");
    equal(new BigDecimal("999999999999").add("-1000000000000").toString(), "-1", "マイナス値を加算してマイナスになるケースでもOK");

    equal(new BigDecimal("100.00001").add(new BigDecimal("-.00001"), 5).toString(), "100.00000",
      "小数部が0になるマイナス値を加算してもOK");
    equal(new BigDecimal("-100.00001").add(new BigDecimal("100.00001"), 5).toString(), "0.00000",
      "マイナス値に加算して0になるケースもOK");
    equal(new BigDecimal("-100.01").add(new BigDecimal("-100.01"), 2).toString(), "-200.02",
      "マイナス値にマイナス値を加算するケースもOK");
    
    equal(new BigDecimal("1234567890").add(new BigDecimal("0.12345")).toString(),
          "1234567890.12345", "計算結果の数値部15桁までならOK");
    
    equal(new BigDecimal("1234567890").add(new BigDecimal("0.123456")).toString(),
          "NaN", "計算結果の数値が16桁ならNaN");

    equal(BigDecimal.NaN.add(new BigDecimal("100")).toString(), "NaN", "NaNにaddしても計算不可");
    equal(new BigDecimal("100").add(BigDecimal.NaN).toString(), "NaN", "数値にNaNをadd計算不可");

    equal(new BigDecimal("aaa").add(new BigDecimal("100")).toString(), "NaN", "文字列にaddしても計算不可");
    equal(new BigDecimal("100").add(new BigDecimal("")).toString(), "NaN", "数値に文字列をadd計算不可");

    // 0.01～0.99 + 0.99～0.01 = 1.00 のテスト
    (1).upto(99, function (n) {
      var input1 = "0." + n.pad(2),
        input2 = "0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).add(new BigDecimal(input2)), "1.00", input1 + "と" + input2 + "を加算して1.00になること");
    });

    (1).upto(99, function (n) {
      var input1 = "99." + n.pad(2),
        input2 = "0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).add(new BigDecimal(input2)), "100.00", input1 + "と" + input2 + "を加算して100.00になること");
    });

    (1).upto(99, function (n) {
      var input1 = "-0." + n.pad(2),
        input2 = "-0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).add(new BigDecimal(input2)).toString(), "-1.00",
        input1 + "と" + input2 + "を加算して-1.00になること")
    });

    (1).upto(99, function (n) {
      var input1 = "-99." + n.pad(2),
        input2 = "-0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).add(new BigDecimal(input2)).toString(), "-100.00",
        input1 + "と" + input2 + "を加算して-100.00になること")
    });
  });

  test("#subtractのテスト", function () {
    equal(new BigDecimal("0").subtract("0").toString(), "0", "0 - 0 は0");
    equal(new BigDecimal("0.00").subtract(new BigDecimal("1.0")).toString(), "-1.00", "少数ありの場合は、桁数が大きいほうが優先される。");
    equal(new BigDecimal("0.00").subtract("1.0", 1).toString(), "-1.0", "スケールを指定した場合は、そのスケールの結果が得られる。");

    equal(new BigDecimal("-10000").subtract("90000").toString(), "-100000", "桁のくりあがりも正しく計算される。");
    equal(new BigDecimal("-1.001").subtract(new BigDecimal("9.009")).toString(), "-10.010", "小数部の繰り上がりも正しく計算される。");

    equal(new BigDecimal("-1.001").subtract(new BigDecimal("9.009"), 1).toString(), "-10.0",
      "小数部の繰り上がりでスケール設定ありでも正しく計算される。");
    equal(new BigDecimal("-1.001", 3).subtract(new BigDecimal("9.009", 3), 1).toString(), "-10.0",
      "減算対象のBigDecimalにスケール設定があっても、subtract時に指定したスケールが優先される");

    equal(new BigDecimal("-999999999999").subtract("-999999999999").toString(), "0", "マイナス値を減算してもOK");
    equal(new BigDecimal("-999999999999").subtract("-1000000000000").toString(), "1", "マイナス値を減算してプラスになるケースでもOK");

    equal(new BigDecimal("100.00001").subtract(new BigDecimal(".00001"), 5).toString(), "100.00000",
      "小数部が0になるマイナス値を減算してもOK");
    equal(new BigDecimal("100.00001").subtract(new BigDecimal("100.00001"), 5).toString(), "0.00000",
      "減算して0になるケースもOK");
    equal(new BigDecimal("-100.01").subtract(new BigDecimal("-100.01"), 2).toString(), "0.00",
      "マイナス値にマイナス値を減算するケースもOK");
    
    equal(new BigDecimal("1234567890").subtract(new BigDecimal("0.12345")).toString(),
          "1234567889.87655", "計算結果の数値部15桁までならOK");
  
    equal(new BigDecimal("1234567890").subtract(new BigDecimal("0.123456")).toString(),
          "NaN", "計算結果の数値が16桁ならNaN");

    equal(BigDecimal.NaN.subtract(new BigDecimal("100")).toString(), "NaN", "NaNにsubtractしても計算不可");
    equal(new BigDecimal("100").subtract(BigDecimal.NaN).toString(), "NaN", "数値にNaNをsubtractしても計算不可");

    equal(new BigDecimal("aaa").subtract(new BigDecimal("100")).toString(), "NaN", "文字列にsubtractしても計算不可");
    equal(new BigDecimal("100").subtract(new BigDecimal("zz")).toString(), "NaN", "数値に文字列をsubtract計算不可");

    (1).upto(99, function (n) {
      var input1 = "-0." + n.pad(2),
        input2 = "0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).subtract(new BigDecimal(input2)).toString(), "-1.00", input1 + "から" + input2 + "を引くと-1.00になる。");
    });

    (1).upto(99, function (n) {
      var input1 = "-0." + n.pad(2),
        input2 = "0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).subtract(new BigDecimal(input2)).toString(), "-1.00", input1 + "から" + input2 + "を引くと-1.00になる。");
    });

    (1).upto(99, function (n) {
      var input1 = "-99." + n.pad(2),
        input2 = "0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).subtract(new BigDecimal(input2)).toString(), "-100.00", input1 + "から" + input2 + "を引くと100.00になる");
    });

    (1).upto(99, function (n) {
      var input1 = "0." + n.pad(2),
        input2 = "-0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).subtract(new BigDecimal(input2)).toString(), "1.00",
        input1 + "から" + input2 + "を引いて1.00になること")
    });

    (1).upto(99, function (n) {
      var input1 = "99." + n.pad(2),
        input2 = "-0." + (100 - n).pad(2);
      equal(new BigDecimal(input1).subtract(new BigDecimal(input2)).toString(), "100.00",
        input1 + "と" + input2 + "を引いて100.00になること")
    });
  });

  test("#multiplyのテスト", function() {
    equal(new BigDecimal("0").multiply("0").toString(), "0", "0 * 0 は0");
    equal(new BigDecimal("1.00").multiply(new BigDecimal("1.0")).toString(), "1.00", "少数ありの場合は、桁数が大きいほうが優先される。");
    equal(new BigDecimal("2.01").multiply("1.0", 1).toString(), "2.0", "スケールを指定した場合は、そのスケールの結果が得られる。");

    equal(new BigDecimal("20000").multiply("5").toString(), "100000", "桁のくりあがりも正しく計算される。");
    equal(new BigDecimal("1.002").multiply(new BigDecimal("5")).toString(), "5.010", "小数部の繰り上がりも正しく計算される。");

    equal(new BigDecimal("2.2").multiply(new BigDecimal("5.00"), 1).toString(), "11.0",
      "小数部の繰り上がりでスケール設定ありでも正しく計算される。");
    equal(new BigDecimal("1.001", 3).multiply(new BigDecimal("9.009", 3), 1).toString(), "9.0",
      "計算対象のBigDecimalにスケール設定があっても、multiply時に指定したスケールが優先される");

    equal(new BigDecimal("9999.99").multiply("-12.345").toString(), "-123449.876", "マイナス値をかけたらマイナスになる");
    equal(new BigDecimal("-100").multiply("-12345.12").toString(), "1234512.00", "マイナス値同士をかけるとプラスに成ること");

    equal(BigDecimal.NaN.multiply(new BigDecimal("100")).toString(), "NaN", "NaNにmultiplyしても計算不可");
    equal(new BigDecimal("100").multiply(BigDecimal.NaN).toString(), "NaN", "数値にNaNをmultiplyしても計算不可");

    equal(new BigDecimal("aaa").multiply(new BigDecimal("100")).toString(), "NaN", "文字列にmultiplyしても計算不可");
    equal(new BigDecimal("100").multiply(new BigDecimal("zz")).toString(), "NaN", "数値に文字列をmultiply計算不可");
  });
});