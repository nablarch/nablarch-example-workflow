<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <n:forInputPage>
    <input type="hidden" name="input" value="1">
  </n:forInputPage>

  <field:block title="必須（必須の項目を纏めてテスト）">
    <span class="test-case required">必須項目を全て指定した場合、入力欄が出力され入力された値が確認画面にラベルで表示されること</span>
    <field:extension_number
        title="必須テスト"
        builName="server.builNo"
        personalName="server.personalNo">
    </field:extension_number>
  </field:block>

  <field:block title="nameAlias属性">
    <span class="test-case not-nameAlias">nameAlias属性を指定しない場合、各属性のメッセージが出力されること。</span>
    <field:extension_number
        title="nameAlias未指定"
        builName="server.builNo-error"
        personalName="server.personalNo-error">
    </field:extension_number>
    <span class="test-case nameAlias-blank">nameAlias属性にブランクを指定した場合、各属性のメッセージが出力されること。</span>
    <field:extension_number
        title="nameAliasブランク"
        builName="server.builNo-error"
        personalName="server.personalNo-error"
        nameAlias="">
    </field:extension_number>
    <span class="test-case nameAlias-test">nameAlias属性を指定した場合、nameAlias属性に対応したメッセージが出力される</span>
    <field:extension_number
        title="nameAlias指定"
        builName="server.builNo-alias"
        personalName="server.personalNo-alias"
        nameAlias="extension_number">
    </field:extension_number>
    <span class="test-case viewonly">ラベルが改行されてもエラー項目が正しく表示されること。</span>
    <field:extension_number
        title="タイトル属性に長い文言を設定することで折り返す"
        builName="server.builNo-error"
        personalName="server.personalNo-error"
        nameAlias="">
    </field:extension_number>
  </field:block>


  <button:block>
    <n:forInputPage>
      <button:check
          uri="./サーバサイドテストページ(確認).jsp"
          dummyUri="サーバサイドテストページ(確認).jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./サーバサイドテストケース.jsp"
          dummyUri="サーバサイドテストページ(登録).jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
</n:form>
