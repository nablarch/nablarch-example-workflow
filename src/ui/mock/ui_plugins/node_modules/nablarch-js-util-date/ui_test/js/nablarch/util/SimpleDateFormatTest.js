require(["nablarch/util/SimpleDateFormat", "sugar"],
function(SimpleDateFormat) {

  module("nablarch/util/SimpleDateFormat");

  test("#SimpleDateFormat.prototype.format のテスト", function() {
    var format, locale, testTable;

    function testFormat() {
      testTable.each(function(data) {
        var date     = Date.create(data[0])
          , expected = data[1]
          , comment  = data[2] || "";
        equal(new SimpleDateFormat(format).format(date, locale), expected, comment);
      });
    }

    format = "yyyy年MM月dd日";
    locale = "ja";
    testTable = [
      ["2012-12-21", "2012年12月21日", "yyyy年MM月dd日:フル桁(4桁/2桁/2桁)の表示"]
    , ["2012-4-21",  "2012年04月21日", "yyyy年MM月dd日:月が1桁→0でpadして2桁"]
    , ["2012-12-2",  "2012年12月02日", "yyyy年MM月dd日:日が1桁→0でpadして2桁"]
    , ["0212-12-21", "0212年12月21日", "yyyy年MM月dd日:年が3桁→0でpadして4桁"]
    , ["0012-12-21", "0012年12月21日", "yyyy年MM月dd日:年が2桁→0でpadして4桁"]
    , ["0002-12-21", "0002年12月21日", "yyyy年MM月dd日:年が1桁→0でpadして4桁"]
    ];
    testFormat();

    format = "yy年M月d日";
    locale = "ja";
    testTable = [
      ["2012-12-21", "12年12月21日",   "yy年M月d日:年が4桁→下2桁できる"]
    , ["2012-4-21",  "12年4月21日",    "yy年M月d日:月が1桁→そのまま"]
    , ["2012-12-2",  "12年12月2日",    "yy年M月d日:日が1桁→そのまま"]
    , ["0212-12-21", "12年12月21日",   "yy年M月d日:年が3桁→下2桁できる"]
    , ["0098-12-21", "98年12月21日",   "yy年M月d日:年が2桁→そのまま"]
    , ["0004-12-21", "4年12月21日",    "yy年M月d日:年が1桁→そのまま"]
    ];
    testFormat();

    format = "E MMM d, yyyy";
    locale = "en";
    testTable = [
      ["2012-11-1",  "Thu Nov 1, 2012", "E MMM d, yyyy:英語ロケール時の曜日・月表示"]
    ];
    testFormat();


    format = "yy年MMMd日 (EEEE)";
    locale = "ja";
    testTable = [
      ["2012-11-1",  "12年11月1日 (木曜日)", "yy年MMMd日 (E):日本語ロケール時の曜日・月表示"]
    ];
    testFormat();
  });

  test("#SimpleDateFormat.prototype.parse のテスト", function() {
    var format, locale, testTable;

    function testParse() {
      testTable.each(function(data) {
        var dateStr  = data[0]
          , expected = Date.create(data[1])
          , comment  = data[2] || "";

        equal(
          new SimpleDateFormat(format).parse(dateStr).format()
        , expected.format()
        , comment
        );

      });
    }

    format = "yyyy年MM月dd日";
    testTable = [
      ["2012年12月21日", "2012-12-21", "yyyy年MM月dd日:フル桁入力"]
    , ["2012年4月21日",  "2012-4-21",  "yyyy年MM月dd日:月1桁"]
    , ["2012年04月21日", "2012-4-21",  "yyyy年MM月dd日:月0埋め2桁"]
    , ["2012年12月02日", "2012-12-2",  "yyyy年MM月dd日:日0埋め2桁"]
    , ["0212年12月21日", "0212-12-21", "yyyy年MM月dd日:年が3桁→そのまま"]
    , ["0012年12月21日", "0012-12-21", "yyyy年MM月dd日:年が2桁→そのまま"]
    , ["0002年12月21日", "0002-12-21", "yyyy年MM月dd日:年が1桁→そのまま"]
    ];
    testParse();

    format = "yy/M/d";
    testTable = [
      ["2012/12/21", "2012-12-21", "yy/M/d:フル桁入力"]
    , ["2012/4/21",  "2012-4-21",  "yy/M/d:月1桁"]
    , ["2012/04/21", "2012-4-21",  "yy/M/d:月0埋め2桁"]
    , ["2012/12/02", "2012-12-2",  "yy/M/d:日0埋め2桁"]
    , ["0212/12/21", "2012-12-21", "212年→下2桁一致で過去80年～未来20年の間の年=2012"]
    , ["0012/12/21", "2012-12-21", "12年→下2桁一致で過去80年～未来20年の間の年=2012"]
    , ["0002/12/21", "2002-12-21", "2年→下2桁一致で過去80年～未来20年の間の年=2002"]
    , ["5098/12/21", "1998-12-21", "5098年→下2桁一致で過去80年～未来20年の間の年=1998"]
    , ["1920/12/21", "2020-12-21", "1920年→下2桁一致で過去80年～未来20年の間の年=2020"]
    ];
    testParse();

    ok(
      new SimpleDateFormat("yy/M/d").parse("hoge") === null
    , "フォーマットエラー時はnullを返却する"
    );
  });
});