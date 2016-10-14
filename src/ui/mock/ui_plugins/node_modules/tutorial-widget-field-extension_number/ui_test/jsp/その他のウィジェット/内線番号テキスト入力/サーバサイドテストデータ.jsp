<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("builNo", "99");
      put("personalNo", "9898");

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
