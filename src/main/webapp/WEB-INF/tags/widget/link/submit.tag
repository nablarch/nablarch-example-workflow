<%--
  サブミット用リンク表示
  @author Hisaaki Sioiri
--%>

<%@tag pageEncoding="UTF-8" description="サブミット用のリンクを出力するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="label"                  description="ラベル部に表示する文言" required="true" rtexprvalue="true" %>
<%@ attribute name="uri"                    description="リンク先uri" required="true" rtexprvalue="true" %>
<%@ attribute name="id"                     description="htmlのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass"               description="htmlのclass属性" rtexprvalue="true" %>
<%@ attribute name="allowDoubleSubmission"  description="2重サブミットを許可するか否か。falseを指定した場合は許可しない。デフォルトはtrue" rtexprvalue="true" %>

<%@ attribute name="dummyUri" description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書）  =============================== --%>
<%@ attribute name="comment" description="このサブミット用リンクについての備考 （画面イベント一覧の画面イベント概要に表示される）" %>

<n:submitLink
    id="${id}"
    uri="${uri}"
    displayMethod="NORMAL"
    cssClass="${cssClass}"
    allowDoubleSubmission="${(empty allowDoubleSubmission) ? true : allowDoubleSubmission}">
  <n:write name="label" />
  <jsp:doBody/>
</n:submitLink>

