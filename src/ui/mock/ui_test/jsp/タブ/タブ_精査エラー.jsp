<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.Message" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);

  ApplicationException exception = new ApplicationException();
  Message message1 = new ValidationResultMessage("validation_error", new StringResource() {
    @Override
    public String getId() {
      return "error1";
    }

    @Override
    public String getValue(Locale locale) {
      return "単項目精査エラー";
    }
  }, new String[0]);
  exception.addMessages(message1);
  Message message2 = new ValidationResultMessage("validation_error_alias", new StringResource() {
    @Override
    public String getId() {
      return "error2";
    }

    @Override
    public String getValue(Locale locale) {
      return "項目間精査エラー";
    }
  }, new String[0]);
  exception.addMessages(message2);
  request.setAttribute("nablarch_application_error", exception);
%>

<t:ui_test_template
    suite="タブ"
    title="タブ表示切替サンプル（精査エラー）">
  <jsp:attribute name="contentHtml">
    <n:form>
      <tab:group name="error">
        <tab:content title="精査エラーなし" value="validation_error_none" selected="true">
          <h4 style="display: block; clear:left;">このタブが選択されていないこと</h4>
          <field:block title="精査エラーの発生していないテキストボックス">
            <field:text
                title="テキスト"
                name="no_validation_error">
            </field:text>
          </field:block>
        </tab:content>
        <tab:content title="精査エラーあり" value="validation_error" selected="true">
          <h4 style="display: block; clear:left;">このタブが選択されていること</h4>
          <tab:group name="validation_error_name">
            <tab:content title="name属性エラー" value="name_error">
              <h4 style="display: block; clear:left;">このタブが選択されていること</h4>
              <field:block title="name属性が精査エラーのテキストボックス">
                <field:text
                    title="テキスト"
                    name="validation_error">
                </field:text>
              </field:block>
            </tab:content>
            <tab:content title="精査エラーなし" value="no_error_name" selected="true">
              <h4 style="display: block; clear:left;">このタブが選択されていないこと</h4>
              <field:block title="精査エラーの発生していないテキストボックス">
                <field:text
                    title="テキスト"
                    name="no_validation_error">
                </field:text>
              </field:block>
            </tab:content>
          </tab:group>
          <tab:group name="validation_error_alias">
            <tab:content title="精査エラーなし" value="no_error_alias" selected="true">
              <h4 style="display: block; clear:left;">このタブが選択されていないこと</h4>
              <field:block title="精査エラーの発生していないテキストボックス">
                <field:text
                    title="テキスト"
                    name="no_validation_error">
                </field:text>
              </field:block>
            </tab:content>
            <tab:content title="nameAlias属性エラー" value="alias_error">
              <h4 style="display: block; clear:left;">このタブが選択されていること</h4>
              <field:block title="nameAlias属性が精査エラーのテキストボックス">
                <field:text
                    title="テキスト"
                    name="no_validation_error"
                    nameAlias="validation_error_alias">
                </field:text>
              </field:block>
            </tab:content>
          </tab:group>
        </tab:content>
      </tab:group>
      <button:block>
        <button:back
            uri="./タブ.jsp"
            dummyUri="タブ.jsp">
        </button:back>
      </button:block>
    </n:form>
  </jsp:attribute>
</t:ui_test_template>
