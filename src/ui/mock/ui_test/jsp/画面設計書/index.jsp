<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="設計書Viewおよびフォーム自動生成" noMenu="true">
  <jsp:attribute name="localCss">
  #content ol,
  #content ul,
  #content dl {
    margin-top : 1px;
  }
  li.suite {
    list-style-type : none;
  }
  </jsp:attribute>
  <jsp:attribute name="contentHtml">
    <ul>
      <li class="suite">一覧表示
        <ul>
         <li><link:submit label="ページング属性" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./一覧表示/一覧_ページング属性.jsp"></link:submit></li>
         <li><link:submit label="コメント属性" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./一覧表示/項目定義_コメント属性.jsp"></link:submit></li>
         <li><link:submit label="ソート条件" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./一覧表示/項目定義_ソート条件.jsp"></link:submit></li>
        </ul>
      </li>
      <li class="suite">画面イベント一覧
        <ul>
         <li><link:submit label="イベントタグ" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./画面イベント一覧/画面イベント定義－イベントタグ.jsp"></link:submit></li>
         <li><link:submit label="ボタンとリンク" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./画面イベント一覧/画面イベント定義－ボタンAndリンクタグ.jsp"></link:submit></li>
         <li><link:submit label="項目精査" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./画面イベント一覧/項目精査.jsp"></link:submit></li>
        </ul>
      </li>
      <li class="suite">項目定義
        <ul>
         <li><link:submit label="画面項目名" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/画面項目名.jsp"></link:submit></li>
         <li><link:submit label="初期値" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/初期値.jsp"></link:submit></li>
         <li><link:submit label="情報取得元(コード)" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/情報取得元_コード.jsp"></link:submit></li>
         <li><link:submit label="情報取得元" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/情報取得元.jsp"></link:submit></li>
         <li><link:submit label="情報取得元(外部インターフェース)" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/情報取得元_外部インターフェース.jsp"></link:submit></li>
         <li><link:submit label="編集仕様" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./項目定義/編集仕様.jsp"></link:submit></li>
        </ul>
      </li>
      <li class="suite">入力確認画面の仕様
        <ul>
         <li><link:submit label="入力画面" uri="javascirpt:alert('serverでは検証できません。')"
                          dummyUri="./入力_確認画面仕様/入力画面.jsp"></link:submit></li>
        </ul>
      </li>
    </ul>
  </jsp:attribute>
</t:page_template>