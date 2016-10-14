<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
  suite    = "ダイアログ"
  title    = "ダイアログデモ画面"
  confirmationPageTitle="ダイアログ確認画面"
  testdata = "./ダイアログ_デモデータ.jsp"
  testpage = "./ダイアログ_デモページ.jsp">
  <jsp:attribute name="contentHtml">
  <event:listen event='select[name="formdata.userDept"] change'>
    <event:alert
      target="input:password"
      condition=":is-not-blank"
      message="パスワードが入力済みです。">
    </event:alert>
    <event:confirm
       condition=":is-value(総務, 経理)"
       message="パスワード以外を読取専用にします。よろしいですか？">
    </event:confirm>
    <event:confirm
       condition=":is-blank"
       message="パスワードを非活性にします。よろしいですか？">
    </event:confirm>
    <event:toggle_readonly
      target="input:text"
      condition=":is-value(総務, 経理)">
    </event:toggle_readonly>
    <event:toggle_disabled
      target="input:password"
      condition=":is-blank">
    </event:toggle_disabled>
  </event:listen>

  <event:listen event="input:checkbox change">
    <event:confirm
      condition=":is-value(登録, 削除, 更新)"
      message="切り替わります。">
    </event:confirm>
    <event:toggle_readonly
      target='select[name="formdata.insertUser"]'
      condition='[value="登録"]'
      reverse="true">
    </event:toggle_readonly>
    <event:toggle_readonly
      target='select[name="formdata.updateUser"]'
      condition='[value="更新"]'
      reverse="true">
    </event:toggle_readonly>
    <event:toggle_readonly
      target='select[name="formdata.deleteUser"]'
      condition='[value="削除"]'
      reverse="true">
    </event:toggle_readonly>
  </event:listen>
<n:forInputPage>
  <event:listen event="button click">
    <event:alert
      target="input:not(:hidden)"
      condition=":is-blank"
      message="全項目必須です。">
    </event:alert>
    <event:confirm message="送信します。よろしいですか？">
    </event:confirm>
  </event:listen>
</n:forInputPage>
  </jsp:attribute>
</t:ui_test_template>
