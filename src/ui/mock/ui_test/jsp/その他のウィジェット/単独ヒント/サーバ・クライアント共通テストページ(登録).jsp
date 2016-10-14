<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
<field:block title="">
  <n:forInputPage>
    <input type="hidden" value="1" name="confirm">
  </n:forInputPage>
  <span class="test-case">ヒントの出力位置</span>
  <field:hint>standalone</field:hint>
  <span class="test-case required-test">他の項目との相対的な位置関係</span>
  <field:text
      title="相対的な位置関係"
      name="server.required-blank"
      required=""
      sample="あいうえお">
  </field:text>
  <field:hint>relative</field:hint>

  <span class="test-case required-test">入力ウィジェットのhint属性との併用</span>
  <field:text
      title="hint属性との併用"
      name="server.required-blank"
      required=""
      sample="あいうえお"
      hint="otherWidget">
  </field:text>
  <field:hint>withHintAttribute</field:hint>

  <span class="test-case required-test">hintを複数並べた場合。</span>
  <field:text
      title="複数のhintを利用"
      name="server.required-true"
      sample="03-1234-1234">
  </field:text>
  <field:hint>ひとつめのヒント</field:hint>
  <field:hint>ふたつめのヒント。長い文字列でも、入力欄の右側で折り返されて2行表示されること</field:hint>

  <span class="test-case required-test">hintを設定するラベルが折り返す場合の確認</span>
  <field:text
      title="ラベルの折り返しが発生する場合の対応"
      name="server.required-true"
      sample="03-1234-1234">
  </field:text>
  <field:hint>long label</field:hint>

  <span class="test-case required-test">gridSizeを指定しない場合</span>
  <field:hint>gridSizeを指定しない</field:hint>

  <span class="test-case required-test">gridSizeにブランクをしていした場合</span>
  <field:hint gridSize="">gridSizeにブランクを指定</field:hint>

  <span class="test-case required-test">gridSizeを指定した場合</span>
  <field:hint gridSize="15">gridSizeを指定</field:hint>

</field:block>
<button:block>
  <n:forInputPage>
    <button:check
        uri="./サーバ・クライアント共通テストページ(確認).jsp"
        dummyUri="サーバ・クライアント共通テストページ(確認).jsp">
    </button:check>
  </n:forInputPage>
  <n:forConfirmationPage>
    <button:back
        uri="./サーバ・クライアント共通テストケース.jsp"
        dummyUri="サーバ・クライアント共通テストケース.jsp">
    </button:back>
  </n:forConfirmationPage>
</button:block>
</n:form>
