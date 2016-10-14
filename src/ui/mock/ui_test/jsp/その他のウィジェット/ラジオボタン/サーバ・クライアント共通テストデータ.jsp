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

  final List<Map<String, String>> radioList = new ArrayList<Map<String, String>>() {{
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

  request.setAttribute("radio-list", radioList);

  if (!request.getParameterMap().containsKey("input")) {

    request.setAttribute("server", new HashMap<String, Object>() {{
      put("readonly-true", new String[] {"値1"});
      put("readonly-none", new String[] {"値1"});
      put("readonly-false", new String[] {"値1"});
      put("readonly-blank", new String[] {"値1"});
      put("disabled-none", new String[] {"値2"});
      put("disabled-blank", new String[] {"値3"});
      put("disabled-true", new String[] {"値3"});
      put("disabled-false", new String[] {"値1"});
      put("listformat-none", new String[] {"値2"});
      put("listformat-blank", new String[] {"値1"});
      put("listformat-br", new String[] {"値3"});
      put("listformat-div", new String[] {"値3"});
      put("listformat-span", new String[] {"値3"});
      put("listformat-ul", new String[] {"値2", "値3"});
      put("listformat-ol", new String[] {"値3"});
      put("listformat-sp", new String[] {"値3"});
    }});
  }
%>
-->
