<%--
  表示モード対応ウィジェット
  @author takanori tani
--%>

<%@tag pageEncoding="UTF-8" description="表示モードによってスタイルを読み込むウィジェット" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--[if lte IE 8]>
<n:link rel="stylesheet" type="text/css" href="/css/built/wide-minify.css" />
<![endif]-->

<!--[if gte IE 9]>
<n:link rel="stylesheet" type="text/css" href="/css/built/wide-minify.css"    media="screen and (min-width: 980px)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/compact-minify.css" media="screen and (min-width: 640px) and (max-width: 979px)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/narrow-minify.css"  media="screen and (max-width: 639px)" />
<![endif]-->

<!--[if !IE]> -->
<n:link rel="stylesheet" type="text/css" href="/css/built/wide-minify.css"    media="screen and (min-width: 980px)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/compact-minify.css" media="screen and (min-width: 640px) and (max-width: 979px) and (orientation: portrait)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/compact-minify.css" media="screen and (min-width: 640px) and (max-width: 979px) and (max-height: 979px) and (orientation: landscape)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/narrow-minify.css"  media="screen and (max-width: 639px)" />
<n:link rel="stylesheet" type="text/css" href="/css/built/wide-minify.css"    media="screen and (device-width: 768px) and (device-height: 1024px) and (orientation:landscape)" />
<!-- <![endif]-->
