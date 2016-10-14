<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case">クライアントサイドで必須の値を設定(name関連の属性は、tag上必須だがクライアント動作時には任意なのでブランクを設定)</span>
    <field:tel
        title="必須属性のテスト"
        areaName=""
        localName=""
        subscriberName="">
    </field:tel>
  </field:block>
  <field:block title="全属性">
    <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで表示されること</span>
    <field:tel
        areaName="server.tel-area"
        localName="server.tel-local"
        subscriberName="server.tel-subscriber"
        title="全属性指定"
        readonly="false"
        cssClass="border-blue"
        disabled="false"
        domain="ドメイン"
        hint="ヒント"
        id="server.all-id"
        nameAlias="nameAlias"
        required="true"
        sample="99-9999-9999">
    </field:tel>
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
