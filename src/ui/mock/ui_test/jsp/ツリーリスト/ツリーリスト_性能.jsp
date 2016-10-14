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
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);
  final class Create {
    List<Map<String, String>> listMap(int size) {
      List<Map<String, String>> list = new ArrayList<Map<String, String>>(){{
        add(new HashMap<String, String>(){{
            put("rid", "RW11AA_1");
            put("name", "性能テスト");
        }});
      }};
      for (int i = 1; i < size; i++) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("rid", "RW11AA_1_" + String.valueOf(i));
        map.put("name", "性能テスト");
        list.add(map);
      }
      return list;
    }
  }
  Create create = new Create();
  request.setAttribute("greater", create.listMap(31));
  request.setAttribute("just", create.listMap(30));
  request.setAttribute("node_modules/less", create.listMap(29));
  request.setAttribute("fullSize", create.listMap(300));
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
  <jsp:attribute name="localJs">
    $('table').each(function() {'use strict';
      var $table = $(this)
       ,  count  = $table.find('tr').size() - 1 // head tr is ignore
       ,  $head  = $table.find('th').first();
      $head.text($head.text() + [" count = [", count, "]"].join(""));
    });
  </jsp:attribute>
  <jsp:attribute name="contentHtml">
  <n:form name="server">
  <tab:group name="test">
  <tab:content
      title="件数の境界値"
      value="sc"
      selected="true">
  <span class="test-case">件数境界での分岐</span>
  <table:treelist
      title="レコードの件数が30件前後で視覚効果に変化がないこと。"
      name="server.less"
      id="lessRecord"
      hierarchy="separator:_"
      sampleResults="49"
      key="rid"
      resultSetName="less">
    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン">
    </column:label>
  </table:treelist>

    <table:treelist
      title="レコードの件数が30件前後で視覚効果に変化がないこと。"
      name="server.just"
      id="just"
      hierarchy="separator:_"
      sampleResults="49"
      key="rid"
      resultSetName="just">
    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン">
    </column:label>
  </table:treelist>

    <table:treelist
      title="レコードの件数が30件前後で視覚効果に変化がないこと。"
      name="server.greater"
      hierarchy="separator:_"
      sampleResults="49"
      id="greater"
      key="rid"
      resultSetName="greater">
    <column:label
        title="リクエストID"
        key="rid"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA_1">
    </column:label>

    <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン">
    </column:label>
  </table:treelist>

  </tab:content>
    <tab:content
      title="件数フル"
      value="full">
        <table:treelist resultSetName="fullSize"
                        name="server.full"
                        id="max"
                        hierarchy="separator:_"
                        title="想定最大件数"
                        key="rid">
          <column:label
             title="リクエストID"
             key="rid"
             tree_indent="true"
             tree_toggler="true"
             sample="RW11AA|RW11AA_1">
          </column:label>
          <column:label
             title="リクエスト名"
             key="name"
             tree_indent="true"
             sample="ログイン機能|ログイン">
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
