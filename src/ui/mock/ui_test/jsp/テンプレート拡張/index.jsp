<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="テンプレート拡張">
  <jsp:attribute name="contentHtml">
  <n:form>
  <ul>
    <li>タブインデックス定義
      <ul>
        <li><link:submit label="タブインデックス"
                         uri=     "./タブインデックス定義/index.jsp"
                         dummyUri="./タブインデックス定義/index.jsp" /></li>
      </ul>
    </li>
    <li>閉じる機能
      <ul>
        <li><link:submit label="画面クローズ拡張"
                         uri=     "./画面クローズ機能/index.jsp"
                         dummyUri="./画面クローズ機能/index.jsp" /></li>
      </ul>
    </li>
  </ul>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>
