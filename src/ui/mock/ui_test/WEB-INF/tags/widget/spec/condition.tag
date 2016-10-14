<%--
  デモ実行時の画面状態を定義する。
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="デモ実行時の画面状態を定義する。" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="name" description="画面状態名[設計書表示必須]" %>
<%@ attribute name="layout" description="この画面状態において表示されるレイアウトの名称を'|'区切りで指定する。(デフォルトでは全てのレイアウトを表示)" %>
<%@ attribute name="when" description="この画面状態においてtrueに評価する c:if タグの条件を指定する。trueとしたい c:if タグ直下の spec:desc タグの内容を'|'区切りで指定する。(デフォルトでは spec:desc タグ直上の親要素の c:if タグは全てtrueとして評価する。)" %>
<%@ attribute name="isConfirmationPage" description="確認画面表示とする場合は'true'を設定する。(デフォルトは'false')" %>
<%@ attribute name="comment" description="画面状態に関する説明文" %>
