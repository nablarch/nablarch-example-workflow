<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性のみ">
    <span class="test-case">必須属性のみ指定した場合titleに指定した値（「タイトル」）が、title部に出力されること</span>
    <field:label_code
        title="タイトル"
        name=""
        codeId="">
    </field:label_code>
  </field:block>

  <field:block title="全属性指定">
    <span class="test-case">クライアントサイドでは利用されない属性も含めた、全属性を指定した場合に正しく表示されること。</span>
    <field:label_code
        title="全属性"
        name="server.code_label_all"
        codeId="code1"
        sample="コード値1|コード値2|コード値3"
        labelPattern="$VALUE$: $NAME$"
        listFormat="sp"
        optionColumnName="OPTION02"
        pattern="PATTERN02"
        dataFrom="テーブル名.カラム名"
        comment="備考">
    </field:label_code>
  </field:block>
</n:form>
