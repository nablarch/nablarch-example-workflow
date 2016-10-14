<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
    <tab:group name="tab">
    <tab:content
      title="ユーザ基本情報"
      selected="true"
      value="tab-baseinfo">
      <field:pulldown elementValueProperty="ugroupName"
                      elementLabelProperty="ugroupName"
                      listName="userTypeList"
                      title="ユーザー部署"
                      name="formdata.userDept"
                      sample="総務|経理|営業|人事"
                      withNoneOption="true">
      </field:pulldown>

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
                      sample="">
      </field:password>
      <field:password title="パスワード（確認用）"
                      domain="パスワード"
                      required="true"
                      maxlength="20"
                      name="formdata.confirmPassword"
                      sample="">
      </field:password>
      <field:hint>半角英数記号20文字以内</field:hint>

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
    </tab:content>

    <tab:content
      title="利用機能選択"
      value="tab_authinfo">

      <field:block title="機能選択">
        <field:checkbox title="利用機能"
                        required="true"
                        name="formdata.appType"
                        listName="applicationTypeList"
                        elementLabelProperty="appName"
                        elementValueProperty="appName"
                        hint="利用する機能を選択してください。"
                        sample="総務|経理|営業|人事">
        </field:checkbox>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="登録者"
                        name="formdata.insertUser"
                        sample="総務|経理|営業|人事">
        </field:pulldown>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="更新者"
                        name="formdata.updateUser"
                        sample="総務|経理|営業|人事">
        </field:pulldown>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="削除者"
                        name="formdata.deleteUser"
                        sample="総務|経理|営業|人事">
        </field:pulldown>
      </field:block>

      <field:pulldown title="グループ"
                      required="true"
                      name="formdata.ugroupId"
                      listName="allGroup"
                      elementLabelProperty="ugroupName"
                      elementValueProperty="ugroupId"
                      hint="所属グループを選択してください。"
                      sample="[お客様グループ]|一般グループ">
      </field:pulldown>
    </tab:content>
    </tab:group>


    <button:block>
      <n:forInputPage>
        <button:check uri="./ダイアログ_確認.jsp">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel uri="./ダイアログ.jsp">
        </button:cancel>
      </n:forConfirmationPage>
    </button:block>
  </n:form>
