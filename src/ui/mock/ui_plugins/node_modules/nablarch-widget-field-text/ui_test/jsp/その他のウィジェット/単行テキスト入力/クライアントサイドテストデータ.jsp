<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--
<%
  request.setAttribute("serverMode", true);

  if (!request.getParameterMap().containsKey("confirm")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("required", "必須属性を指定");
      put("readonly-none", "readonly属性指定なし");
      put("readonly-blank", "readonly属性に空");
      put("readonly-true", "編集不可");
      put("readonly-false", "編集可能");
      put("disabled-none", "disabled属性指定なし");
      put("disabled-blank", "disabled属性に空");
      put("disabled-true", "サーバに値が送信されない");
      put("disabled-false", "サーバに値が送信される");
      put("id-none", "id属性未指定");
      put("id-blank", "id属性に空");
      put("id-nonblank", "id属性を指定");
      put("valueFormat-none", "20131007");
      put("valueFormat-blank", "20131007");
      put("valueFormat-nonblank", "20131007");
    }});

    ApplicationException exception = new ApplicationException();
    exception.addMessages(new ValidationResultMessage("server.nameAlias-test", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "nameAlias指定のテスト";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("server.nameAlias-none", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "nameAlias指定なしのテスト";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("server.nameAlias-blank", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "nameAliasにブランク指定のテスト";
      }
    }, new Object[0]));
    request.setAttribute("nablarch_application_error", exception);
  }
%>
-->
