<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Enumeration" %>
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

  List<Map<String, String>> list = new ArrayList<Map<String, String>>();
  list.add(new HashMap<String, String>() {{
    put("name", "男");
    put("cd", "1");
  }});
  list.add(new HashMap<String, String>() {{
    put("name", "女");
    put("cd", "2");
  }});

  if (!validate(request)) {
    ApplicationException applicationException = new ApplicationException(new ValidationResultMessage(null,
        new StringResource() {
          @Override
          public String getId() {
            return "id";
          }
          @Override
          public String getValue(Locale locale) {
            return "検索条件を最低1つは入力してください";
          }
        }, null));

    request.setAttribute("nablarch_application_error", applicationException);
  } else {

    List<Map<String, String>> result = new ArrayList<Map<String, String>>();
    for (int i = 0; i < 15; i++) {
      Map<String, String> row = new HashMap<String, String>();
      int rowNumber = i + 1;
      row.put("kanjiName", "漢字名_" + rowNumber);
      row.put("kanaName", "カナメイ_" + rowNumber);
      row.put("birthday", generateDate(rowNumber));
      result.add(row);
    }

    request.setAttribute("searchResult", result);
  }
  request.setAttribute("sexList", list);
%>
<%!
  boolean validate(HttpServletRequest request) {
    Enumeration<String> names = request.getParameterNames();
    while (names.hasMoreElements()) {
      String name = names.nextElement();
      if (!name.startsWith("search.") || name.contains("nablarch")) {
        continue;
      }

      String value = request.getParameter(name);
      if (value != null && value.length() != 0) {
        return true;
      }
    }
    return false;
  }

  String generateDate(int rowNumber) {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(new Date());
    calendar.add(Calendar.DATE, rowNumber);
    DateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
    return format.format(new Date(calendar.getTimeInMillis()));
  }
%>
-->
