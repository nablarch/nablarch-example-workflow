<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form windowScopePrefixes="formdata">

      <div class="tabindex_context" id="multi_order" >
        <div class="nablarch_TabindexOrder -order multi_area2,multi_area1"></div>
        <span class="test-case">指定がある場合はtablindexが出力されること</span>
          <div id="multi_area1">
           <field:block title="複数の領域が指定された場合、定義情報に従うこと。">
            <field:text name="formdata.multi_order.text" title="テキスト"></field:text>
            <field:textarea name="formdata.multi_order.textarea" title="テキストエリア" rows="1"></field:textarea>
            <field:file name="formdata.multi_order.file" title="ファイル"></field:file>
            </field:block>
            <button:block>
            <n:a href="../index.jsp">tabindexの確認</n:a>
            </button:block>
          </div>
          <div id="multi_area2">
           <field:block title="複数指定">
            <field:pulldown
                title="プルダウン" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.multi_order.select" listName="jobs" sample="医者|公務員|会社員|自由人"></field:pulldown>
            <field:radio
                title="ラジオ" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.multi_order.radio" listName="jobs" sample="医者|公務員|会社員|自由人"></field:radio>
            <field:checkbox
                title="チェックボックス" elementValueProperty="name" elementLabelProperty="name"
                name="formdata.multi_order.checkbox" listName="jobs" sample="医者|公務員|会社員|自由人"></field:checkbox>
            </field:block>
            <button:block>
            <button:check uri="../index.jsp"></button:check>
            </button:block>
          </div>
      </div>

    </n:form>
