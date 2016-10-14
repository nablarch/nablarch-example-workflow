<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<t:page_template
    title="交通費申請一覧">

  <jsp:attribute name="contentHtml">
    <!-- 条件 -->
    <n:form windowScopePrefixes="user">
      <field:block title="検索条件">
        <layout:row>
          <field:code_pulldown
              title="承認状況"
              name="user.status"
              codeId=""
              titleSize="10"
              inputSize="20"
              sample="確認待ち|再申請待ち（確認取消）|再申請待ち（差戻し）|[完了]|却下">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:code_pulldown
              title="移動種類"
              name="user.media"
              codeId=""
              titleSize="10"
              inputSize="20"
              sample="[バス]|電車|タクシー">
          </field:code_pulldown>
        </layout:row>
        <layout:row>
          <field:calendar
              title="申請日"
              name="user.deadline"
              titleSize="10"
              inputSize="20"
              hint="指定した日付以降の申請を表示します。"
              sample="2013/01/02">
          </field:calendar>
        </layout:row>
        <layout:row>
          <layout:cell gridSize="35"></layout:cell>
          <button:search
              uri=""
              label="検索"
              size="10"></button:search>
        </layout:row>
      </field:block>
    </n:form>
    
    <!-- 結果 -->
    <n:form windowScopePrefixes="user">
      <table:search_result
        title = "検索結果"
        listSearchInfoName=""
        sampleResults = "3">
        
        <column:link
          uri=""
          title = "移動種類"
          sample = "電車|タクシー|バス">
        </column:link>
        
        <column:label
          key=""
          title = "出発地"
          sample = "茅場町|西新宿|第三センター">
        </column:label>
        
        <column:label
          key=""
          title = "到着地"
          sample = "西新宿|浦安|西新宿">
        </column:label>
        
        <column:label
          key=""
          title = "申請日"
          sample = "2013/12/13|2014/01/13|2014/02/13"
          valueFormat="yyyy/MM/dd">
        </column:label>
        
        <column:code
          key=""
          title = "承認状況"
          codeId=""
          sample = "承認待ち|修正待ち（差戻し）|完了">
        </column:code>
        
      </table:search_result>
    </n:form>
  </jsp:attribute>
</t:page_template>