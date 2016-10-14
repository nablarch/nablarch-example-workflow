<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%

  final List<Map<String, String>> checkboxList = new ArrayList<Map<String, String>>() {{
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

  request.setAttribute("checkbox-list", checkboxList);

  if (!request.getParameterMap().containsKey("input")) {

    request.setAttribute("server", new HashMap<String, Object>() {{
      put("readonly-none", new String[] {"値1", "値2", "値3"});
      put("readonly-blank", new String[] {"値1", "値2", "値3"});
      put("readonly-true", new String[] {"値1", "値2", "値3"});
      put("readonly-false", new String[] {"値1", "値2", "値3"});

      put("disabled-none", new String[] {"値1", "値2", "値3"});
      put("disabled-blank", new String[] {"値1", "値2", "値3"});
      put("disabled-true", new String[] {"値1", "値2", "値3"});
      put("disabled-false", new String[] {"値1", "値2", "値3"});

      put("listformat-none", new String[] {"値1", "値2", "値3"});
      put("listformat-blank", new String[] {"値1", "値2", "値3"});
      put("listformat-br", new String[] {"値1", "値2", "値3"});
      put("listformat-div", new String[] {"値1", "値2", "値3"});
      put("listformat-ol", new String[] {"値1", "値2", "値3"});
      put("listformat-ul", new String[] {"値1", "値2", "値3"});
      put("listformat-span", new String[] {"値1", "値2", "値3"});
      put("listformat-sp", new String[] {"値1", "値2", "値3"});

      put("labelpattern-none", new String[] {"値1", "値2", "値3"});
      put("labelpattern-blank", new String[] {"値1", "値2", "値3"});
      put("labelpattern", new String[] {"値1", "値2", "値3"});
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
