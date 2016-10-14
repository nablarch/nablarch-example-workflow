<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.Message" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>

<!--
<%
  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      put("required", "必須属性を指定");
      put("readonly-none", "readonly属性指定なし");
      put("readonly-blank", "readonly属性に空");
      put("readonly-true", "編集不可");
      put("readonly-false", "編集可能");
      put("disabled-none", "disabled属性指定なし");
      put("disabled-blank", "disabled属性に空");
      put("disabled-true", "サーバに値が送信されない");
      put("disabled-false", "サーバに値が送信される");
      put("id-none", "id属性未指定");
      put("id-blank", "id属性に空");
      put("id-identified", "id属性指定");
      put("cssClass-none", "cssClass属性未指定");
      put("cssClass-blank", "cssClass属性に空");
      put("cssClass", "cssClass属性を指定");
      put("maxlength-none", "maxlength属性未指定");
      put("maxlength-blank", "maxlength属性に空");
      put("maxlength", "maxlength属性を指定");
      put("rows-none", "rows属性未指定");
      put("rows-blank", "rows属性に空");
      put("rows", "rows属性を指定");
      put("hint-none", "hint属性未指定");
      put("hint-blank", "hint属性に空");
      put("hint", "hint属性を指定");
    }});
  }
%>
-->
