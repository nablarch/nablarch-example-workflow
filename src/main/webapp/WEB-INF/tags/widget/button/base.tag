<%--
  ボタン用の共通テンプレート
  @author Hisaaki Sioiri
--%>

<%@ tag pageEncoding="UTF-8" description="ボタン用の共通テーンプレートタグ" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="label" description="ボタンに表示するラベル" rtexprvalue="true" required="true" %>
<%@ attribute name="uri" description="遷移先URI" required="true" rtexprvalue="true" %>
<%@ attribute name="id" description="HTMLのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="HTMLのclass属性" rtexprvalue="true" %>
<%@ attribute name="icon" description="ボタンに表示するアイコンの画像名" rtexprvalue="true" %>
<%@ attribute name="size" description="ボタンの表示サイズ(Grid数)。デフォルトは3" rtexprvalue="true" %>
<%@ attribute name="disabled" rtexprvalue="true" description="ボタンを無効化するか否か" %>
<%@ attribute name="bodyContent" fragment="true" required="true" description="ボタンのボディ部に出力する内容" %>

<%@ attribute name="allowDoubleSubmission" description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>
<%@ attribute name="displayMethod"         description="リクエストが処理できない場合にどのように表示するか。デフォルトはNORMAL" rtexprvalue="true" %>

<n:set var="gridSize" value="" />
<c:if test="${not empty size}">
  <n:set var="gridSize" value="grid-col-${size}" scope="page"/>
</c:if>

<div class="buttonWrapper">
<n:button
    id="${id}"
    uri="${uri}"
    disabled="${disabled}"
    displayMethod="${(empty displayMethod) ? 'NORMAL' : displayMethod}"
    cssClass="${gridSize} ${cssClass}"
    allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">
  <i class="<n:write name='icon' withHtmlFormat='false' />"></i>
  <n:write name="label" />
  <jsp:invoke fragment="bodyContent" />
</n:button>
</div>
<div class="pillar"></div>
