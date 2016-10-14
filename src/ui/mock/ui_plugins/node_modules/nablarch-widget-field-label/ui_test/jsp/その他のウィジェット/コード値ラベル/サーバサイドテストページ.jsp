<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case">必須属性を指定した場合、コード値がラベル表示されること</span>
    <field:label_code
        title="必須属性を指定"
        codeId="code1"
        name="server.dummy">
    </field:label_code>
  </field:block>
</n:form>
