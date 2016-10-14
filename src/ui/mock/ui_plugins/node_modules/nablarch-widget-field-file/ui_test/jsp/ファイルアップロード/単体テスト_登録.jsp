<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%

  ApplicationException exception = new ApplicationException();
  exception.addMessages(new ValidationResultMessage("nameAlias未指定", new StringResource() {
    @Override
    public String getId() {
      return "id";
    }

    @Override
    public String getValue(Locale locale) {
      return "単一項目のエラー";
    }
  }, new Object[0]));
  exception.addMessages(new ValidationResultMessage("error", new StringResource() {
    @Override
    public String getId() {
      return "id";
    }

    @Override
    public String getValue(Locale locale) {
      return "メッセージ";
    }
  }, new Object[0]));
  request.setAttribute("nablarch_application_error", exception);
%>
-->

<t:ui_test_template
    title="ファイルアップロード単体テスト">

  <jsp:attribute name="localCss">
    .border-blue {
      border: 1px solid blue;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <n:form>
      <tab:group name="tab">
        <tab:content title="クライアント" value="c">
          <span class="test-case">
            全属性を指定してもクライアントで表示されること
          </span>
          <field:file
              title="全て指定"
              name="全て指定"
              nameAlias="error"
              hint="ヒント部"
              domain="ドメイン"
              disabled="false"
              cssClass="border-blue"
              id="client"
              required="true"
              comment="備考">
          </field:file>
        </tab:content>
        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case">
            required属性を指定しない場合、必須マークが出力されないこと
          </span>
          <field:file
              title="required未指定"
              name="required未指定">
          </field:file>

          <span class="test-case">
            required属性にブランクを指定した場合、必須マークが出力されないこと
          </span>
          <field:file
              title="requiredブランク"
              name="requiredブランク"
              required="">
          </field:file>

          <span class="test-case">
            required属性にfalseを指定した場合、必須マークが出力されないこと
          </span>
          <field:file
              title="required[false]"
              name="required_false"
              required="false">
          </field:file>

          <span class="test-case">
            required属性にtrueを指定した場合、必須マークが出力されること
          </span>
          <field:file
              title="required[true]"
              name="required_true"
              required="true">
          </field:file>

          <span class="test-case">
            disabledを指定しない場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabled未指定"
              name="disabled未指定">
          </field:file>

          <span class="test-case">
            disabledにブランクを指定した場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabledブランク"
              name="disabledブランク"
              disabled="">
          </field:file>

          <span class="test-case">
            disabledにfalseを指定した場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabled[false]"
              name="disabled_false"
              disabled="false">
          </field:file>

          <span class="test-case">
            disabledにtrueを設定した場合、ファイル選択が出来ないこと
          </span>
          <field:file
              title="disabled[true]"
              name="disabled_true"
              disabled="true">
          </field:file>

          <span class="test-case">
            id属性を指定しない場合、name属性がid属性に設定されること（ソースで確認）
          </span>
          <field:file
              title="id未指定"
              name="id未指定">
          </field:file>

          <span class="test-case">
            id属性にブランクを指定した場合、name属性がid属性に設定されること（ソースで確認）
          </span>
          <field:file
              title="idブランク"
              name="idブランク"
              id="">
          </field:file>

          <span class="test-case">
            id属性を指定した場合、id属性にその値が設定されること（ソースで確認）
          </span>
          <field:file
              title="id設定"
              name="id設定"
              id="id.hoge">
          </field:file>

          <span class="test-case">
            cssClassを指定しない場合、class属性が設定されないこと（ソースで確認）
          </span>
          <field:file
              title="cssClass未指定"
              name="cssClass未指定">
          </field:file>

          <span class="test-case">
            cssClassにブランクを指定した場合、class属性が設定されないこと（ソースで確認）
          </span>
          <field:file
              title="cssClassブランク"
              name="cssClassブランク"
              cssClass="">
          </field:file>

          <span class="test-case">
            cssClassを指定した場合、その値がclass属性に設定されること
          </span>
          <field:file
              title="cssClass指定"
              name="cssClass指定"
              cssClass="border-blue">
          </field:file>

          <span class="test-case">
            hintを指定しない場合、ヒントは表示されないこと
          </span>
          <field:file
              title="hint未指定"
              name="hint未指定">
          </field:file>

          <span class="test-case">
            hintにブランクを指定した場合、ヒントは表示されないこと
          </span>
          <field:file
              title="hintブランク"
              name="hintブランク"
              hint="">
          </field:file>

          <span class="test-case">
            hintを指定した場合、その値がヒントに表示されること
          </span>
          <field:file
              title="hint指定"
              name="hint指定"
              hint="ひんと">
          </field:file>

        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case">
            必須項目を全て設定
          </span>
          <field:file title="必須全て" name="必須全て">
          </field:file>

          <span class="test-case">
            nameAliasを指定しない場合、ハイライト表示されないこと
          </span>
          <field:file title="nameAlias未指定" name="nameAlias未指定">
          </field:file>

          <span class="test-case">
            nameAliasにブランクを指定した場合、ハイライト表示されないこと
          </span>
          <field:file title="nameAliasブランク" name="nameAliasブランク" nameAlias="">
          </field:file>

          <span class="test-case">
            nameAliasにを指定した場合、ハイライト表示されること
          </span>
          <field:file title="nameAlias指定" name="nameAlias指定" nameAlias="error">
          </field:file>
        </tab:content>
      </tab:group>

      <button:block>
        <button:submit label="送信" uri="./単体テスト_登録.jsp"></button:submit>
      </button:block>
    </n:form>
  </jsp:attribute>

</t:ui_test_template>

