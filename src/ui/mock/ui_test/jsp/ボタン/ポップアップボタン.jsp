<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  request.setAttribute("serverMode", true);
%>

<t:ui_test_template
    suite="ボタン"
    title="ポップアップボタン">
  <jsp:attribute name="localCss">
    #popup-id {
      background: #000066;
      background-color: #000066;
      border: none;
      text-shadow: none;
      font-weight: normal;
      color: #ffffff;
    }

    .button-white {
      background: #ffffff;
      background-color: #ffffff !important;
      color: #000000;
      font-weight: normal;
      border: #000000 solid 1px;
      text-shadow: none;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">

    <n:form>

      <tab:group name="tab">

      <c:if test="${not serverMode}">
        <tab:content title="クライアント" value="c">
          <span class="test-case">
            クライアントサイドで必須の値を全て指定
          </span>
          <button:block>
            <button:popup
                dummyUri="./index.jsp"
                uri=""
                label="ひらく">
            </button:popup>
          </button:block>

          <span class="test-case">
            サーバサイドで設定する値も含めて全ての値を設定
          </span>
          <button:block>
            <button:popup
                dummyUri="./index.jsp"
                uri="server.jsp"
                label="住所検索"
                size="4"
                cssClass="button"
                disabled="false"
                icon="fa fa-twitter"
                popupOption="top=50, width=100, height=150"
                popupWindowName="sub"
                id="button-id"
                comment="イベント概要">
            </button:popup>
          </button:block>
        </tab:content>
      </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case">
            id属性を指定しない場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:popup>
          </button:block>

          <span class="test-case">
            id属性にブランクを設定した場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                id="">
            </button:popup>
          </button:block>

          <span class="test-case">
            id属性を設定した場合、そのidがボタンに設定されること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                id="popup-id">
            </button:popup>
          </button:block>

          <span class="test-case">
            cssClassを設定しない場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:popup>
          </button:block>

          <span class="test-case">
            cssClassにブランクを設定した場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                cssClass="">
            </button:popup>
          </button:block>

          <span class="test-case">
            cssClassを設定した場合、指定した値がボタンのclass属性に設定されること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                cssClass="button-white">
            </button:popup>
          </button:block>

          <span class="test-case">
            size属性を指定しない場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:popup>
          </button:block>

          <span class="test-case">
            size属性にブランクを指定した場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                size="">
            </button:popup>
          </button:block>

          <span class="test-case">
            size属性を指定した場合、ボタンの幅が変わること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                size="6">
            </button:popup>
          </button:block>

          <span class="test-case">
            disabled属性を指定しない場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:popup>
          </button:block>

          <span class="test-case">
            disabled属性にブランクを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="">
            </button:popup>
          </button:block>

          <span class="test-case">
            disabled属性にfalseを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="false">
            </button:popup>
          </button:block>

          <span class="test-case">
            disabled属性にtrueを指定した場合、ボタンは使用不可であること（クリック出来ない）
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="true">
            </button:popup>
          </button:block>

          <span class="test-case">
            icon属性を指定しない場合、アイコンは表示されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:popup>
          </button:block>

          <span class="test-case">
            icon属性にブランクを指定した場合、アイコンは表示されないこと
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                icon="">
            </button:popup>
          </button:block>

          <span class="test-case">
            icon属性を指定した場合、アイコンが表示されること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="Tweet"
                icon="fa fa-twitter">
            </button:popup>
          </button:block>

          <span class="test-case">
            popupOptionを指定しない場合、オプションなしでウィンドウが開かれること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="Tweet"
                popupWindowName="name">
            </button:popup>
          </button:block>

          <span class="test-case">
            popupOptionにブランクを指定した場合、オプションなしでウィンドウが開かれること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="Tweet"
                popupWindowName="name"
                popupOption="">
            </button:popup>
          </button:block>

          <span class="test-case">
            popupOptionを指定した場合、そのオプションでウィンドウが開かれること
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="Tweet"
                popupWindowName="subWithOption"
                popupOption="menubar=no, width=100, height=100">
            </button:popup>
          </button:block>
        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case">
            サーバサイドで必須となる属性を全て指定
          </span>
          <button:block>
            <button:popup
                uri="./index.jsp"
                popupWindowName="bank"
                label="金融機関検索">
            </button:popup>
          </button:block>
        </tab:content>
      </tab:group>

    </n:form>
  </jsp:attribute>
</t:ui_test_template>
