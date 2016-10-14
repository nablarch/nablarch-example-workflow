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

<t:page_template title="画面イベント一覧－画面イベント定義ーイベントタグ">
  <jsp:attribute name="contentHtml">
    <spec:layout name="入力欄">
      <n:form>
        <!-- 画面表示項目 -->
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="ユーザー部署"
                        name="formdata.userDept"
                        sample="総務|経理|営業|人事"
                        withNoneOption="true">
        </field:pulldown>

        <field:text title="ログインID"
                    domain="LOGIN_ID"
                    required="true"
                    maxlength="20"
                    hint="半角英数記号20文字以内"
                    name="formdata.loginId"
                    sample="test01">
        </field:text>
        <field:password title="パスワード"
                        domain="PASSWORD"
                        required="true"
                        maxlength="20"
                        name="formdata.newPassword"
                        sample="">
        </field:password>
        <field:password title="パスワード（確認用）"
                        domain="PASSWORD"
                        required="true"
                        maxlength="20"
                        name="formdata.confirmPassword"
                        sample="">
        </field:password>

        <field:text title="漢字氏名"
                    domain="KANJI_NAME"
                    required="true"
                    maxlength="50"
                    hint="全角50文字以内"
                    name="formdata.kanjiName"
                    sample="名部　楽太郎">
        </field:text>

        <!-- イベント定義 -->
        <event:listen event='select[name="formdata.userDept"] change'
                      title="部門変更"
                      operation="ユーザーの所属部門を変更した場合"
                      comment="変更された場合、パスワード入力精査後、確認ダイアログを表示する。">
          <!-- 画面表示項目－ボタン（属性記述あり－内容あり） -->
          <event:alert
            title="エラー：パスワード入力済み"
            target="input:password"
            condition=":is-not-blank"
            message="パスワードが入力済みです。">
          </event:alert>

          <!-- 画面表示項目－ボタン（属性記述あり－内容なし） -->
          <event:confirm
            condition=":is-value(総務, 経理)"
            message="パスワード以外を読取専用にします。よろしいですか？">
          </event:confirm>

          <!-- 画面表示項目－ボタン（属性記述なし） -->
          <event:toggle_readonly
            target="input:text"
            condition=":is-value(総務, 経理)">
          </event:toggle_readonly>
        </event:listen>
        <event:listen_subwindow event="" watchTarget="" title="ユーザー選択" operation="子画面でユーザーを選択" comment="選択した子画面の情報を反映する。">
        </event:listen_subwindow>

      </n:form>
    </spec:layout>
  </jsp:attribute>
</t:page_template>