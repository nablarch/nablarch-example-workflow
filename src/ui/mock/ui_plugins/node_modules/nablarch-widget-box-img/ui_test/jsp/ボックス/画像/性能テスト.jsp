<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:ui_test_template
  suite    = "ボックス/画像"
  title    = "画像のJS性能確認">
  <jsp:attribute name="localCss">
  .box {
    padding : 3px 0;
    border : black solid 1px;
  }
  </jsp:attribute>
  <jsp:attribute name="contentHtml">
  <span class="test-case">ウィジェットを多く利用した場合の文字列処理の性能を確認する。</span>
  <box:img id="html_test_css1" file="test_html.jpg"></box:img>
  <box:img id="html_test_css2" file="test_html.jpg"></box:img>
  <box:img id="html_test_css3" file="test_html.jpg"></box:img>
  <box:img id="html_test_css4" file="test_html.jpg"></box:img>
  <box:img id="html_test_css5" file="test_html.jpg"></box:img>
  <box:img id="html_test_css6" file="test_html.jpg"></box:img>
  <box:img id="html_test_css7" file="test_html.jpg"></box:img>
  <box:img id="html_test_css8" file="test_html.jpg"></box:img>
  <box:img id="html_test_css9" file="test_html.jpg"></box:img>
  <box:img id="html_test_css10" file="test_html.jpg"></box:img>
  <box:img id="html_test_css11" file="test_html.jpg"></box:img>
  <box:img id="html_test_css12" file="test_html.jpg"></box:img>
  <box:img id="html_test_css13" file="test_html.jpg"></box:img>
  <box:img id="html_test_css14" file="test_html.jpg"></box:img>
  <box:img id="html_test_css15" file="test_html.jpg"></box:img>
  <box:img id="html_test_css16" file="test_html.jpg"></box:img>
  <box:img id="html_test_css17" file="test_html.jpg"></box:img>
  <box:img id="html_test_css18" file="test_html.jpg"></box:img>
  <box:img id="html_test_css19" file="test_html.jpg"></box:img>
  <box:img id="html_test_css20" file="test_html.jpg"></box:img>
  <box:img id="html_test_css21" file="test_html.jpg"></box:img>
  <box:img id="html_test_css22" file="test_html.jpg"></box:img>
  <box:img id="html_test_css23" file="test_html.jpg"></box:img>
  <box:img id="html_test_css24" file="test_html.jpg"></box:img>
  <box:img id="html_test_css25" file="test_html.jpg"></box:img>
  <box:img id="html_test_css26" file="test_html.jpg"></box:img>
  <box:img id="html_test_css27" file="test_html.jpg"></box:img>
  <box:img id="html_test_css28" file="test_html.jpg"></box:img>
  <box:img id="html_test_css29" file="test_html.jpg"></box:img>
  <box:img id="html_test_css30" file="test_html.jpg"></box:img>
  <box:img id="html_test_css31" file="test_html.jpg"></box:img>
  <box:img id="html_test_css32" file="test_html.jpg"></box:img>
  <box:img id="html_test_css33" file="test_html.jpg"></box:img>
  <box:img id="html_test_css34" file="test_html.jpg"></box:img>
  <box:img id="html_test_css35" file="test_html.jpg"></box:img>
  <box:img id="html_test_css36" file="test_html.jpg"></box:img>
  <box:img id="html_test_css37" file="test_html.jpg"></box:img>
  <box:img id="html_test_css38" file="test_html.jpg"></box:img>
  <box:img id="html_test_css39" file="test_html.jpg"></box:img>
  <box:img id="html_test_css40" file="test_html.jpg"></box:img>
  <box:img id="html_test_css41" file="test_html.jpg"></box:img>
  <box:img id="html_test_css42" file="test_html.jpg"></box:img>
  <box:img id="html_test_css43" file="test_html.jpg"></box:img>
  <box:img id="html_test_css44" file="test_html.jpg"></box:img>
  <box:img id="html_test_css45" file="test_html.jpg"></box:img>
  <box:img id="html_test_css46" file="test_html.jpg"></box:img>
  <box:img id="html_test_css47" file="test_html.jpg"></box:img>
  <box:img id="html_test_css48" file="test_html.jpg"></box:img>
  <box:img id="html_test_css49" file="test_html.jpg"></box:img>
  <box:img id="html_test_css50" file="test_html.jpg"></box:img>
  <box:img id="html_test_css51" file="test_html.jpg"></box:img>
  <box:img id="html_test_css52" file="test_html.jpg"></box:img>
  <box:img id="html_test_css53" file="test_html.jpg"></box:img>
  <box:img id="html_test_css54" file="test_html.jpg"></box:img>
  <box:img id="html_test_css55" file="test_html.jpg"></box:img>
  <box:img id="html_test_css56" file="test_html.jpg"></box:img>
  <box:img id="html_test_css57" file="test_html.jpg"></box:img>
  <box:img id="html_test_css58" file="test_html.jpg"></box:img>
  <box:img id="html_test_css59" file="test_html.jpg"></box:img>
  <box:img id="html_test_css60" file="test_html.jpg"></box:img>
  <box:img id="html_test_css61" file="test_html.jpg"></box:img>
  <box:img id="html_test_css62" file="test_html.jpg"></box:img>
  <box:img id="html_test_css63" file="test_html.jpg"></box:img>
  <box:img id="html_test_css64" file="test_html.jpg"></box:img>
  <box:img id="html_test_css65" file="test_html.jpg"></box:img>
  <box:img id="html_test_css66" file="test_html.jpg"></box:img>
  <box:img id="html_test_css67" file="test_html.jpg"></box:img>
  <box:img id="html_test_css68" file="test_html.jpg"></box:img>
  <box:img id="html_test_css69" file="test_html.jpg"></box:img>
  <box:img id="html_test_css70" file="test_html.jpg"></box:img>
  <box:img id="html_test_css71" file="test_html.jpg"></box:img>
  <box:img id="html_test_css72" file="test_html.jpg"></box:img>
  <box:img id="html_test_css73" file="test_html.jpg"></box:img>
  <box:img id="html_test_css74" file="test_html.jpg"></box:img>
  <box:img id="html_test_css75" file="test_html.jpg"></box:img>
  <box:img id="html_test_css76" file="test_html.jpg"></box:img>
  <box:img id="html_test_css77" file="test_html.jpg"></box:img>
  <box:img id="html_test_css78" file="test_html.jpg"></box:img>
  <box:img id="html_test_css79" file="test_html.jpg"></box:img>
  <box:img id="html_test_css80" file="test_html.jpg"></box:img>
  <box:img id="html_test_css81" file="test_html.jpg"></box:img>
  <box:img id="html_test_css82" file="test_html.jpg"></box:img>
  <box:img id="html_test_css83" file="test_html.jpg"></box:img>
  <box:img id="html_test_css84" file="test_html.jpg"></box:img>
  <box:img id="html_test_css85" file="test_html.jpg"></box:img>
  <box:img id="html_test_css86" file="test_html.jpg"></box:img>
  <box:img id="html_test_css87" file="test_html.jpg"></box:img>
  <box:img id="html_test_css88" file="test_html.jpg"></box:img>
  <box:img id="html_test_css89" file="test_html.jpg"></box:img>
  <box:img id="html_test_css90" file="test_html.jpg"></box:img>
  <box:img id="html_test_css91" file="test_html.jpg"></box:img>
  <box:img id="html_test_css92" file="test_html.jpg"></box:img>
  <box:img id="html_test_css93" file="test_html.jpg"></box:img>
  <box:img id="html_test_css94" file="test_html.jpg"></box:img>
  <box:img id="html_test_css95" file="test_html.jpg"></box:img>
  <box:img id="html_test_css96" file="test_html.jpg"></box:img>
  <box:img id="html_test_css97" file="test_html.jpg"></box:img>
  <box:img id="html_test_css98" file="test_html.jpg"></box:img>
  <box:img id="html_test_css99" file="test_html.jpg"></box:img>
  <box:img id="html_test_css100" file="test_html.jpg"></box:img>
  </jsp:attribute>
</t:ui_test_template>
