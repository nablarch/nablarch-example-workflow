<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template
  title="サブミットイベント拡張"
  testcase="./テストケース_イベント拡張.js">

  <jsp:attribute name="contentHtml">
  <n:form>

    <button:block>
      <button:submit
        id="submitLink"
        icon="fa fa-bolt"
        label="送信(submitLink)"
        uri="./index.jsp"
        dummyUri="./index.jsp"
        size="5">
      </button:submit>

      <button:popup
        id="popupLink"
        icon="fa fa-external-link"
        label="送信(popupLink)"
        uri="./index.jsp"
        dummyUri="./index.jsp"
        popupWindowName="index_popup"
        size="5">
      </button:popup>
    </button:block>
  </n:form>
  </jsp:attribute>

</t:ui_test_template>
