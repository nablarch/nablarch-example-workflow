<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.math.*" %>
<%
  
  nablarch.core.ThreadContext.setLanguage(Locale.JAPANESE);
  
  request.setAttribute("formdata", new HashMap() {{
    put("amount11",     BigDecimal.TEN);
    put("amount12",     new BigDecimal("1000.12"));
    put("amount13",     BigDecimal.ZERO);
    put("amount21",     BigDecimal.ZERO);
    put("amount22",     BigDecimal.ZERO);
    put("amount31",     BigDecimal.ONE);
    put("amount32",     new BigDecimal("11"));
    put("amount33",     new BigDecimal("111")); 
    put("totalAmount1", BigDecimal.TEN.add(new BigDecimal("1000.12")));
    put("totalAmount2", BigDecimal.TEN);
  }});
  
  request.setAttribute("listBox",  new ArrayList() {{
    add(new HashMap() {{put("key", "０"); put("value", "0"); }});
    add(new HashMap() {{put("key", "１００円"); put("value", "100"); }});
    add(new HashMap() {{put("key", "１０００円"); put("value", "1000"); }});    
  }});
%>

<n:forConfirmationPage>
<%
  Map bean = (Map) request.getAttribute("formdata");
  bean.put("totalAmount1", new BigDecimal("600"));
%>
</n:forConfirmationPage>
