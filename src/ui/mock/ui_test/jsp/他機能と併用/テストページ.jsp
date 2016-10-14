<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">
<event:listen event="#check,#cancel beforeSubmit">
  <event:confirm message="送信しますか？"></event:confirm>
</event:listen>

  <field:block title="beforeSubmitに関連する機能とイベントFWの併用確認">
    <field:text title="readonly" name="formdata.readonly" readonly="true"></field:text>
  </field:block>

  <field:block title="カレンダーでの変更イベントと併用">
    <event:listen event="#calendar change">
      <event:write_to target="#to" format="{input}"></event:write_to>
    </event:listen>
    <field:calendar title="カレンダー" name="form.calendar" id="calendar"></field:calendar>
    <field:text title="反映先" name="form.to" id="to"></field:text>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check  id="check" uri="./確認画面.jsp" dummyUri="javascript:alert('サブミット拡張はサーバーサイドで動作します')">
      </button:check>
    </n:forInputPage>

    <n:forConfirmationPage>
      <button:cancel id="cancel" uri="./テストケース.jsp" dummyUri="javascript:alert('サブミット拡張はサーバーサイドで動作します')">
      </button:cancel>
    </n:forConfirmationPage>
  </button:block>

</n:form>
