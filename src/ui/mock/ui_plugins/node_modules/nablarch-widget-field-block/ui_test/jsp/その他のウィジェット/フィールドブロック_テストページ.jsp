<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form name="text">

  <span class="test-case not-title">title属性を指定しない場合</span>
  <field:block></field:block>

  <span class="test-case title-blank">title属性にブランクを指定した場合</span>
  <field:block title=""></field:block>

  <span class="test-case title">title属性を指定</span>
  <field:block title="タイトル指定"></field:block>

  <span class="test-case not-id">ID属性を指定しない場合</span>
  <field:block title="id指定なし"></field:block>

  <span class="test-case id-blank">ID属性にブランクを指定</span>
  <field:block title="idブランク"></field:block>

  <span class="test-case id">ID属性を指定</span>
  <field:block title="id指定" id="test-id"></field:block>

  <span class="test-case not-collapsible">collapsible属性を指定しない場合、開閉可能とはならないこと</span>
  <field:block title="collapsible未指定"></field:block>

  <span class="test-case collapsible-blank">collapsible属性がブランクの場合、開閉可能とはならないこと</span>
  <field:block title="collapsibleブランク" collapsible=""></field:block>

  <span class="test-case collapsible-false">collapsible属性がfalseの場合、開閉可能とはならないこと</span>
  <field:block title="collapsible:false" collapsible="false"></field:block>

  <span class="test-case collapsible-true">collapsible属性がtrueの場合、開閉可能となること（開かれた状態）</span>
  <field:block title="collapsible:true" collapsible="true" name="c_true" value="1">
    <box:content>
      開かれた状態
    </box:content>
  </field:block>

  <span class="test-case collapsible-true-closed">collapsible属性がtrueの場合でclosedがtrueの場合は、開閉可能となり閉じられた状態で表示されること</span>
  <field:block title="collapsible:true(closed)" collapsible="true" name="c_true" value="2" collapsed="true">
    <box:content>
      閉じられた状態
    </box:content>
  </field:block>

  <span class="test-case not-showtitle">showTitle属性を指定しない場合、タイトル属性が表示されること</span>
  <field:block title="showTitle未指定"></field:block>

  <span class="test-case showtitle-blank">showTitle属性がブランクの場合、タイトル属性が表示されること</span>
  <field:block title="showTitleブランク" showTitle=""></field:block>

  <span class="test-case showtitle-true">showTitle属性がtrueの場合、タイトル属性が表示されること</span>
  <field:block title="showTitle:true" showTitle="true"></field:block>

  <span class="test-case showtitle-false">showTitle属性がfalseの場合、タイトル属性が表示されないこと</span>
  <field:block title="showTitle:false" showTitle="false"></field:block>
</n:form>

