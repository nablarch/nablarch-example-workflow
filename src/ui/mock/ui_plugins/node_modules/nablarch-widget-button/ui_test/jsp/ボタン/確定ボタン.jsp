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
    title="確定ボタン">
  <jsp:attribute name="localCss">
    #confirm-id {
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
            <button:confirm
                dummyUri="./index.jsp"
                uri="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            サーバサイドで設定する値も含めて全ての値を設定
          </span>
          <button:block>
            <button:confirm
                dummyUri="./index.jsp"
                uri="server.jsp"
                label="登録"
                size="4"
                allowDoubleSubmission="true"
                cssClass="button"
                disabled="false"
                id="button-id"
                comment="イベント概要">
            </button:confirm>
          </button:block>
        </tab:content>
      </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case">
            label属性を指定しない場合、ボタンのラベルには「確定」と表示されること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp">
            </button:confirm>
          </button:block>

          <span class="test-case">
            label属性にブランクを指定した場合、ボタンのラベルには「確定」と表示されること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            label属性を指定した場合、その値がラベルに表示されること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            id属性を指定しない場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            id属性にブランクを設定した場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                id="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            id属性を設定した場合、そのidがボタンに設定されること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                id="confirm-id">
            </button:confirm>
          </button:block>

          <span class="test-case">
            cssClassを設定しない場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            cssClassにブランクを設定した場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                cssClass="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            cssClassを設定した場合、指定した値がボタンのclass属性に設定されること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                cssClass="button-white">
            </button:confirm>
          </button:block>

          <span class="test-case">
            size属性を指定しない場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            size属性にブランクを指定した場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                size="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            size属性を指定した場合、ボタンの幅が変わること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                size="6">
            </button:confirm>
          </button:block>

          <span class="test-case">
            disabled属性を指定しない場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            disabled属性にブランクを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                disabled="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            disabled属性にfalseを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                disabled="false">
            </button:confirm>
          </button:block>

          <span class="test-case">
            disabled属性にtrueを指定した場合、ボタンは使用不可であること（クリック出来ない）
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="登録"
                disabled="true">
            </button:confirm>
          </button:block>

        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case">
            サーバサイドで必須となる属性を全て指定
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp">
            </button:confirm>
          </button:block>

          <span class="test-case">
            allowDoubleSubmissionを指定しない場合、falseとなること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                label="登録">
            </button:confirm>
          </button:block>

          <span class="test-case">
            allowDoubleSubmissionにブランクを指定した場合、falseとなること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                label="登録"
                allowDoubleSubmission="">
            </button:confirm>
          </button:block>

          <span class="test-case">
            allowDoubleSubmissionにtrueを指定した場合、trueとなること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                label="登録"
                allowDoubleSubmission="true">
            </button:confirm>
          </button:block>

          <span class="test-case">
            allowDoubleSubmissionにfalseを指定した場合、falseとなること
          </span>
          <button:block>
            <button:confirm
                uri="./index.jsp"
                label="登録"
                allowDoubleSubmission="false">
            </button:confirm>
          </button:block>

        </tab:content>
      </tab:group>

    </n:form>
  </jsp:attribute>

  <jsp:attribute name="localJs">
    $('button').each(function() {
      var $button = $(this);
      var name = $button.attr('name');
      var $form = $button.parents('form');
      var formName = $form.attr('name');
      if (nablarch_submission_info[formName]) {
        var allowDoubleSubmission = nablarch_submission_info[formName][name]['allowDoubleSubmission'];
        $button.parent('div.buttonWrapper').after($('<span>').text('allowDoubleSubmission = [' + allowDoubleSubmission
            + ']'));
      }
    });
  </jsp:attribute>
</t:ui_test_template>
