<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template
    suite="ボタン"
    title="ボタンを並列表示">

  <jsp:attribute name="contentHtml">

    <n:form>
       <span class="test-case">すべてのボタンを並べて表示</span>
          <ul style="list-style:none; text-decoration:underline;">
            <li>ワイド表示：右→左の順</li>
            <li>コンパクト表示：右→左の順</li>
            <li>ナロー表示：下→上の順で表示されること。</li>
          </ul>

          <p>キャンセル → 戻る → 確認 → 確定</p>
          <button:block>
            <button:cancel dummyUri="./index.jsp" uri="./index.jsp"></button:cancel>
            <button:back uri="./index.jsp" dummyUri="./index.jsp" ></button:back>
            <button:check uri="./index.jsp" dummyUri="./index.jsp" ></button:check>
            <button:confirm uri="./index.jsp" dummyUri="./index.jsp" ></button:confirm>
          </button:block>
          <p>削除 → ダウンロード → サブウィンドウ</p>
          <button:block>
            <button:delete uri="./index.jsp" dummyUri="./index.jsp" ></button:delete>
            <button:download uri="./index.jsp" dummyUri="./index.jsp" label="ダウンロード"></button:download>
            <button:popup uri="./index.jsp" dummyUri="./index.jsp" label="サブウィンドウ"></button:popup>
          </button:block>
          <p>検索 → サブミット → 更新 → 閉じる</p>
          <button:block>
            <button:search uri="./index.jsp" dummyUri="./index.jsp" ></button:search>
            <button:submit uri="./index.jsp" dummyUri="./index.jsp" label="サブミット"></button:submit>
            <button:update uri="./index.jsp" dummyUri="./index.jsp" ></button:update>
            <button:close></button:close>
          </button:block>

    </n:form>
  </jsp:attribute>

</t:ui_test_template>
