<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
    <n:plainHidden name="block_status" />
    <n:plainHidden name="inputError" id="inputError" />
    <n:plainHidden name="grobalError" id="grobalError" />
    <field:block
      title="初期状態が開の場合、精査エラーがあれば開いている。"
      collapsible="true"
      name="block_status"
      value="basic_info"
      collapsed="false">
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
                      sample="password">
      </field:password>
      <field:password title="パスワード（確認用）"
                      domain="PASSWORD"
                      required="true"
                      maxlength="20"
                      name="formdata.confirmPassword"
                      sample="password">
      </field:password>
    </field:block>

    <field:block
      title="初期状態が閉の場合、精査エラーがあれば開いている。"
      collapsible="true"
      name="block_status"
      value="additional_info"
      collapsed="true">
      <field:text title="漢字氏名"
                  domain="KANJI_NAME"
                  required="true"
                  maxlength="50"
                  hint="全角50文字以内"
                  name="formdata.kanjiName"
                  sample="名部　楽太郎">
      </field:text>
      <field:text title="カナ氏名"
                  domain="KANA_NAME"
                  required="true"
                  maxlength="50"
                  hint="全角カナ50文字以内"
                  name="formdata.kanaName"
                  sample="ナブ　ラクタロウ">
      </field:text>
      <field:text title="メールアドレス"
                  domain="MAIL_ADDRESS"
                  required="true"
                  maxlength="100"
                  hint="半角英数記号100文字以内"
                  name="formdata.mailAddress"
                  sample="nabla@example.com">
      </field:text>
    </field:block>
    <button:block>
        <button:check uri="./精査エラー_テストケース.jsp" label="入力エラー" id="showInputError">
        </button:check>
        <button:check uri="./精査エラー_テストケース.jsp" label="グローバルエラー" id="showGrobalError" size="5">
        </button:check>
        <button:check uri="./精査エラー_テストケース.jsp" label="エラーを消す" id="resetError">
        </button:check>
        <button:check uri="./精査エラー_テストケース.jsp" label="両方を出す。" id="showError">
        </button:check>
    </button:block>
  </n:form>