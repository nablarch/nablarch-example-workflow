<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  if (!request.getParameterMap().containsKey("input")) {
    request.setAttribute("server", new HashMap<String, Object>() {{
      put("required-name", "必須属性を指定");
      put("valueFormat-none", "19700101");
      put("valueFormat-blank", "19700101");
      put("valueFormat", "19700101");
    }});
  }
%>
