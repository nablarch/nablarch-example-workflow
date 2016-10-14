<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <n:forInputPage>
    <input name="input" type="hidden" value="1"/>
  </n:forInputPage>

  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case required">必須属性を指定した場合、入力画面には入力欄が出力され、確認画面には入力値がラベルとして出力されること。</span>
    <field:checkbox
        title="必須属性を指定"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        listFormat="sp"
        name="server.required">
    </field:checkbox>
  </field:block>

  <field:block title="nameAlias属性">
    <span class="test-case not-nameAlias">nameAlias属性を指定しなかった場合、name属性に対応するメッセージが表示されること</span>
    <field:checkbox
        title="nameAlias属性未指定"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        listFormat="sp"
        name="server.nameAlias-none">
    </field:checkbox>
    <span class="test-case nameAlias-blank">nameAlias属性にブランクを指定した場合、name属性に対応するメッセージが表示されること</span>
    <field:checkbox
        title="nameAlias属性ブランク"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        listFormat="sp"
        nameAlias=""
        name="server.nameAlias-blank">
    </field:checkbox>
    <span class="test-case nameAlias">nameAlias属性を指定した場合、項目のclass属性にnablarch_errorが設定されること</span>
    <field:checkbox
        title="nameAlias属性指定"
        name="server.nameAlias-nonblank"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        listFormat="sp"
        nameAlias="server.nameAlias-test">
    </field:checkbox>
    <span class="test-case viewonly">ラベルが改行されてもエラー項目が正しく表示されること。</span>
    <field:checkbox
        title="タイトル属性に長い文言を設定することで折り返す"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        disabled="true"
        listFormat="sp"
        nameAlias=""
        name="server.nameAlias-blank">
    </field:checkbox>
  </field:block>

  <field:block title="elementLabelPattern属性">
    <span class="test-case elementLabelPattern-none">elementLabelPattern属性を指定しない場合、elementLabelPropertyに指定したプロパティの値が表示されること</span>
    <field:checkbox
        title="elementLabelPattern属性未指定"
        required="true"
        elementLabelProperty="label"
        elementValueProperty="value"
        listName="checkbox-list"
        name="server.labelpattern-none">
    </field:checkbox>
    <span class="test-case elementLabelPattern-blank">elementLabelPattern属性をブランクとした場合、elementLabelPropertyに指定したプロパティの値が表示されること</span>
    <field:checkbox
        title="elementLabelPattern属性ブランク"
        required="true"
        elementLabelProperty="label"
        elementValueProperty="value"
        elementLabelPattern=""
        listName="checkbox-list"
        name="server.labelpattern-blank">
    </field:checkbox>
    <span class="test-case elementLabelPattern-not-blank">elementLabelPattern属性を指定した場合、指定したフォーマットで表示されること</span>
    <field:checkbox
        title="elementLabelPattern属性指定"
        required="true"
        elementLabelProperty="label"
        elementValueProperty="value"
        elementLabelPattern="$VALUE$ - $LABEL$"
        listName="checkbox-list"
        name="server.labelpattern">
    </field:checkbox>
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
