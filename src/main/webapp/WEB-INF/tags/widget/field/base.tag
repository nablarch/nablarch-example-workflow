<%--
  フィールド共通のテンプレート
  @author Iwauo Tajima
--%>

<%@ tag pageEncoding="UTF-8" description="入力項目の共通テンプレート" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field"  tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"      description="項目名" required="true" rtexprvalue="true" %>
<%@ attribute name="fieldClass" description="入力フィールドのDIVに付与するcssClass" rtexprvalue="true" %>
<%@ attribute name="contentId" description="コンテンツ部をラップするdivタグに設定するid属性値" %>
<%@ attribute name="contentClass" description="コンテンツ部をラップするdivタグに設定するクラス属性" %>
<%@ attribute name="inputField" required="true" description="入力フィールドか否か" %>
<%@ attribute name="required" description="必須項目かどうか(inputFieldがtrueの場合のみ有効)" %>

<%@ attribute name="fieldContent" fragment="true" required="true" description="フィールド入力部タグ" %>

<%---------------------- マルチレイアウト用属性 ----------------------%>
<%@ attribute name="titleSize" description="タイトル部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%@ attribute name="inputSize" description="入力部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>
<%------------------------------------------------------%>


<%--
labelのグリッド数を算出する
(c:if を利用するとデモ表示にミスするので,n:set内の三項演算で回避する。#8426)
--%>
<n:set var="col"             value="${not empty titleSize ? titleSize - 2 : ''}" />
<n:set var="labelGridMarker" value="${not empty titleSize ? 'grid-col-' : ''}" />
<n:set var="labelGridCol"    value="${labelGridMarker}${col}"/>
<n:set var="inputGridMarker" value="${not empty inputSize ? 'grid-col-' : ''}" />
<n:set var="inputGridCol"    value="${inputGridMarker}${inputSize}" />
<n:set var="inputField" value="${inputField == 'true' ? 'true' : 'false'}" />

<div class="field <n:write name='fieldClass' withHtmlFormat='false' />">
  <%-- フィールド名称 --%>
  <label class="<n:write name='labelGridCol' />"><n:prettyPrint name="title" /></label>

  <%-- 名称と入力部の区切り部 --%>
  <span class="label-separator">
    <%-- 入力フィールドの場合、必須マークの出力判定を行う --%>
    <c:if test="${inputField == 'true'}">
      <n:forInputPage><c:if test="${required == 'true'}"><span class="required">*</span></c:if></n:forInputPage>：
    </c:if>
    <c:if test="${inputField == 'false'}">：</c:if>
  </span>

  <%-- フィールド入力部 --%>
  <div class="<n:write name='inputGridCol' /> field-content <n:write name='contentClass' withHtmlFormat='false' />" id="<n:write name='contentId' withHtmlFormat='false' />">
    <jsp:invoke fragment="fieldContent" />
  </div>

</div>

