<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
   request.setAttribute("applicationTypeList", new Map[] {
       new HashMap() {{
           put("appName", "登録");
           put("appCode", "insert");
       }},
       new HashMap() {{
           put("appName", "更新");
           put("appCode", "update");
       }},
       new HashMap() {{
           put("appName", "削除");
           put("appCode", "delete");
       }},
       new HashMap() {{
           put("appName", "参照");
           put("appCode", "refer");
       }},

   });
   request.setAttribute("userTypeList", new Map[] {
       new HashMap() {{
           put("ugroupName", "総務" );
           put("ugroupId",   "001");
       }},
       new HashMap() {{
           put("ugroupName", "経理" );
           put("ugroupId",   "002");
       }},
       new HashMap() {{
           put("ugroupName", "営業" );
           put("ugroupId",   "003");
       }},
       new HashMap() {{
           put("ugroupName", "人事" );
           put("ugroupId",   "005");
       }},
   });
   if (!request.getParameterMap().containsKey("formdata.required")) {
     request.setAttribute("formdata",
         new HashMap() {{
             put("required", "必須" );
             put("conditional", "ssd");
             put("revertText1", "no_revert");
             put("revertText2", "no_revert");
             put("revertText3", "revert");
        }});
   }
%>