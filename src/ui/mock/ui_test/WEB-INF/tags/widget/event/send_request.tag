<%--
  イベント発生時に、XMLHttpRequestオブジェクトによるリクエストを送信する。
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="イベント発生時に、指定した要素内の文字列もしくはフォーム入力値を設定する。" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"     description="処理名称" rtexprvalue="true" %>
<%@ attribute name="name"      description="サブミット名" rtexprvalue="true" %>
<%@ attribute name="uri"       description="送信先URI(必須)" rtexprvalue="true" required="true" %>
<%@ attribute name="target"    description="取得要素(必須)"  rtexprvalue="true" required="true" %>
<%@ attribute name="condition" description="リクエストを送信する条件。省略時は常に送信する。" rtexprvalue="true" %>
<%@ attribute name="paramNameAlias" description="リクエスト送信時にパラメータ名の書き換えを行う。" rtexprvalue="true" %>

<div
  style="display:none"
  class="nablarch_event_Action
         -type       Ajax
         -name      '<n:write name='name'      withHtmlFormat='false' />'
         -uri       '<n:write name='uri'       withHtmlFormat='false' />'
         -target    '<n:write name='target'    withHtmlFormat='false' />'
         -condition '<n:write name='condition' withHtmlFormat='false' />'
         -paramNameAlias '<n:write name='paramNameAlias' withHtmlFormat='false' />'">
  <n:submitLink
    uri  = "${uri}"
    name = "${name}">
    <jsp:doBody />
  </n:submitLink>
</div>
