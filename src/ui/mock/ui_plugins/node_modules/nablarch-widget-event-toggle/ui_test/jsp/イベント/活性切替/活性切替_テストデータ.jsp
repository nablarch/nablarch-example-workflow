<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--
<%
  request.setAttribute("serverMode", true);


List<Map<String, Object>> switches = new ArrayList<Map<String, Object>>() {{
  add(new HashMap<String, Object>() {{
    put("label", "活性");
    put("value", "available");
  }});
  add(new HashMap<String, Object>() {{
    put("label", "読取");
    put("value", "readonly");
  }});
  add(new HashMap<String, Object>() {{
    put("label", "非活性");
    put("value", "disable");
  }});

}};
request.setAttribute("switches", switches);

  List<Map<String, Object>> operators = new ArrayList<Map<String, Object>>() {{
    add(new HashMap<String, Object>() {{
      put("id", "owner");
      put("role", "本人");
      put("career", "lawyer");
      put("title", "弁護士");
    }});
    add(new HashMap<String, Object>() {{
      put("id", "sales");
      put("role", "営業");
      put("career", "piper");
      put("title", "配管工");
    }});
    add(new HashMap<String, Object>() {{
      put("id", "agency");
      put("role", "代理店");
      put("career", "chef");
      put("title", "料理人");
    }});
    add(new HashMap<String, Object>() {{
      put("id", "support");
      put("role", "サポート");
      put("career", "spaceman");
      put("title", "宇宙飛行士");
     }});
  }};
  request.setAttribute("operators", operators);

  if (!request.getParameterMap().containsKey("formdata.switch-radio")) {

    request.setAttribute("formdata", new HashMap<String, Object>() {{
        // switch
        put("switch-radio", new String[] {"owner"});

        // form
        put("kanjiName", new String[] {"鯖　空"});
        put("kanaName", new String[] {"サーバ　カラ"});
        put("mailAddress", new String[] {"mail@server.data.com"});
        put("card", new String[] {"card number ..."});

        put("mobilePhoneNumberAreaCode", new String[] {"090"});
        put("mobilePhoneNumberCityCode", new String[] {"9999"});
        put("mobilePhoneNumberSbscrCode", new String[] {"NNNN"});
    }});

    request.setAttribute("formdata_disabled", new HashMap<String, Object>() {{
        put("switch-radio", new String[] {"lawyer"});
        put("kanjiName", new String[] {"鯖　空"});
        put("kanaName", new String[] {"サーバ　カラ"});
        put("mailAddress", new String[] {"mail@server.data.com"});
        put("card", new String[] {"card number ..."});

        put("mobilePhoneNumberAreaCode", new String[] {"090"});
        put("mobilePhoneNumberCityCode", new String[] {"9999"});
        put("mobilePhoneNumberSbscrCode", new String[] {"NNNN"});
    }});
  }
%> -->