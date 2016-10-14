<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  if (!request.getParameterMap().containsKey("server.required")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("required", "必須属性を指定");
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

