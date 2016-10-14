<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <field:block title="必須属性のみ">
    <span class="test-case">必須属性のみ指定した場合titleに指定した値（「タイトル」）が、title部に出力されること</span>
    <field:label
        title="タイトル"
        name="">
    </field:label>
  </field:block>
  <field:block title="全属性を指定">
    <span class="test-case">クライアントサイドでは利用されない属性も含めた、全属性を指定した場合に正しく表示されること。</span>
    <field:label
        title="タイトル"
        name="someLabelName"
        cssClass="cssClass-test"
        domain="日付"
        id="test-id"
        sample="2013/10/10"
        valueFormat="yyyymmdd{yyyy/MM/dd}"
        unit="単位"
        comment="備考">
    </field:label>
  </field:block>

</n:form>
