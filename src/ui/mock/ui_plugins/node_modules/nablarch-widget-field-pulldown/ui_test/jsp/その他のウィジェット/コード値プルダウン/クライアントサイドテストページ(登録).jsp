<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <field:block title="必須属性（必須属性はここで纏めてテスト）">
    <span class="test-case">必須属性のタイトルに指定した値（「タイトル」）が、入力画面と確認画面で表示されること</span>
    <field:code_pulldown
        title="タイトル"
        codeId=""
        name="">
    </field:code_pulldown>
  </field:block>
  <field:block title="全属性">
    <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで表示されること</span>
    <field:code_pulldown
        title="全属性指定"
        required="true"
        readonly="false"
        disabled="false"
        cssClass="cssClass-test"
        domain="ドメイン"
        hint="ヒント"
        nameAlias="nameAlias"
        codeId="code1"
        labelPattern="$NAME$ - $VALUE$"
        optionColumnName="OPTION1"
        pattern="PATTERN1"
        id="server.all-id"
        sample="値1|値2|値3"
        withNoneOption="true"
        name="server.all"
        comment="備考">
    </field:code_pulldown>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check
          uri="./クライアントサイドテストページ(確認).jsp"
          dummyUri="クライアントサイドテストページ(確認).jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./クライアントサイドテストケース.jsp"
          dummyUri="クライアントサイドテストケース.jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
</n:form>
