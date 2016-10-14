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

  final List<Map<String, String>> pulldownList = new ArrayList<Map<String, String>>() {{
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
  final List<Map<String, String>> overSizeList = new ArrayList<Map<String, String>>(pulldownList);
  for (int i = 4; i < 15; i++) {
     Map<String, String> data = new HashMap<String, String>();
     data.put("label", "ラベル" + i);
     data.put("value", "値" + i);
     overSizeList.add(data);
  }

  request.setAttribute("pulldown-list", pulldownList);
  request.setAttribute("oversize-list", overSizeList);

  final List<Map<String, String>> longLabelList = new ArrayList<Map<String, String>>() {{
    add(new HashMap<String, String>() {{
      put("label", "非常に長いラベル1：いろはにほへとちりぬるをわかよたれそつねならむ");
      put("value", "値1");
    }});
    add(new HashMap<String, String>() {{
      put("label", "非常に長いラベル2：うゐのおくやまけふこえてあさきゆめみしゑひもせす");
      put("value", "値2");
    }});
    add(new HashMap<String, String>() {{
      put("label", "普通のラベル");
      put("value", "値3");
    }});
  }};

  request.setAttribute("very-long-pulldown-list", longLabelList);

  if (!request.getParameterMap().containsKey("input")) {

    request.setAttribute("server", new HashMap<String, Object>() {{
      put("readonly-true", new String[] {"値1"});
      put("disabled-none", new String[] {"値2"});
      put("disabled-blank", new String[] {"値3"});
      put("disabled-true", new String[] {"値3"});
      put("disabled-false", new String[] {"値1"});
      put("multiple-true", new String[] {"値2", "値3"});
    }});
  }
%>
-->
