<%--
  ポップアップ用リンク表示
  @author tani takanori
--%>

<%@tag pageEncoding="UTF-8" description="ポップアップ用のリンクを出力するウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="label"           description="ラベル部に表示する文言" required="true" rtexprvalue="true" %>
<%@ attribute name="uri"             description="リンク先uri" rtexprvalue="true" required="true" %>
<%@ attribute name="id"              description="htmlのid属性" rtexprvalue="true" %>
<%@ attribute name="cssClass"        description="htmlのclass属性" rtexprvalue="true" %>
<%@ attribute name="popupWindowName" description="立ち上げるWindowの名前(デフォルトはsubwindow)" rtexprvalue="true" %>
<%@ attribute name="popupOption"     description="ポップアップのオプション情報" rtexprvalue="true" %>

<%@ attribute name="dummyUri"        description="画面設計時に使用する遷移先（紙芝居のように画面遷移する）（本番環境では使用しない）" rtexprvalue="true" %>

<%-- ============================ 属性定義（設計書表示用） =============================== --%>
<%@ attribute name="comment"         description="このサブミット用リンクについての備考 （画面イベント一覧の画面イベント概要に表示される）" %>

<n:popupLink
    id="${id}"
    uri="${uri}"
    displayMethod="NORMAL"
    cssClass="${cssClass}"
    popupOption="${popupOption}"
    popupWindowName="${(empty popupWindowName) ? 'subwindow' : popupWindowName}">
  <n:write name="label" />
  <jsp:doBody/>
</n:popupLink>
