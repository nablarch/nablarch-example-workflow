<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("builNo", "01");
      put("personalNo", "2345");

      put("builNo-readonly-none", "01");
      put("personalNo-readonly-none", "1111");

      put("builNo-readonly-blank", "02");
      put("personalNo-readonly-blank", "2222");

      put("builNo-readonly-false", "03");
      put("personalNo-readonly-false", "3333");

      put("builNo-readonly", "04");
      put("personalNo-readonly", "4444");

      put("builNo-disabled-none", "12");
      put("personalNo-disabled-none", "1234");

      put("builNo-disabled-blank", "99");
      put("personalNo-disabled-blank", "9999");

      put("builNo-disabled-false", "88");
      put("personalNo-disabled-false", "8888");

      put("builNo-disabled", "11");
      put("personalNo-disabled", "2222");

      put("builNo-error", "aa");
      put("personalNo-error", "bbbb");
    }});

    ApplicationException exception = new ApplicationException();
    exception.addMessages(new ValidationResultMessage("server.builNo-error", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "ビル番号がおかしいです";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("server.personalNo-error", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "個人番号がおかしいです";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("extension_number", new StringResource() {
      @Override
      public String getId() {
        return "name-alias";
      }

      @Override
      public String getValue(Locale locale) {
        return "内線番号をちゃんと入力してください";
      }
    }, new Object[0]));
    request.setAttribute("nablarch_application_error", exception);
  }
%>
-->
