<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  request.setAttribute("serverMode", true);

  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, String>() {{
      // 必須用
      put("tel-area", "03");
      put("tel-local", "1234");
      put("tel-subscriber", "5678");

      // リードオンリー
      put("tel-area-readonly-none", "090");
      put("tel-local-readonly-none", "1111");
      put("tel-subscriber-readonly-none", "2222");

      put("tel-area-readonly-blank", "090");
      put("tel-local-readonly-blank", "1234");
      put("tel-subscriber-readonly-blank", "4321");

      put("tel-area-readonly-false", "080");
      put("tel-local-readonly-false", "3333");
      put("tel-subscriber-readonly-false", "4444");

      put("tel-area-readonly-true", "070");
      put("tel-local-readonly-true", "5555");
      put("tel-subscriber-readonly-true", "6666");

      // disabled
      put("tel-area-disabled-none", "03");
      put("tel-local-disabled-none", "1234");
      put("tel-subscriber-disabled-none", "5678");

      put("tel-area-disabled-blank", "03");
      put("tel-local-disabled-blank", "1234");
      put("tel-subscriber-disabled-blank", "5678");

      put("tel-area-disabled-false", "03");
      put("tel-local-disabled-false", "1234");
      put("tel-subscriber-disabled-false", "5678");

      put("tel-area-disabled", "090");
      put("tel-local-disabled", "1111");
      put("tel-subscriber-disabled", "2222");

      // 編集用
      put("tel-area-format", "03");
      put("tel-local-format", "1234");
      put("tel-subscriber-format", "5678");

      // 編集用２
      put("tel-area-only", "03");
      put("tel-local-only", "1234");
      put("tel-subscriber-only", "5678");
    }});

  }
%>
-->

