<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case require_val-test">必須属性のみ指定して、正しくname属性に指定された変数の値が出力されること</span>
    <field:label
        title="タイトル"
        name="server.required-name">
    </field:label>
  </field:block>

  <field:block title="valueFormat属性">
    <span class="test-case valueFormat-test">valueFormat属性を指定しない場合、フォーマットされずに値が出力されること</span>
    <field:label
        title="valueFormat属性未指定"
        name="server.valueFormat-none">
    </field:label>
    <span class="test-case valueFormat-test">valueFormat属性にブランクを指定した場合、フォーマットされずに値が出力されること</span>
    <field:label
        title="valueFormat属性ブランク"
        name="server.valueFormat-blank"
        valueFormat="">
    </field:label>
    <span class="test-case valueFormat-test">valueFormat属性を指定した場合、そのフォーマットに従い値がフォーマットされて出力されること</span>
    <field:label
        title="valueFormat属性指定"
        name="server.valueFormat"
        valueFormat="yyyymmdd{yyyy年MM月dd日}">
    </field:label>
  </field:block>
</n:form>

