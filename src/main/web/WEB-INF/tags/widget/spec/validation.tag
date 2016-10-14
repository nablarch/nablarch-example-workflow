<%--
  項目間・セマンティク精査定義
  @author Iwauo Tajima
  @from 1.4
--%>
<%@ tag pageEncoding="UTF-8" description="項目間・セマンティク精査定義" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="name" description="精査処理名" %>
<%@ attribute name="target" description="対象項目名" %>
<%@ attribute name="condition" description="精査が成功する条件" %>
<%@ attribute name="messageId" description="精査エラー時に表示するメッセージID" %>
<%@ attribute name="messageParam" description="メッセージ内で使用する埋め込みパラメータの内容。「|」区切りで複数の埋め込みパラメータを指定する。" %>

