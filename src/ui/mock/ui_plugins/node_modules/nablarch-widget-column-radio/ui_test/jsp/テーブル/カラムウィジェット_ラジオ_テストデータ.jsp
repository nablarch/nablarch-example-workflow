<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  request.setAttribute("serverMode", true);
  class ListSearchInfoSub extends ListSearchInfo {
    ListSearchInfoSub() {
      setResultCount(4);
      setId("00");
    }
    @Override
    public String[] getSearchConditionProps() {
      return new String[]{"id"};
    }
    String id;

    public String getId() {
      return id;
    }

    public void setId(String id) {
      this.id = id;
    }
  }

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
  request.setAttribute("listSearchInfo", new ListSearchInfoSub());

  if (request.getParameter("confirm") == null) {
    request.setAttribute("readonly4", "1003");
  }
%>
-->
