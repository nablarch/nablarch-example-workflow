<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button"  tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="登録画面" confirmationPageTitle="確認画面">
<spec:author>作成者</spec:author>
  <jsp:attribute name="contentHtml">
  <%-- 設計書からのリンク用 --%>
  <spec:condition name="管理者の表示(初期)" ></spec:condition>
  <spec:condition name="管理者の表示(確認)" isConfirmationPage="true"></spec:condition>
  <spec:condition name="一般の表示(初期)：他のユーザーへの参照なし" layout="入力値|ボタン"></spec:condition>
  <spec:condition name="一般の表示(確認)：他のユーザーへの参照なし" layout="入力値|ボタン" isConfirmationPage="true"></spec:condition>
  <spec:condition name="spec:descで表示内容を制御する（表示する場合）" when="c:ifの内容を表示する場合"></spec:condition>
  <spec:condition name="spec:descで表示内容を制御する（表示しない場合）" ></spec:condition>


<n:form>
  <%-- 各レイアウトの塊を定義する。 --%>
  <spec:layout name="入力値">
    <field:block name="ユーザー">
      <field:text name="名前" title="名前"></field:text>
      <field:text name="住所" title="住所"></field:text>
      <n:forConfirmationPage>
      <field:text name="郵便番号" title="郵便番号"></field:text>
      </n:forConfirmationPage>
    </field:block>
  </spec:layout>
  <spec:layout name="管理者参照" >
    <table:plain title="管理者用" id="admin_view" resultNumName="userInfos" sampleResults="2">
      <column:link uri="" dummyUri="ユーザー詳細" title="詳細" value="詳細"></column:link>
      <column:label title="名前" key="name" sample="千葉|ほたて"></column:label>
      <column:label title="年齢" key="age" sample="20|40"></column:label>
      <column:label title="住所" key="age" sample="北海道|日立"></column:label>
    </table:plain>
  </spec:layout>

  <spec:layout name="ボタン">
  <button:block>
    <n:forInputPage>
      <button:check dummyUri="./確認画面.jsp" uri="#"></button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:cancel dummyUri="./入力画面.jsp" uri="#"></button:cancel>
    </n:forConfirmationPage>
  </button:block>
  </spec:layout>
</n:form>
  </jsp:attribute>
</t:page_template>
