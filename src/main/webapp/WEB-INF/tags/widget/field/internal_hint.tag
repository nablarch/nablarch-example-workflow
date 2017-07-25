<%--
  入力時の留意点を表示する領域(本タグは、タグファイル内部から使用する)
  @author Iwauo Tajima
--%>

<%@tag pageEncoding="UTF-8" description="入力時の留意点を出力するウィジェット(タグファイル内部から呼び出すタグファイル。JSPから直接使用することは禁止する)" %>
<%@taglib prefix="n"   uri="http://tis.co.jp/nablarch" %>

<n:forInputPage>
<div class="note">
  ※  <jsp:doBody/>
</div>
</n:forInputPage>

