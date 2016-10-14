<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="table"  tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<t:page_template title="画面イベント一覧－画面イベント定義ーボタン・リンクタグ" >
  <jsp:attribute name="contentHtml">
    <spec:layout name="入力欄">
      <n:form>
        <!-- 画面表示項目－ボタン（属性記述あり－内容あり） -->
        <field:block title="ボタン（属性記述あり－内容あり）"></field:block>
        <button:block >
          <button:back label="戻る＠" dummyUri="./W11AC0101.jsp" comment="戻るボタンの概要" uri="" ></button:back>
          <button:popup label="ポップアップ＠" dummyUri="./W11AC0101.jsp" comment="ポップアップボタンの概要" uri="" label=""></button:popup>
          <button:check label="確認＠" dummyUri="./W11AC0101.jsp" comment="確認ボタンの概要" uri=""></button:check>
          <button:close label="閉じる＠" comment="閉じるボタンの概要"></button:close>
          <button:cancel label="キャンセル＠" dummyUri="./W11AC0101.jsp" comment="キャンセルボタンの概要" uri=""></button:cancel>
          <button:delete label="削除＠" dummyUri="./W11AC0101.jsp" comment="削除ボタンの概要" uri=""></button:delete>
          <button:search label="検索＠" dummyUri="./W11AC0101.jsp" comment="検索ボタンの概要" uri=""></button:search>
          <button:submit label="サブミット＠" dummyUri="./W11AC0101.jsp" comment="サブミットボタンの概要" uri="" label=""></button:submit>
          <button:update label="更新＠" dummyUri="./W11AC0101.jsp" comment="更新ボタンの概要" uri=""></button:update>
          <button:confirm label="確定＠" dummyUri="./W11AC0101.jsp" comment="確定ボタンの概要" uri=""></button:confirm>
          <button:download label="ダウンロード＠" dummyUri="./W11AC0101.jsp" comment="ダウンロードボタンの概要" label="" uri=""></button:download>
        </button:block>

        <!-- 画面表示項目－ボタン（属性記述あり－内容なし） -->
        <field:block title="ボタン（属性記述あり－内容なし）"></field:block>
        <button:block>
          <button:submit label="ボタン属性記述あり－内容なし" dummyUri="" comment="" uri="" size="6"></button:submit>
        </button:block>

        <!-- 画面表示項目－ボタン（属性記述なし） -->
        <field:block title="ボタン（属性記述なし）"></field:block>
        <button:block>
          <button:base label="ボタン属性記述なし" uri="" bodyContent="" size="6"></button:base>
        </button:block>

        <!-- 画面表示項目－リンク -->
        <table:search_result title="リンク表示確認用テーブル" listSearchInfoName="" sampleResults="5" id="serach_result" searchUri="" resultSetName="searchResult">
          <column:link title="リンク属性記述あり－内容あり" key="loginId" dummyUri="./W11AC0102.jsp" comment="コメント" uri="" sample="user001|user002|user003" dataFrom="SYSTEM_ACCOUNT.LOGIN_ID"></column:link>
          <column:link title="リンク属性記述あり－内容なし" key="loginId" dummyUri="" comment="" uri="" sample="user001|user002|user003" dataFrom="SYSTEM_ACCOUNT.LOGIN_ID"></column:link>
          <column:link title="リンク属性記述なし" key="loginId" uri="" sample="user001|user002|user003" dataFrom="SYSTEM_ACCOUNT.LOGIN_ID"></column:link>
          <column:link title="" key="loginId" comment="タイトルが空" uri="" sample="タイトルが空" dataFrom="SYSTEM_ACCOUNT.LOGIN_ID"></column:link>
        </table:search_result>

        <!-- イベント一覧 > 排他制御対象 -->
        <button:block>
          <button:confirm
              uri=""
              label="排他制御対象なし"
              comment="lockTargetが指定されていない場合は、排他制御対象が空となること">
          </button:confirm>
          <button:confirm
              uri=""
              label="排他制御対象ブランク"
              comment="lockTargetがブランクの場合は、排他制御対象が空となること"
              lockTarget="">
          </button:confirm>
          <button:confirm
              uri=""
              label="排他制御対象あり"
              comment="lockTargetが指定されている場合は、排他制御対象に対象テーブルの論理名が出力されること"
              lockTarget="USERS">
          </button:confirm>
        </button:block>

        <!-- イベント一覧 > 2重サブミット（確定ボタン以外） -->
        <button:block>
          <button:check
              uri=""
              label="2重サブミット防止なし"
              comment="allowDoubleSubmissionが指定されていない場合は、2重サブミット防止対象が空になること">
          </button:check>
          <button:check
              uri=""
              label="2重サブミット防止ブランク"
              comment="allowDoubleSubmissionがブランクの場合は、2重サブミット防止対象が空となること"
              allowDoubleSubmission="">
          </button:check>
          <button:check
              uri=""
              label="2重サブミット防止true"
              comment="allowDoubleSubmissionがtrueに指定されている場合は、2重サブミット防止対象が空となること"
              allowDoubleSubmission="true">
          </button:check>
          <button:check
              uri=""
              label="2重サブミット防止false"
              comment="allowDoubleSubmissionがfalseに指定されている場合は、2重サブミット防止対象に○が出力されること"
              allowDoubleSubmission="false">
          </button:check>
        </button:block>

        <!-- イベント一覧 > 2重サブミット（確定ボタン） -->
        <button:block>
          <button:confirm
              uri=""
              label="確定ボタン2重サブミット防止なし"
              comment="確定ボタンでallowDoubleSubmissionが指定されていない場合は、2重サブミット防止対象が○になること">
          </button:confirm>
          <button:confirm
              uri=""
              label="確定ボタン2重サブミット防止ブランク"
              comment="確定ボタンでallowDoubleSubmissionが指定されていない場合は、2重サブミット防止対象が○になること"
              allowDoubleSubmission="">
          </button:confirm>
          <button:confirm
              uri=""
              label="確定ボタン2重サブミット防止false"
              comment="確定ボタンでallowDoubleSubmissionがfalseに指定されている場合は、2重サブミット防止対象が○になること"
              allowDoubleSubmission="false">
          </button:confirm>
          <button:confirm
              uri=""
              label="確定ボタン2重サブミット防止true"
              comment="確定ボタンでallowDoubleSubmissionがtrueに指定されている場合は、2重サブミット防止対象が空になること"
              allowDoubleSubmission="true">
          </button:confirm>
        </button:block>

      </n:form>
    </spec:layout>
  </jsp:attribute>
</t:page_template>
