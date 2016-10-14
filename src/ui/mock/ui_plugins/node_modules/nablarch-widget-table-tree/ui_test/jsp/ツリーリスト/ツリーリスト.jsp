<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);

  request.setAttribute("searchResult", new ArrayList<Map<String, String>>() {{
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA0101");
      put("name", "ログイン画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA0102");
      put("name", "ログイン処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AB0101");
      put("name", "メニュー表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0101");
      put("name", "ユーザ情報一覧照会画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0102");
      put("name", "ユーザ検索処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0103");
      put("name", "ユーザ情報詳細画面表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0104");
      put("name", "ユーザ一覧CSVダウンロード処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0201");
      put("name", "ユーザ情報登録画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0202");
      put("name", "ユーザ情報入力確認処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0203");
      put("name", "ユーザ情報入力画面戻る処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0205");
      put("name", "ユーザ情報メッセージ送信処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0204");
      put("name", "ユーザ情報登録処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0301");
      put("name", "ユーザ情報更新画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0302");
      put("name", "ユーザ情報更新入力確認処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0303");
      put("name", "ユーザ情報更新入力画面戻る処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC0304");
      put("name", "ユーザ情報更新処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA");
      put("name", "ログイン機能");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AB");
      put("name", "メニュー");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC");
      put("name", "ユーザ管理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC01");
      put("name", "ユーザ一覧検索");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC02");
      put("name", "ユーザ新規登録");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC03");
      put("name", "ユーザ情報更新");
    }});
  }});
  request.setAttribute("searchResult2", new ArrayList<Map<String, String>>() {{
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA_1_1");
      put("name", "ログイン画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA_1_2");
      put("name", "ログイン処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AB_1_1");
      put("name", "メニュー表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_1_1");
      put("name", "ユーザ情報一覧照会画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_1_2");
      put("name", "ユーザ検索処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_1_3");
      put("name", "ユーザ情報詳細画面表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_1_4");
      put("name", "ユーザ一覧CSVダウンロード処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2_1");
      put("name", "ユーザ情報登録画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2_2");
      put("name", "ユーザ情報入力確認処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2_10");
      put("name", "ユーザ情報入力画面戻る処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2_20");
      put("name", "ユーザ情報メッセージ送信処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2_30");
      put("name", "ユーザ情報登録処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_3_1");
      put("name", "ユーザ情報更新画面初期表示処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_3_2");
      put("name", "ユーザ情報更新入力確認処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_3_3");
      put("name", "ユーザ情報更新入力画面戻る処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_3_4");
      put("name", "ユーザ情報更新処理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AA");
      put("name", "ログイン機能");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AB");
      put("name", "メニュー");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC");
      put("name", "ユーザ管理");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_1");
      put("name", "ユーザ一覧検索");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_2");
      put("name", "ユーザ新規登録");
    }});
    add(new HashMap<String, String>() {{
      put("rid", "RW11AC_3");
      put("name", "ユーザ情報更新");
    }});
  }});

  request.setAttribute("searchInfo", new ListSearchInfo() {
    {
      setResultCount(17);
    }

    public String[] getSearchConditionProps() {
      return new String[0];
    }
  });
%>
-->

<t:ui_test_template
    suite="ツリーリスト"
    title="ツリーリスト"
    confirmationPageTitle="ツリーリスト_確認">

