<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%
    request.setAttribute("sheetGrades", new ArrayList() {{
        add(new HashMap() {{ put("id", "economy");  put("name", "エコノミークラス"); }});
        add(new HashMap() {{ put("id", "business"); put("name", "ビジネスクラス"); }});
        add(new HashMap() {{ put("id", "first");    put("name", "ファーストクラス"); }});
    }});
    
    request.setAttribute("companies", new ArrayList() {{
        add(new HashMap() {{ put("id", "aaa"); put("name", "AAA航空"); }});
        add(new HashMap() {{ put("id", "bbb"); put("name", "BBBエアライン"); }});
        add(new HashMap() {{ put("id", "ccc"); put("name", "CCCエアシステム"); }});
    }});
    
    request.setAttribute("useRentalCar", new ArrayList() {{
        add(new HashMap() {{ put("id", "use"); put("name", "使用する"); }});
    }});
    
    request.setAttribute("departureTimes", new ArrayList() {{
        add(new HashMap() {{ put("id", "0600"); put("name", "AM 6:00"); }});
        add(new HashMap() {{ put("id", "0700"); put("name", "AM 7:00"); }});
        add(new HashMap() {{ put("id", "0800"); put("name", "AM 8:00"); }});
        add(new HashMap() {{ put("id", "0900"); put("name", "AM 9:00"); }});
        add(new HashMap() {{ put("id", "1000"); put("name", "AM 10:00"); }});        
        add(new HashMap() {{ put("id", "1100"); put("name", "AM 11:00"); }});
        add(new HashMap() {{ put("id", "1200"); put("name", "AM 12:00"); }});   
        add(new HashMap() {{ put("id", "1300"); put("name", "PM 1:00"); }}); 
        add(new HashMap() {{ put("id", "1400"); put("name", "PM 2:00"); }}); 
        add(new HashMap() {{ put("id", "1500"); put("name", "PM 3:00"); }}); 
        add(new HashMap() {{ put("id", "1600"); put("name", "PM 4:00"); }}); 
        add(new HashMap() {{ put("id", "1700"); put("name", "PM 5:00"); }}); 
        add(new HashMap() {{ put("id", "1800"); put("name", "PM 6:00"); }}); 
        add(new HashMap() {{ put("id", "1900"); put("name", "PM 7:00"); }});
        add(new HashMap() {{ put("id", "2000"); put("name", "PM 8:00"); }});  
        add(new HashMap() {{ put("id", "2100"); put("name", "PM 9:00"); }});  
        add(new HashMap() {{ put("id", "2200"); put("name", "PM 10:00"); }});
    }});
%>