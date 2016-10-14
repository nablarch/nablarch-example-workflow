<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form windowScopePrefixes="formdata">
      <div class="tabindex_context" id="order" >
        <div class="nablarch_TabindexOrder -order area1"></div>
        <span class="test-case">指定がある場合はtablindexが出力されること</span>
          <div id="area1">
           <field:block title="指定がある場合はtablindexが出力されること">
            <field:text name="formdata.order.text" title="テキスト"></field:text>
            <field:textarea name="formdata.order.textarea" title="テキストエリア" rows="1"></field:textarea>
            <field:file name="formdata.order.file" title="ファイル"></field:file>
            <field:pulldown
                title="プルダウン" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.order.select" listName="jobs" sample="医者|公務員|会社員|自由人"></field:pulldown>
            <field:radio
                title="ラジオ" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.order.radio" listName="jobs" sample="医者|公務員|会社員|自由人"></field:radio>
            <field:checkbox
                title="チェックボックス" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.order.checkbox" listName="jobs" sample="医者|公務員|会社員|自由人"></field:checkbox>
            </field:block>
            <button:block>
            <n:a href="../index.jsp">tabindexの確認</n:a>
            <button:check uri="../index.jsp"></button:check>
            </button:block>
          </div>
      </div>
    </n:form>
