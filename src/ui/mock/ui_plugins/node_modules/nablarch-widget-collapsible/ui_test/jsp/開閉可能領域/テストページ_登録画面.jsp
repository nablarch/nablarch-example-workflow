<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
    <n:plainHidden name="block_status" />
    <field:block
      title="ユーザ基本情報"
      collapsible="true"
      name="block_status"
      value="basic_info"
      collapsed="true">
      <field:text title="ログインID"
                  domain="ログインID"
                  required="true"
                  maxlength="20"
                  hint="半角英数記号20文字以内"
                  name="formdata.loginId"
                  sample="test01">
      </field:text>
      <field:password title="パスワード"
                      domain="パスワード"
                      required="true"
                      maxlength="20"
                      name="formdata.newPassword"
                      sample="password">
      </field:password>
      <field:password title="パスワード（確認用）"
                      domain="パスワード"
                      required="true"
                      maxlength="20"
                      name="formdata.confirmPassword"
                      sample="password">
      </field:password>

      <field:text title="漢字氏名"
                  domain="氏名"
                  required="true"
                  maxlength="50"
                  hint="全角50文字以内"
                  name="formdata.kanjiName"
                  sample="名部　楽太郎">
      </field:text>

      <field:text title="カナ氏名"
                  domain="カナ氏名"
                  required="true"
                  maxlength="50"
                  hint="全角カナ50文字以内"
                  name="formdata.kanaName"
                  sample="ナブ　ラクタロウ">
      </field:text>
      <field:text title="メールアドレス"
                  domain="メールアドレス"
                  required="true"
                  maxlength="100"
                  hint="半角英数記号100文字以内"
                  name="formdata.mailAddress"
                  sample="nabla@example.com">
      </field:text>
    </field:block>

    <field:block
      title="権限情報"
      collapsible="true"
      name="block_status"
      value="auth_info"
      collapsed="true">

      <field:pulldown title="利用機能"
                      required="true"
                      name="formdata.permissionUnitId"
                      listName="allPermissionUnit"
                      elementLabelProperty="permissionUnitName"
                      elementValueProperty="permissionUnitId"
                      hint="利用する機能を選択してください。"
                      sample="[ユーザ一覧照会]|ユーザ情報登録">
      </field:pulldown>

      <field:pulldown title="グループ"
                      required="true"
                      name="formdata.ugroupId"
                      listName="allGroup"
                      elementLabelProperty="ugroupName"
                      elementValueProperty="ugroupId"
                      hint="所属グループを選択してください。"
                      sample="[お客様グループ]|一般グループ">
      </field:pulldown>
    </field:block>

    <button:block>
      <n:forInputPage>
        <button:check uri="./確認画面.jsp" dummyUri="./確認画面.jsp">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel uri="./登録画面.jsp" dummyUri="./登録画面.jsp">
        </button:cancel>
      </n:forConfirmationPage>
    </button:block>
  </n:form>
