<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

  ApplicationException exception = new ApplicationException();
  exception.addMessages(new ValidationResultMessage("input.text", new StringResource() {
    @Override
    public String getId() {
      return "id";
    }

    @Override
    public String getValue(Locale locale) {
      return "エラーメッセージが表示されることを確認する。";
    }
  }, new Object[0]));
  request.setAttribute("nablarch_application_error", exception);

  // list

  List<Map<String, String>> list = new ArrayList<Map<String, String>>();
  list.add(new HashMap<String, String>() {{
    put("name", "男");
    put("value", "1");
  }});
  list.add(new HashMap<String, String>() {{
    put("name", "女");
    put("value", "2");
  }});
  list.add(new HashMap<String, String>() {{
    put("name", "法人");
    put("value", "3");
  }});

  request.setAttribute("list", list);

  Map<String, String> input = new HashMap<String, String>();
  input.put("textarea", "右側にパスワード入力欄とコードチェックボックスが表示されるよ。");
  input.put("label", "ラベル表示を行うところ");
  input.put("label_code", "value1-2");
  input.put("id", "1");
  input.put("value", "普通預金");

  request.setAttribute("input", input);


  List<Map<String, String>> resultSet = new ArrayList<Map<String, String>>();
  Map<String, String> row = new HashMap<String, String>();
  row.put("col1", "カラム1");
  row.put("col2", "カラム2");
  resultSet.add(row);
  resultSet.add(row);
  request.setAttribute("resultSet", resultSet);

%>


