<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<n:form>

  <n:forInputPage>
    <input type="hidden" name="input" value="1" />
  </n:forInputPage>

  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case required">必須属性を指定した場合、入力画面には入力欄が出力され、確認画面には入力値がラベルとして出力されること。</span>
    <field:textarea
        title="必須属性を指定"
        name="server.required">
    </field:textarea>
  </field:block>

  <field:block title="nameAlias属性">
    <span class="test-case not-nameAlias">nameAlias属性を指定しなかった場合、name属性に対応するメッセージが表示されること</span>
    <field:textarea
        title="nameAlias属性未指定"
        name="server.errorName">
    </field:textarea>

    <span class="test-case nameAlias-blank">nameAlias属性にブランクを指定した場合、name属性に対応するメッセージが表示されること</span>
    <field:textarea
        title="nameAlias属性ブランク"
        nameAlias=""
        name="server.errorName">
    </field:textarea>

    <span class="test-case nameAlias">nameAlias属性を指定した場合、項目がハイライト表示されること</span>
    <field:textarea
        title="nameAlias属性指定"
        nameAlias="server.nameAlias"
        name="dummy">
    </field:textarea>

    <span class="test-case viewonly">ラベルが改行されてもエラー項目が正しく表示されること。</span>
    <field:textarea
        title="目的はエラー項目の位置までタイトルを表示することなので長いタイトル属性を設定する。"
        nameAlias=""
        name="server.errorName"
        rows="1">
    </field:textarea>
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
