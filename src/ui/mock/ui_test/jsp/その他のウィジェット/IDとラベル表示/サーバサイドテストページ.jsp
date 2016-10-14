<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block
      title="全属性を指定">
    <span class="test-case value_id-test">全属性を指定した場合、IDとVALUEがともに表示されること。</span>
    <field:label_id_value
        title="全属性指定(想定通り描画されること)"
        idName="server.id_value.id"
        valueName="server.id_value.value"
        dataFrom="テーブル名.カラム名"
        comment="備考">
    </field:label_id_value>
  </field:block>
</n:form>
