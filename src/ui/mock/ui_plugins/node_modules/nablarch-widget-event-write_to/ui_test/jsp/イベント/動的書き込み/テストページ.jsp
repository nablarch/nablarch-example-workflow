<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">
    <field:block title="必須属性">
      <span class="testcase requireTest">
      必須属性のみを指定した場合に動作することを確認する。<br>
      (eventの定義はブロック内のinputからフォーカスアウトした場合に動作)
      </span>
      <event:listen event="input blur">
        <event:write_to
           title="入力内容をラベルに反映する。"
           target="div.to"
           format="{input}">
        </event:write_to>
      </event:listen>
      <field:text title="入力内容1" name="formdata.from" cssClass="from"></field:text>
      <field:label title="反映先" name="formdata.to" cssClass="to"></field:label>
    </field:block>


    <field:block title="format属性">
      <span class="testcase formatTest">フォーマット属性に従って出力されること</span>
      <event:listen event="input change">
        <event:write_to target="span.to.default"></event:write_to>
        <event:write_to target="span.to.blank" format=""></event:write_to>
        <event:write_to target="span.to.first" format="{input.first}"></event:write_to>
        <event:write_to target="span.to.second" format="{input.second}"></event:write_to>
        <event:write_to target="span.to.multi" format="{input.first}-{input.second}-{input.third}"></event:write_to>
      </event:listen>

      <field:text title="入力1" name="formdata.first" cssClass="first"></field:text>
      <field:text title="入力2" name="formdata.second" cssClass="second"></field:text>
      <field:text title="入力3" name="formdata.third"  cssClass="third"></field:text>

      <field:label_block title="format:未指定"><span class="to default"></span></field:label_block>
      <field:label_block title="format:ブランク"><span class="to blank"></span></field:label_block>
      <field:label_block title="format:指定({1})"><span class="to first"></span></field:label_block>
      <field:label_block title="format:指定({2})"><span class="to second"></span></field:label_block>
      <field:label_block title="format:複数指定({1}-{2}-{3})"><span class="to multi"></span></field:label_block>
    </field:block>
</n:form>
