<%@ tag pageEncoding="UTF-8" description="警告ダイアログ表示" %>
<%@ taglib prefix="n"      uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>

<%---------------------- 属性定義 ----------------------%>
<%@ attribute name="title"      description="処理名称" rtexprvalue="true" %>
<%@ attribute name="target"     description="監視対象のターゲットのセレクタ" rtexprvalue="true" %>
<%@ attribute name="condition"  description="警告を表示する条件" rtexprvalue="true" %>
<%@ attribute name="message"    description="表示するメッセージ" rtexprvalue="true" required="true" %>
<%@ attribute name="stop"       description="イベントを停止するかどうか(デフォルトはtrue)" rtexprvalue="true" %>
<%@ attribute name="revert"     description="入力値を復元するかどうか(デフォルトはtrue)" rtexprvalue="true" %>

<event:dialog type="alert"
              target="${target}"
              condition="${condition}"
              message="${message}"
              revert="${revert}"
              stop="${stop}">
</event:dialog>
