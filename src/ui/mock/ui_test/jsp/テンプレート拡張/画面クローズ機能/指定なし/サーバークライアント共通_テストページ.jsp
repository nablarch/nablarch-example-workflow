<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form windowScopePrefixes="formdata">
    <div id="mock"></div>
    <div>
      <span class="testcase default">nablarch_windowCloseがない場合はウィンドウはクローズしない</span>
      <button:block>
        <button class="" type="button">指定なし</button>
        <a href="#" class="">指定なし</a>
      </button:block>
    </div>
    <div>
      <span class="testcase default">nablarch_windowCloseがある場合は閉じる</span>
      <button:block>
        <button class="nablarch_WindowClose" type="button">class指定</button>
        <br>
        <a href="#" class="nablarch_WindowClose">class指定</a>
      </button:block>
    </div>
    <div>
      <span class="testcase eventDef">テンプレートのwhenToCloseを指定しないため閉じない。</span>
      <button:block>
        <button class="eventDef_test" type="button">event定義</button>
        <br>
        <a href="#" class="eventDef_test">event定義</a>
      </button:block>
    </div>

    </n:form>
