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


    <n:form>

      <tab:group name="tab">

      <c:if test="${not serverMode}">
        <tab:content title="クライアント" value="c">
          <span class="test-case">
            クライアントサイドで必須の値を全て指定
          </span>
          <button:block>
            <button:submit
                dummyUri="./index.jsp"
                uri=""
                label="ひらく">
            </button:submit>
          </button:block>

          <span class="test-case">
            サーバサイドで設定する値も含めて全ての値を設定
          </span>
          <button:block>
            <button:submit
                dummyUri="./index.jsp"
                uri="server.jsp"
                label="住所検索"
                size="4"
                cssClass="button"
                disabled="false"
                icon="fa fa-twitter"
                id="button-id"
                allowDoubleSubmission="false"
                comment="コメント"
                lockTarget="排他対象">
            </button:submit>
          </button:block>
        </tab:content>
      </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case id-test">
            id属性を指定しない場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:submit>
          </button:block>

          <span class="test-case id-test">
            id属性にブランクを設定した場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                id="">
            </button:submit>
          </button:block>

          <span class="test-case id-test">
            id属性を設定した場合、そのidがボタンに設定されること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                id="submit-id">
            </button:submit>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassを設定しない場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:submit>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassにブランクを設定した場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                cssClass="">
            </button:submit>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassを設定した場合、指定した値がボタンのclass属性に設定されること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                cssClass="button-white">
            </button:submit>
          </button:block>

          <span class="test-case size-test">
            size属性を指定しない場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:submit>
          </button:block>

          <span class="test-case size-test">
            size属性にブランクを指定した場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                size="">
            </button:submit>
          </button:block>

          <span class="test-case size-test">
            size属性を指定した場合、ボタンの幅が変わること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                size="6">
            </button:submit>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性を指定しない場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:submit>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にブランクを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="">
            </button:submit>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にfalseを指定した場合、ボタンは使用可能な状態であること（クリックで遷移できること）
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="false">
            </button:submit>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にtrueを指定した場合、ボタンは使用不可であること（クリック出来ない）
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                disabled="true">
            </button:submit>
          </button:block>

          <span class="test-case icon-test">
            icon属性を指定しない場合、アイコンは表示されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索">
            </button:submit>
          </button:block>

          <span class="test-case icon-test">
            icon属性にブランクを指定した場合、アイコンは表示されないこと
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="住所検索"
                icon="">
            </button:submit>
          </button:block>

          <span class="test-case icon-test">
            icon属性を指定した場合、アイコンが表示されること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                dummyUri="./index.jsp"
                label="Tweet"
                icon="fa fa-twitter">
            </button:submit>
          </button:block>

        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case default_value-test">
            サーバサイドで必須となる属性を全て指定
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                label="金融機関検索">
            </button:submit>
          </button:block>

          <span class="test-case allowDoubleSubmission-test">
            allowDoubleSubmissionを指定しない場合、trueとなること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                label="成り行き">
            </button:submit>
          </button:block>

          <span class="test-case allowDoubleSubmission-test">
            allowDoubleSubmissionにブランクを指定した場合、trueとなること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                label="指値"
                allowDoubleSubmission="">
            </button:submit>
          </button:block>

          <span class="test-case allowDoubleSubmission-test">
            allowDoubleSubmissionにtrueを指定した場合、trueとなること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                label="引成"
                allowDoubleSubmission="true">
            </button:submit>
          </button:block>

          <span class="test-case allowDoubleSubmission-test">
            allowDoubleSubmissionにfalseを指定した場合、falseとなること
          </span>
          <button:block>
            <button:submit
                uri="./index.jsp"
                label="逆指値"
                allowDoubleSubmission="false">
            </button:submit>
          </button:block>
        </tab:content>
      </tab:group>

    </n:form>
