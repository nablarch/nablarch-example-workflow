<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性のみ">
    <span class="test-case">必須属性のみ指定した場合titleに指定した値（「タイトル」）が、title部に出力されること</span>
    <field:label_id_value
        title="タイトル"
        idName=""
        valueName="">
    </field:label_id_value>
  </field:block>
  <field:block title="全属性指定">
    <span class="test-case">クライアントサイドでは利用されない属性も含めた、全属性を指定した場合に正しく表示されること。</span>
    <field:label_id_value
        title="全属性指定"
        idName="server.id_value.id"
        valueName="server.id_value.value"
        sample="サンプルID:サンプルVALUE"
        dataFrom="テーブル名.カラム名"
        comment="備考">
    </field:label_id_value>
  </field:block>
</n:form>
