<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      // 必須用
      put("tel-area", "03");
      put("tel-local", "1234");
      put("tel-subscriber", "5678");

      // 編集用
      put("tel-area-format", "03");
      put("tel-local-format", "1234");
      put("tel-subscriber-format", "5678");

      // 編集用２
      put("tel-area-only", "03");
      put("tel-local-only", "1234");
      put("tel-subscriber-only", "5678");

    }});

    ApplicationException exception = new ApplicationException();
    exception.addMessages(new ValidationResultMessage("server.tel-area-error", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "市外局番がエラー";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("server.tel-local-error", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "市内局番がエラー";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("server.tel-subscriber-error", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "加入者番号がエラー";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("tel", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "電話番号がエラー";
      }
    }, new Object[0]));
    request.setAttribute("nablarch_application_error", exception);
  }
%>

