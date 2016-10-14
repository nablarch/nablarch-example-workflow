<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

  final List<Map<String, String>> pulldownList = new ArrayList<Map<String, String>>() {{
    add(new HashMap<String, String>() {{
      put("label", "ラベル1");
      put("value", "値1");
    }});
    add(new HashMap<String, String>() {{
      put("label", "ラベル2");
      put("value", "値2");
    }});
    add(new HashMap<String, String>() {{
      put("label", "ラベル3");
      put("value", "値3");
    }});
  }};

  request.setAttribute("pulldown-list", pulldownList);

  if (!request.getParameterMap().containsKey("input")) {

    request.setAttribute("server", new HashMap<String, Object>() {{
      put("required", "値2");
      put("labelpattern-none", new String[]{"値1"});
      put("labelpattern-blank", new String[]{"値2"});
      put("labelpattern", new String[]{"値3"});
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