<jsp:attribute name="localCss">
    div.border-blue table, div.border-blue tr, div.border-blue td, div.border-blue th {
      border: 1px solid blue;
    }
  </jsp:attribute>
  <jsp:attribute name="contentHtml">
  <n:form>
  <tab:group name="test">

  <c:if test="${not serverMode}">
    <tab:content title="クライアントサイド" value="c">
      <span class="test-case">
        必須属性のみを指定した場合、データがツリー表示されること
      </span>
      <table:treelist
          title="必須属性のみ"
          name="client.required-only"
          hierarchy="chars:6|2|2"
          sampleResults="6"
          key="rid"
          id="table1"
          resultSetName="searchResult1">

        <column:label
            title="リクエストID"
            key="rid"
            value=""
            tree_toggler="true"
            sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
        </column:label>

        <column:label
            title="リクエスト名"
            key="name"
            sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
        </column:label>

        <column:checkbox
            title="閉局中"
            name="formdata.availableRequestIds"
            value="${row.rid}"
            key="name">
        </column:checkbox>
      </table:treelist>

      <span class="test-case">
        クライアントサイドでは利用されない属性も含めた、全属性を指定した場合にデータがツリー表示されること。
      </span>
      <table:treelist
          title="全属性指定"
          name="client.all"
          hierarchy="chars:6|2|2"
          sampleResults="6"
          key="rid"
          resultSetCss="resultSetCss"
          resultSetName="searchResult2"
          id="table2"
          comment="備考"
          sortCondition="初期ソート条件"
          estimatedMaxSearchResults="想定最大検索結果">

        <column:label
            title="リクエストID"
            key="rid"
            tree_indent="true"
            tree_toggler="true"
            sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
        </column:label>

        <column:label
            title="リクエスト名"
            key="name"
            sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
        </column:label>

        <column:checkbox
            title="閉局中"
            name="formdata.availableRequestIds"
            value="${row.rid}"
            key="name">
        </column:checkbox>
      </table:treelist>
    </tab:content>
  </c:if>

  <tab:content
      title="サーバサイド・クライアントサイド共通"
      value="sc"
      selected="true">
  <span class="test-case">
    打鍵確認
  </span>
  <table:treelist
      title="開閉アイコンをクリックすると、子階層の表示非表示が切り替えられること。また、サーバ動作時は折り畳み状態が画面間で引き継がれること。"
      name="server.collapsible"
      hierarchy="separator:_"
      sampleResults="7"
      key="rid"
      resultSetName="searchResult2">

    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1|RW11AA_1_1|RW11AA_1_2|RW11AB|RW11AB_1|RW11AB_1_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>

  <table:treelist
      title="チェックボックスをクリックすると、子階層の選択状態を一括で切り替えられること。選択項目のvalue属性がサーバに送信されること。"
      name="server.node-checkbox"
      hierarchy="separator:_"
      sampleResults="7"
      key="rid"
      resultSetName="searchResult2">

    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1|RW11AA_1_1|RW11AA_1_2|RW11AB|RW11AB_1|RW11AB_1_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー|メニュー表示処理">
    </column:label>

    <column:checkbox
        title="閉局中"
        name="server.checkbox"
        value="${row.rid}"
        key="rid">
    </column:checkbox>
  </table:treelist>

  <span class="test-case">
    hierarchy指定
  </span>
  <table:treelist
      title="指定したhierarchy(separator:_)で階層化されていること。"
      name="server.hierarcy"
      hierarchy="separator:_"
      sampleResults="7"
      key="rid"
      resultSetName="searchResult2">

    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1|RW11AA_1_1|RW11AA_1_2|RW11AB|RW11AB_1|RW11AB_1_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー|メニュー表示処理">
    </column:label>

    <column:checkbox
        title="閉局中"
        name="server.hierarcy.checkbox"
        value="${row.rid}"
        key="rid">
    </column:checkbox>
  </table:treelist>

  <span class="test-case">
  resultSetCss属性を指定しない場合、テーブルの親となるdivタグのclass属性にテーブル表示用およびツリーリスト表示用の属性のみ出力されていること。
  </span>
  <table:treelist
      title="resultSetCss属性未指定"
      resultSetName="searchResult2"
      sampleResults="6"
      hierarchy="chars:6|2|2"
      key="rid"
      name="server.resultSetCss-none">
    <column:label
        key="rid"
        title="リクエストID"
        tree_toggler="true"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
  resultSetCss属性にブランクを指定した場合、テーブルの親となるdivタグのclass属性にテーブル表示用およびツリーリスト表示用の属性のみ出力されていること。
  </span>
  <table:treelist
      title="resultSetCss属性ブランク"
      resultSetName="searchResult2"
      resultSetCss=""
      sampleResults="6"
      hierarchy="chars:6|2|2"
      key="rid"
      name="server.resultSetCss-none">
    <column:label
        key="rid"
        title="ユーザID"
        tree_toggler="true"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="名前"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
  resultSetCss属性を指定した場合、そのスタイルが適用されること
  </span>
  <table:treelist
      title="resultSetCss属性指定"
      resultSetName="searchResult2"
      resultSetCss="border-blue"
      sampleResults="6"
      hierarchy="chars:6|2|2"
      key="rid"
      name="server.resultSetCss">
    <column:label
        key="rid"
        title="ユーザID"
        tree_toggler="true"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="名前"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    [column:label] tree_togglerが未指定のカラムには、折り畳み用のアイコンが表示されないこと。
  </span>
  <span class="test-case">
    [column:label] tree_togglerがtrueのカラムには、折り畳み用のアイコンが表示されること。<br />
    （tree_togglerが指定された列が一つは存在する必要があるため、まとめて実施する。）
  </span>
  <table:treelist
      title="tree_toggler未指定"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_toggler-none"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_toggler未指定)"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_toggler[true])"
        tree_toggler="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    [column:label] tree_togglerがブランクのカラムには、折り畳み用のアイコンが表示されないこと。
  </span>
  <table:treelist
      title="tree_togglerブランク"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_toggler-blank"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_togglerブランク)"
        tree_toggler=""
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_toggler[true])"
        tree_toggler="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    [column:label] tree_togglerがfalseのカラムには、折り畳み用のアイコンが表示されないこと。
  </span>
  <table:treelist
      title="tree_toggler[false]"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_toggler-false"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_toggler[false])"
        tree_toggler="false"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_toggler[true])"
        tree_toggler="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>

  <span class="test-case">
    [column:label] tree_indentが未指定のカラムでは、項目がインデントされて表示されないこと。
  </span>
  <table:treelist
      title="tree_indent未指定"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_indent-none"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_indent未指定)"
        tree_toggler="true"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_indent未指定)"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    [column:label] tree_indentがブランクのカラムでは、項目がインデントされて表示されないこと。
  </span>
  <table:treelist
      title="tree_indentブランク"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_indent-blank"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_indentブランク)"
        tree_toggler="true"
        tree_indent=""
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_indentブランク)"
        tree_indent=""
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    [column:label] tree_indentがfalseのカラムでは、項目がインデントされて表示されないこと。
  </span>
  <table:treelist
      title="tree_indent[false]"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_indent-false"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_indent[false])"
        tree_toggler="true"
        tree_indent="false"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_indent[false])"
        tree_indent="false"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  <span class="test-case">
    tree_indentがtrueのカラムでは、項目がインデントされて表示されること。
  </span>
  <table:treelist
      title="tree_indent[true]"
      resultSetName="searchResult"
      key="rid"
      name="server.tree_indent-true"
      sampleResults="6"
      hierarchy="chars:6|2|2">
    <column:label
        key="rid"
        title="リクエストID(tree_indent[true])"
        tree_toggler="true"
        tree_indent="true"
        sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
    </column:label>
    <column:label
        key="name"
        title="リクエスト名(tree_indent[true])"
        tree_indent="true"
        sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
    </column:label>
  </table:treelist>
  </tab:content>

  <tab:content title="サーバサイド" value="s">
    <table:treelist
        title="必須属性を全て指定した場合、それぞれの属性値が正しく出力されること"
        resultSetName="searchResult"
        key="rid"
        name="server.required-only"
        sampleResults="6"
        hierarchy="chars:6|2|2">
      <column:label
          key="rid"
          title="ユーザID"
          tree_toggler="true"
          sample="RW11AA|RW11AA01|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
      </column:label>
      <column:label
          key="name"
          title="名前"
          sample="ログイン機能|ログイン|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
      </column:label>
    </table:treelist>
  </tab:content>
  </tab:group>
  <button:block>
    <n:forInputPage>
      <button:check
          uri="./ツリーリスト_確認.jsp"
          dummyUri="ツリーリスト_確認.jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./ツリーリスト.jsp"
          dummyUri="ツリーリスト.jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
  </n:form>
</jsp:attribute>
</t:ui_test_template>
