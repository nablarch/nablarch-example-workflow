<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="table"  tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 画面表示項目－精査（属性記述あり－内容あり） -->
<spec:validation
  name="spec:validationの属性テスト"
  target="全項目内容あり"
  condition="設計書ビューで正しい表示になっていること。メッセージが導出されていること。"
  messageId="U0010012">
</spec:validation>

<!-- 画面表示項目－精査（属性記述あり－内容あり） -->
<spec:validation
    name="spec:validationの属性テスト"
    target="全項目内容あり"
    condition="メッセージと埋め込み文字列が導出されていること。"
    messageId="U0010004"
    messageParam="埋め込み文字列1|U0010006">
</spec:validation>

<!-- 画面表示項目－精査（属性記述あり－内容なし） -->
<spec:validation
  name=""
  target=""
  condition=""
  messageId="">
</spec:validation>

<!-- 精査（属性記述なし） －テスト対象外 -->
<!-- 属性をひとつも記述しない場合、設計書の出力でエラーとなるが、項目をひとつも記述しないことはないはずなので、テスト対象外とした。 -->
<!-- spec:validationタグ追加される際に、特定の項目は必須になるとも予測 。-->

<t:page_template title="画面イベント一覧－項目精査">
  <jsp:attribute name="contentHtml"></jsp:attribute>

</t:page_template>
