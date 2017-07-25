<%--
  テーブル内の行レイアウト定義(1テーブル内に複数の行レイアウトが含まれる場合に使用する。)
  @author Iwauo Tajima
--%>
<%@ tag pageEncoding="UTF-8" description="ページングや件数の表示を行わないテーブルを出力するウィジェット" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ============================ 属性定義 =============================== --%>
<%@ attribute name="cond"     description="この行レイアウトを使用する条件(未設定時は'true:常に使用する')" rtexprvalue="true" %>
<%@ attribute name="cssClass" description="各カラムに指定するCSSクラス" rtexprvalue="true" %>

<c:if test="${(cond == null) ? 'true' : cond}">
  <tr class="<n:write name='cssClass' withHtmlFormat='false' /> <n:write name='oddEvenCss' withHtmlFormat='false' />">
    <jsp:doBody/>
  </tr>
</c:if>
