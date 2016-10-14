<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>

<n:form>
<%--
 TreeMenuを利用したsampleの実装。
 pluginでは遷移先などがないのでuriはalert表示にする。
--%>
<div class="nablarch_TreeMenu -name asideMenu">
<n:plainHidden name="asideMenu"/>

<h3 id="sampleMenu1" class="menu_title"><i class=""></i>サンプルレイアウト1</h3>
<ul class="menu_folder -title sampleMenu1">
  <li>
    <link:submit
      uri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はuriをentryPointに書き換えてください。');"
      dummyUri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はdummyUriをentryPointに書き換えてください。');"
      label="">
      <i class="fa fa-list-alt"></i>サンプルレイアウト
    </link:submit>
  </li>
</ul>


<%-- 多段階層のメニュー --%>
<h3 id="firstStep" class="menu_title"><i class=""></i>1階層目のタイトル</h3>
<ul class="menu_folder -title firstStep">
  <li>
    <link:submit
      uri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はuriをentryPointに書き換えてください。');"
      dummyUri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はdummyUriをentryPointに書き換えてください。');"
      label="">
      <i class="fa fa-list-alt"></i>2階層目のリンク
    </link:submit>
  </li>
</ul>

<h3 id="secondStep1" class="menu_title menu_folder -title firstStep"><i class=""></i>2階層目のタイトル 1</h3>
<ul class="menu_folder -title secondStep1">
  <li>
    <link:submit
      uri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はuriをentryPointに書き換えてください。');"
      dummyUri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はdummyUriをentryPointに書き換えてください。');"
      label="">
      <i class="fa fa-list-alt"></i>3階層目のリンク
    </link:submit>
  </li>
</ul>

<h3 id="secondStep2" class="menu_title menu_folder -title firstStep"><i class=""></i>2階層目のタイトル 2</h3>
<ul class="menu_folder -title secondStep2">
  <li>
    <link:submit
      uri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はuriをentryPointに書き換えてください。');"
      dummyUri="javascript:alert('pluginではalert表示です。メニューから遷移する場合はdummyUriをentryPointに書き換えてください。');"
      label="">
      <i class="fa fa-list-alt"></i>3階層目のリンク
    </link:submit>
  </li>
</ul>

</div>
</n:form>
