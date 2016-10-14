<%--
  入力時の留意点を表示する領域
  @author Iwauo Tajima
--%>

<%@tag pageEncoding="UTF-8" description="入力時の留意点を出力するウィジェット" %>
<%@taglib prefix="n"   uri="http://tis.co.jp/nablarch" %>

<%@ attribute name="gridSize" description="ヒント表示部の幅（グリッド数）※マルチレイアウトモードの場合に使用する。" rtexprvalue="true" %>

<n:set var="gridMarker" value="${not empty gridSize ? 'grid-col-' : ''}" />
<n:set var="gridCol"    value="${gridMarker}${gridSize}" />
<n:forInputPage>
<div class="field hint">
  <%--
  本タグファイルは、field:internal_hintを使用することが可能だが、以下の理由からinternal_hintを利用していない。

  クライアントサイドでは、<jsp:doBody />されたタグ内部で、再度<jsp:doBody />が呼び出された場合正しく描画することが出来ない。
  --%>
  <n:forInputPage>
    <div class="note <n:write name='gridCol' />">
      ※  <jsp:doBody/>
    </div>
  </n:forInputPage>
</div>
</n:forInputPage>

