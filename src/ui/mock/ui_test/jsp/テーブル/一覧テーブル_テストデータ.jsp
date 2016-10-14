<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%

  // サーバーモードを表す
  request.setAttribute("serverMode", true);

  List<Map<String, Object>> result = new ArrayList<Map<String, Object>>() {{
    add(new HashMap<String, Object>() {{
      put("id", "1001");
      put("name", "なまえ");
      put("mail", "mail@mail.com");
      put("date", "20131001");
      put("number", 1000);
    }});
    add(new HashMap<String, Object>() {{
      put("id", "1002");
      put("name", "なまえ２");
      put("mail", "mail2@mail.com");
      put("date", "20131002");
      put("number", 10000);
    }});
    add(new HashMap<String, Object>() {{
      put("id", "1003");
      put("name", "なまえ３");
      put("mail", "mail3@mail.com");
      put("date", "20131003");
      put("number", 100000);
    }});
    add(new HashMap<String, Object>() {{
      put("id", "1004");
      put("name", "なまえ４");
      put("mail", "mail4@mail.com");
      put("date", "20131004");
      put("number", 1000000);
    }});
  }};

  request.setAttribute("result", result);
  final List<Map<String, Object>> resultForNoId = result;
  request.setAttribute("for", new HashMap<String, HashMap<String, List<Map<String, Object>>>>() {{
                     put("noId", new HashMap<String, List<Map<String, Object>>>(){{
                       put("result", resultForNoId);
                     }});
  }});


  request.setAttribute("resultCount", result.size());
  request.setAttribute("totalAmount", 1000 + 10000 + 100000 + 1000000);
%>
-->
