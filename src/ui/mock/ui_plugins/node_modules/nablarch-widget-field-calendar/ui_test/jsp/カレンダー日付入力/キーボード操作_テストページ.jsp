<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">

  <field:block title="サブミット機能との連携">

    <span class="testcase">
    Enterキーの動作
    <br>カレンダーにフォーカスがない場合、カレンダーが動作せず、サブミットされること。
    <br>カレンダーボタンにフォーカスがある場合、カレンダーが動作すること。
    </span>
    <br>

    <field:calendar
      title="適用開始日"
      required="true"
      format=""
      name="formdata.effectiveDate"
      example="2013/04/01"
      locale="ja">
    </field:calendar>

    <field:calendar
      title="適用終了日"
      id="lastEffectiveDate"
      required="true"
      name="formdata.lastEffectiveDate"
      locale="ja"
      hint="入力例 ： 2013/05/12">
    </field:calendar>

    <field:calendar
      title="非活性"
      id="disabled"
      required="true"
      name="formdata.disabled"
      disabled="true">
    </field:calendar>

    <field:calendar
      title="読取専用"
      id="readonly"
      required="true"
      name="formdata.readonly"
      readonly="true">
    </field:calendar>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check  id="check" uri="./キーボード操作_確認.jsp" dummyUri="./キーボード操作_確認.jsp">
      </button:check>
    </n:forInputPage>

    <n:forConfirmationPage>
      <button:cancel id="cancel" uri="./キーボード操作_登録.jsp" dummyUri="./キーボード操作_登録.jsp">
      </button:cancel>
    </n:forConfirmationPage>
  </button:block>

</n:form>
