<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="java.util.Locale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

  ApplicationException exception = new ApplicationException();
  exception.addMessages(new ValidationResultMessage("error", new StringResource() {
    @Override
    public String getId() {
      return "id";
    }

    @Override
    public String getValue(Locale locale) {
      return "メッセージ";
    }
  }, new Object[0]));
  request.setAttribute("nablarch_application_error", exception);
%>
