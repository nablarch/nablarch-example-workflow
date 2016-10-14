<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<span class="test-case">テストページのスクリプトでnablarch_deviceの情報を出力する。</span>
<ul style="width:100%; float:left;" >
  <li>type   :<span class="type forview"></span></li>
  <li>version:<span class="version forview"></span></li>
  <li>browser:<span class="browser forview"></span></li>
  <li>browserVersion:<span class="browserVersion forview"></span></li>
</ul>
