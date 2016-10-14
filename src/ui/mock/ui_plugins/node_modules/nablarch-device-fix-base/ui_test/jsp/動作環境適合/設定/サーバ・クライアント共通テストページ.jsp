<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <span class="testcase">動作環境に応じた内容が出力されること</span>
  <ul id="deviceWrite">
      <li><span class="header">deviceType:</span><n:write name='nablarch_deviceType' /></li>
      <li><span class="header">deviceVersion:</span><n:write name='nablarch_deviceVersion' /></li>
      <li><span class="header">browserType:</span><n:write name='nablarch_browserType' /></li>
      <li><span class="header">browserVersion:</span><n:write name='nablarch_browserVersion' /></li>
  </ul>
  <span>bodyに出力されているclass属性(枠内):</span>
  <span class="classOfBody"></span>
<br>
  <span>UserAgent@javascript(navigator.userAgent):<br>
  <span class="userAgent"></span>
  </span>