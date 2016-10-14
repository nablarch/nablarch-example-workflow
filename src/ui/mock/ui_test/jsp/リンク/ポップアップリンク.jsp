<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  request.setAttribute("serverMode", true);
%>

<t:ui_test_template
    suite="リンク"
    title="ポップアップリンク">
  <jsp:attribute name="localCss">
    #link-id {
      font-size: 2em;
      color: #000066;
    }

    #link-id:hover {
      color: red;
    }

    a.style {
      font-size: 1.25em;
      color: #ffffff;
      text-decoration: none;
      background-color: blue;
      text-align: center;
      padding: 0 1em 0 1em;
    }

  </jsp:attribute>
  <jsp:attribute name="contentHtml">
    <n:form>
      <tab:group name="tab">
        <c:if test="${not serverMode}">
          <tab:content title="クライアント" value="c">
            <span class="test-case">
              必須属性を全て指定
            </span>
            <button:block>
              <link:popup
                  label="ポップアップリンク"
                  uri=""
                  dummyUri="./index.jsp">
              </link:popup>
            </button:block>

            <span class="test-case">
              サーバサイドで設定する値も含めて全て設定した場合の動作
            </span>
            <button:block>
              <link:popup
                  label="ポップアップリンク"
                  uri="hoge.jsp"
                  dummyUri="./index.jsp"
                  id="client-link-id"
                  cssClass="style"
                  popupOption="top=50, width=100, height=150"
                  popupWindowName="sub"
                  comment="コメント">
              </link:popup>
            </button:block>
          </tab:content>
        </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case">
            idを指定しない場合、id属性が設定されないこと
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp">
            </link:popup>
          </button:block>

          <span class="test-case">
            idにブランクを設定した場合、id属性が設定されないこと
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp"
                id="">
            </link:popup>
          </button:block>

          <span class="test-case">
            idを設定した場合、そのidがid属性に設定されること
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp"
                id="link-id">
            </link:popup>
          </button:block>

          <span class="test-case">
            cssClassを設定しない場合、class属性が設定されないこと
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp">
            </link:popup>
          </button:block>

          <span class="test-case">
            cssClassにブランクを設定した場合、class属性が設定されないこと
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp"
                cssClass="">
            </link:popup>
          </button:block>

          <span class="test-case">
            cssClassを設定した場合、class属性にその値が設定されること
          </span>
          <button:block>
            <link:popup
                label="住所検索"
                uri="./index.jsp"
                dummyUri="./index.jsp"
                cssClass="style">
            </link:popup>
          </button:block>

          <span class="test-case">
            popupOptionを指定しない場合、オプションなしでウィンドウが開かれること
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupWindowName="noOption">
            </link:popup>
          </button:block>

          <span class="test-case">
            popupOptionにブランクを指定した場合、オプションなしでウィンドウが開かれること
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupWindowName="blankOption"
              popupOption="">
            </link:popup>
          </button:block>

          <span class="test-case">
            popupOptionを指定した場合、そのオプションでウィンドウが開かれること
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupWindowName="subWithOption"
              popupOption="menubar=no, width=100, height=100">
            </link:popup>
          </button:block>
        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case">
            必須属性を全て指定
          </span>
          <button:block>
            <link:popup
              label="金融機関検索"
              popupWindowName="bank"
              uri="./index.jsp">
            </link:popup>
          </button:block>

        </tab:content>

        <tab:content title="popupWindowName（打鍵用）" value="c">
          <span class="test-case">
            1.popupWindowNameを指定しない場合、"subwindow"が指定されること
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupOption="width=100, height=100">
            </link:popup>
          </button:block>

          <span class="test-case">
            2.popupWindowNameにブランクを指定した場合、"subwindow"が指定されること
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupOption="width=100, height=100">
            </link:popup>
          </button:block>

          <span class="test-case">
            3.popupWindowNameにデフォルト値（"subwindow"）を指定した場合
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupOption="width=100, height=100"
              popupWindowName="subwindow">
            </link:popup>
          </button:block>

          <span class="test-case">
            4.popupWindowNameにデフォルトでない値を指定した場合
          </span>
          <button:block>
            <link:popup
              label="Tweet"
              uri="./index.jsp"
              dummyUri="./index.jsp"
              cssClass="style"
              popupOption="width=100, height=100"
              popupWindowName="notDefaultWindowName">
            </link:popup>
          </button:block>
        </tab:content>
      </tab:group>
    </n:form>
  </jsp:attribute>
</t:ui_test_template>
