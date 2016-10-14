<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  List<Map<String, String>> result = new ArrayList<Map<String, String>>();
  result.add(new HashMap<String, String>() {{
    put("name", "なまえ");
    put("address", "東京都新宿区");
  }});

  request.setAttribute("result", result);
  request.setAttribute("commonHeaderLoginUserName", "ユーザの名前");

  ApplicationException applicationException = new ApplicationException(new ValidationResultMessage(null,
      new StringResource() {
        @Override
        public String getId() {
          return "id";
        }

        @Override
        public String getValue(Locale locale) {
          return "グローバル領域に出力されるエラーメッセージ";
        }
      }, null));

  request.setAttribute("nablarch_application_error", applicationException);
%>
-->

<t:subwindow_page_template
    title="子画面テンプレート"
    tabindexOrder="search2,search1"
    whenToClose=".close-button click">
  <jsp:attribute name="contentHtml">
    <n:form>
      <field:block
          title="検索条件その1(タブ順2)"
          id="search1">
        <field:text title="名前" name="username">
        </field:text>
      </field:block>

      <field:block
          title="検索条件その２(タブ順1)"
          id="search2">
        <field:text title="住所" name="address">
        </field:text>
      </field:block>

      <button:block>
        <button:search uri="dummy">
        </button:search>
      </button:block>

      <table:plain title="検索結果" resultSetName="result" sampleResults="3">
        <column:label key="name" title="名前" sample="ユーザー1|ユーザー2|ユーザー3">
        </column:label>
        <column:label key="address" title="住所" sample="埼玉県川越|神奈川県鎌倉市|東京都墨田区">
        </column:label>
      </table:plain>
    </n:form>

    <button:block>
      <button>閉じない</button>
      <button class="close-button">閉じる</button>
      <button class="nablarch_WindowClose">閉じるその２</button>
    </button:block>
  </jsp:attribute>
</t:subwindow_page_template>
