
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <field:block title="必須属性（必須属性はここで纏めてテスト）">
    <span class="test-case">必須属性のタイトルに指定した値（「タイトル」）が、入力画面と確認画面で表示されること</span>
    <field:text
        title="タイトル"
        name="">
    </field:text>
  </field:block>
  <field:block title="全属性">
    <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで表示されること</span>
    <field:text
        title="タイトル"
        sample="99999999"
        required="true"
        nameAlias="nameAlias"
        maxlength="10"
        cssClass="cssClass-test"
        disabled="false"
        domain="ドメイン"
        example="99999999"
        hint="ヒント"
        id="server.all-id"
        readonly="false"
        valueFormat="yyyymmdd{yyyy年MM月dd日}"
        formatSpec="yyyy年MM月dd日"
        name="server.all-name"
        dataFrom="テーブル名.カラム名"
        comment="画面項目定義の画面項目一覧で、備考欄に表示される内容。"
        initialValueDesc="初期値"
        unit="単位">
    </field:text>
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
