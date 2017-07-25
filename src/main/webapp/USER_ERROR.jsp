<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:errorpage_template title="処理エラー">
  <jsp:attribute name="errorMessageHtml">
  <p>
    処理を正常に終了することができませんでした。<br/>
    お手数ですが、入力内容をご確認の上、少し間をおいてから、もう一度手順をやりなおして下さい。<br/>
    状況が変わらない場合は、お手数ですが、このシステムの管理者にご連絡ください。
  </p>
  </jsp:attribute>
</t:errorpage_template>
