<%--
  イベント発生時に、指定した要素内の文字列もしくはフォーム入力値を設定する。
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="イベント発生時に、指定した要素内の文字列もしくはフォーム入力値を設定する。" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"       description="処理名称" rtexprvalue="true" %>
<%@ attribute name="target"      description="値を設定するノードを指定するセレクタ式(必須)" required="true" rtexprvalue="true" %>
<%@ attribute name="format"      description="設定する情報のフォーマット式。(埋め込み文字{}内にセレクタを指定し、対象の要素から値,テキスト情報を展開して出力できる。  例:{span.prefix}:{span.code})" rtexprvalue="true" %>
<%@ attribute name="condition"   description="このアクションが実行されるために、イベント発生元ノードが満たすべき条件(セレクタ式)" rtexprvalue="true" %>
<%@ attribute name="addClass"    description="追加するCSSクラス名(空白文字区切り)" rtexprvalue="true" %>
<%@ attribute name="removeClass" description="除去するCSSクラス名(空白文字区切り)" rtexprvalue="true" %>

<div
  style="display:none"
  class="nablarch_event_Action
         -type        Write
         -writeTo     '<n:write name='target'      withHtmlFormat='false' />'
         -format      '<n:write name='format'      withHtmlFormat='false' />'
         -condition   '<n:write name='condition'   withHtmlFormat='false' />'
         -addClass    '<n:write name='addClass'    withHtmlFormat='false' />'
         -removeClass '<n:write name='removeClass' withHtmlFormat='false' />'">
</div>
