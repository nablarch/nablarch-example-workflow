<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <field:block title="必須属性（必須属性はここで纏めてテスト）">
    <span class="test-case">必須属性のタイトルに指定した値（「タイトル」）が、入力画面と確認画面で表示されること</span>
    <field:password
        title="タイトル"
        name="">
    </field:password>
  </field:block>
  <field:block title="全属性">
    <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで表示されること</span>
    <field:password
        title="全属性指定"
        maxlength="10"
        required="true"
        example="sample"
        sample="サンプル値"
        nameAlias="nameAlias"
        hint="ヒント"
        domain="パスワード"
        cssClass="cssClass-test"
        disabled="false"
        id="dummy"
        readonly="false"
        name="dummy"
        comment="備考"
        dataFrom="テーブル名.カラム名"
        initialValueDesc="初期値">
    </field:password>
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
