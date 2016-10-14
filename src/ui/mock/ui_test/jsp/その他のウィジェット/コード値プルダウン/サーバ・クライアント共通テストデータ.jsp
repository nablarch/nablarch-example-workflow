<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%

  if (!request.getParameterMap().containsKey("input")) {

    request.setAttribute("server", new HashMap<String, Object>() {{
      put("readonly-true", new String[] {"value1-1"});
      put("disabled-none", new String[] {"value1-2"});
      put("disabled-blank", new String[] {"value1-3"});
      put("disabled-true", new String[] {"value1-1"});
      put("disabled-false", new String[] {"value1-2"});
      put("listformat-none", new String[] {"value1-3"});
      put("listformat", new String[] {"value1-1"});
      put("optional-name-none", new String[] {"value1-2"});
      put("optional-name-blank", new String[] {"value1-3"});
      put("optional-name", new String[] {"value1-1"});
      put("label-pattern-none", new String[] {"value1-2"});
      put("label-pattern-blank", new String[] {"value1-3"});
      put("label-pattern", new String[] {"value1-1"});
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
