<%--
  動作環境の情報をJavaScriptから読み取れる形で出力するタグ。
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="動作環境に関する情報をJavaScriptに出力する。" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>

<n:script type="text/javascript">
var nablarch_device = {
      type       : '<n:write name="nablarch_deviceType" withHtmlFormat="false" />'
    , version    : '<n:write name="nablarch_deviceVersion" withHtmlFormat="false" />'
    , browser    : '<n:write name="nablarch_browserType" withHtmlFormat="false" />'
    , browserVersion : '<n:write name="nablarch_browserVersion" withHtmlFormat="false" />'
   };
</n:script>
