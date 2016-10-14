<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);
%>
-->

<t:ui_test_template
    suite="ツリーリスト"
    title="階層化メニュー表示"
    confirmationPageTitle="階層化メニュー表示">

<jsp:attribute name="localCss">
  #content ul.menu_title, #content ul.menu_folder {
    float:left;
    list-style-type:none;
  }
  #content span.menu_title {
    width : 100%;
    float:left;
    color : #DE9932
  }
  #content li.margin {
    margin-bottom : 0.5em;
  }
  #content .menu_folder {
    display:none;
  }
  #content .menu_title:hover, menu_folder:hover {
    cursor : pointer;
  }
  #content li span.menu_title {
    margin-top : 20px;
    width : 100%;
  }
  #content .second_line {
    margin-left : 30px;
  }
  #content .third_line {
    margin-left : 50px;
  }
  #content .firth_line {
    margin-left : 70px;
  }
  #content ul {
    bottom : 5px;
    margin-top:0;
    margin-bottom:0;
    width:100%;
  }
</jsp:attribute>
<jsp:attribute name="contentHtml">
  <n:form name="sampleForm">
  <span class="test-case">メニューのタイトルを押下した場合、開閉状態が変更されること。</span>
   <field:block>
   <div class="nablarch_TreeMenu -name sampleForm">
   <n:plainHidden name="sampleForm"></n:plainHidden>

     <span class="menu_title" id="1">テストメニュー 1 (5 children)</span>
     <%-- 2階層目 --%>
       <ul class="testMenu menu_folder -title 1 second_line">
         <li>テストメニュー 1-1</li>
         <li>テストメニュー 1-2</li>
         <li>テストメニュー 1-3</li>
       </ul>
         <span class="testMenu menu_title menu_folder -title 1 second_line" id="1_4">テストメニュー 1-4(1 child)</span>
           <%-- 3階層目 --%>
           <ul class="testMenu menu_folder -title 1_4 third_line">
             <li>テストメニュー 1-4-1</li>
             <li class="margin"></li>
           </ul>
         <span class="testMenu menu_title menu_folder -title 1 second_line" id="1_5">テストメニュー 1-5(7 children)</span>
           <ul class="testMenu menu_folder -title 1_5 third_line">
              <li>テストメニュー 1-5-1</li>
              <li>テストメニュー 1-5-2</li>
              <li>テストメニュー 1-5-3</li>
           </ul>
            <span class="testMenu menu_title menu_folder -title 1_5 third_line" id="1_5_1">テストメニュー 1-5-4(2 children)</span>
              <ul class="testMenu menu_folder -title 1_5_1 firth_line">
                <li>テストメニュー 1-5-4-1</li>
                <li>テストメニュー 1-5-4-2</li>
              </ul>
            <ul class="testMenu menu_folder -title 1_5 third_line">
              <li>テストメニュー 1-5-5</li>
              <li>テストメニュー 1-5-6</li>
              <li>テストメニュー 1-5-7</li>
           </ul>
   </div>
   </field:block>

  <button:block>
    <n:forInputPage>
      <button:check
          uri="./ツリーメニュー_確認.jsp"
          dummyUri="ツリーメニュー_確認.jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./ツリーメニュー.jsp"
          dummyUri="ツリーメニュー.jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
  </n:form>
</jsp:attribute>
</t:ui_test_template>
