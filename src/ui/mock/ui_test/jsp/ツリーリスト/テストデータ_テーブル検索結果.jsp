<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.*, nablarch.core.db.support.*" %>

<%
  request.setAttribute("searchResult",  new ArrayList() {{
    add(new HashMap() {{
      put("id",     "RW11AA0101");
      put("name",   "ログイン画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AA0102");
      put("name",   "ログイン処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AB0101");
      put("name",   "メニュー表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0101");
      put("name",   "ユーザ情報一覧照会画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0102");
      put("name",   "ユーザ検索処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0103");
      put("name",   "ユーザ情報詳細画面表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0104");
      put("name",   "ユーザ一覧CSVダウンロード処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0201");
      put("name",   "ユーザ情報登録画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0202");
      put("name",   "ユーザ情報入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0203");
      put("name",   "ユーザ情報入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0205");
      put("name",   "ユーザ情報メッセージ送信処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0204");
      put("name",   "ユーザ情報登録処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0301");
      put("name",   "ユーザ情報更新画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0302");
      put("name",   "ユーザ情報更新入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0303");
      put("name",   "ユーザ情報更新入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC0304");
      put("name",   "ユーザ情報更新処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AA");
      put("name",   "ログイン機能");
    }});
    add(new HashMap() {{
      put("id",     "RW11AB");
      put("name",   "メニュー");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC");
      put("name",   "ユーザ管理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC01");
      put("name",   "ユーザ一覧検索");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC02");
      put("name",   "ユーザ新規登録");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC03");
      put("name",   "ユーザ情報更新");
    }});
  }});
  request.setAttribute("searchResult2",  new ArrayList() {{
    add(new HashMap() {{
      put("id",     "RW11AA_1_1");
      put("name",   "ログイン画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AA_1_2");
      put("name",   "ログイン処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AB_1_1");
      put("name",   "メニュー表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_1_1");
      put("name",   "ユーザ情報一覧照会画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_1_2");
      put("name",   "ユーザ検索処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_1_3");
      put("name",   "ユーザ情報詳細画面表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_1_4");
      put("name",   "ユーザ一覧CSVダウンロード処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2_1");
      put("name",   "ユーザ情報登録画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2_2");
      put("name",   "ユーザ情報入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2_10");
      put("name",   "ユーザ情報入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2_20");
      put("name",   "ユーザ情報メッセージ送信処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2_30");
      put("name",   "ユーザ情報登録処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_3_1");
      put("name",   "ユーザ情報更新画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_3_2");
      put("name",   "ユーザ情報更新入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_3_3");
      put("name",   "ユーザ情報更新入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_3_4");
      put("name",   "ユーザ情報更新処理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AA");
      put("name",   "ログイン機能");
    }});
    add(new HashMap() {{
      put("id",     "RW11AB");
      put("name",   "メニュー");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC");
      put("name",   "ユーザ管理");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_1");
      put("name",   "ユーザ一覧検索");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_2");
      put("name",   "ユーザ新規登録");
    }});
    add(new HashMap() {{
      put("id",     "RW11AC_3");
      put("name",   "ユーザ情報更新");
    }});
  }});
  request.setAttribute("searchResult3",  new ArrayList() {{
    add(new HashMap() {{
      put("id",     "32");
      put("name",   "ログイン画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "1001");
      put("name",   "ログイン処理");
    }});
    add(new HashMap() {{
      put("id",     "1057");
      put("name",   "メニュー表示処理");
    }});
    add(new HashMap() {{
      put("id",     "2003");
      put("name",   "ユーザ情報一覧照会画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "2089");
      put("name",   "ユーザ検索処理");
    }});
    add(new HashMap() {{
      put("id",     "3982");
      put("name",   "ユーザ情報詳細画面表示処理");
    }});
    add(new HashMap() {{
      put("id",     "4789");
      put("name",   "ユーザ一覧CSVダウンロード処理");
    }});
    add(new HashMap() {{
      put("id",     "4998");
      put("name",   "ユーザ情報登録画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "5001");
      put("name",   "ユーザ情報入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "5012");
      put("name",   "ユーザ情報入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "5489");
      put("name",   "ユーザ情報メッセージ送信処理");
    }});
    add(new HashMap() {{
      put("id",     "6031");
      put("name",   "ユーザ情報登録処理");
    }});
    add(new HashMap() {{
      put("id",     "8099");
      put("name",   "ユーザ情報更新画面初期表示処理");
    }});
    add(new HashMap() {{
      put("id",     "10022");
      put("name",   "ユーザ情報更新入力確認処理");
    }});
    add(new HashMap() {{
      put("id",     "10090");
      put("name",   "ユーザ情報更新入力画面戻る処理");
    }});
    add(new HashMap() {{
      put("id",     "10109");
      put("name",   "ユーザ情報更新処理");
    }});
    add(new HashMap() {{
      put("id",     "0_");
      put("name",   "～5000");
    }});
    add(new HashMap() {{
      put("id",     "5001_");
      put("name",   "5001～10000");
    }});
    add(new HashMap() {{
      put("id",     "10001_");
      put("name",   "10001～");
    }});
  }});
  
  request.setAttribute("searchInfo",   new ListSearchInfo() {
    {setResultCount(17);}
    public String[] getSearchConditionProps() {return new String[0];}    
  });
%>
