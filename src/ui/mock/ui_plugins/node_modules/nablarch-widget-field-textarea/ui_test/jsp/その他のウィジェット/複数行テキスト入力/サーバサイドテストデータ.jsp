<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.Message" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>

<%
  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("required", "必須属性を指定");
      put("errorName", "エラー項目");
      put("nameAlias-none", "nameAlias属性未指定");
      put("nameAlias", "nameAliasを指定");
    }});
  }
  ApplicationException exception = new ApplicationException();
  Message message1 = new ValidationResultMessage("server.nameAlias", new StringResource() {
    @Override
    public String getId() {
      return "error1";
    }

    @Override
    public String getValue(Locale locale) {
      return "name属性もしくはnameAlias属性に server.nameAlias が指定されている項目がエラー表示になること。";
    }
  }, new String[0]);
  exception.addMessages(message1);
  Message message2 = new ValidationResultMessage("server.errorName", new StringResource() {
    @Override
    public String getId() {
      return "error2";
    }

    @Override
    public String getValue(Locale locale) {
      return "name属性もしくはnameAlias属性に server.errorName が指定されている項目がエラー表示になり、このメッセージが表示されること。";
    }
  }, new String[0]);
  exception.addMessages(message2);
  request.setAttribute("nablarch_application_error", exception);
%>
