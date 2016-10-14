<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.message.Message" %>
<%@ page import="nablarch.core.message.MessageLevel" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>

<%
  ApplicationException exception = new ApplicationException();
  if (request.getParameterMap().containsKey("inputError")) {
    exception.addMessages(new ValidationResultMessage("formdata.loginId", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "formdata.loginIdはエラー";
      }
    }, new Object[0]));
    request.setAttribute("nablarch_application_error", exception);
  }
  if (request.getParameterMap().containsKey("grobalError")) {
    exception.addMessages(new Message(MessageLevel.ERROR, new StringResource() {
      @Override
      public String getId() {
        return "id";
      }
      @Override
      public String getValue(Locale locale) {
        return "グローバルエラー";
      }
    }));
    request.setAttribute("nablarch_application_error", exception);
  }

%>