<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:page_template title="フォーム自動生成テスト用画面">
  <jsp:attribute name="contentHtml">

<n:form>
  <spec:layout name="フォーム自動生成その１">
    <field:block title="文字列">
      <field:text
          title="固定長(50文字)"
          name="bean.fixedChar"
          domain="FIXED_CHAR"
          sample="固定長">
      </field:text>
      <field:text
          title="可変長(0-30文字)"
          name="bean.varchar30"
          domain="VARCHAR_30"
          sample="0-30の文字列">
      </field:text>
      <field:text
          title="可変長(5-10文字)"
          name="bean.varchar5_10"
          domain="VARCHAR_5_10"
          sample="5-10の文字列">
      </field:text>
      <field:textarea
          title="改行許容"
          name="bean.allowLineSeparator"
          domain="ALLOW_LINE_SEPARATOR"
          sample="改行OK">
      </field:textarea>

      <field:password
          title="パスワード"
          name="password"
          domain="PASS"
          sample="password">
      </field:password>
    </field:block>

    <field:block title="数値関連">
      <field:text
          title="整数部のみ(10)"
          name="bean.integer"
          domain="INTEGER"
          sample="100">
      </field:text>
      <field:text
          title="小数部あり(1,9)"
          name="bean.decimal"
          domain="DECIMAL"
          sample="0.01234">
      </field:text>
      <field:text
          title="下限設定あり(0.1-)"
          name="bean.minDecimal"
          domain="MIN_DECIMAL"
          sample="0.12345">
      </field:text>
      <field:text
          title="下限、上限設定あり(20-50)"
          name="bean.minMaxInteger"
          domain="MIN_MAX_INTEGER"
          sample="25">
      </field:text>
      <field:text
          title="上限設定あり(-99999)"
          name="bean.maxInteger"
          domain="MAX_INTEGER"
          sample="99999">
      </field:text>
      <field:text
          title="カンマ許容"
          name="bean.comma"
          domain="COMMA"
          formatSpec="9,999"
          sample="1,234">
      </field:text>
      <field:text
          title="カンマ許容しない"
          name="bean.notComma"
          domain="NOT_COMMA"
          sample="1234">
      </field:text>
    </field:block>

    <field:block title="日付関連">
      <field:calendar
          title="年月日"
          name="bean.ymd"
          sample="2014/03/28"
          format="yyyy/MM/dd"
          domain="YYYYMMDD">
      </field:calendar>
      <field:text
          title="年月"
          name="bean.ym"
          sample="2014/03"
          formatSpec="yyyy/MM"
          valueFormat="yyyy/MM"
          domain="YYYYMM">
      </field:text>
    </field:block>

    <field:block title="チェックボックス関連">
      <field:checkbox
          title="チェックボックス"
          name="bean.checkbox"
          listName="checkbox"
          elementLabelProperty="id"
          elementValueProperty="value"
          domain="CHECKBOX"
          sample="1|2|3">
      </field:checkbox>

      <field:code_checkbox
          title="コードチェックボックス"
          name="bean.codeCheckbox"
          codeId="CODE_CHECKBOX"
          domain="CODE_CHECKBOX"
          sample="いち|に">
      </field:code_checkbox>

      <field:code_checkbox
          title="コードチェックボックス(パターン02)"
          name="bean.codeCheckbox2"
          codeId="CODE_CHECKBOX"
          domain="CODE_CHECKBOX"
          pattern="PATTERN02"
          sample="いち|に">
      </field:code_checkbox>
    </field:block>

    <field:block title="ラジオボタン関連">
      <field:radio
          title="ラジオボタン"
          name="bean.radio"
          listName="radio"
          elementLabelProperty="id"
          elementValueProperty="value"
          domain="RADIO"
          sample="1|2|3|4">
      </field:radio>

      <field:code_radio
          title="コードラジオ"
          name="bean.codeRadio"
          codeId="CODE_RADIO"
          domain="CODE_RADIO"
          sample="らじお１|らじお2">
      </field:code_radio>

      <field:code_radio
          title="コードラジオ(パターン20)"
          name="bean.codeRadio2"
          codeId="CODE_RADIO"
          domain="CODE_RADIO"
          pattern="PATTERN20"
          sample="らじお１|らじお2">
      </field:code_radio>
    </field:block>

    <field:block title="プルダウン関連">
      <field:pulldown
          title="プルダウン"
          name="bean.pulldown"
          listName="pulldown"
          elementLabelProperty="id"
          elementValueProperty="value"
          domain="PULLDOWN"
          sample="1|2|3|4|5">
      </field:pulldown>

      <field:pulldown
          title="プルダウン(複数選択可能)"
          name="bean.pulldownMulti"
          listName="pulldown"
          elementLabelProperty="id"
          elementValueProperty="value"
          multiple="true"
          domain="PULLDOWN"
          sample="1|2|3|4|5">
      </field:pulldown>

      <field:code_pulldown
          title="コードプルダウン"
          name="bean.pulldown"
          domain="CODE_PULLDOWN"
          codeId="CODE_PULLDOWN"
          sample="1|2|3|4|5">
      </field:code_pulldown>

      <field:code_pulldown
          title="コードプルダウン(パターン10)"
          name="bean.pulldown2"
          domain="CODE_PULLDOWN"
          codeId="CODE_PULLDOWN"
          pattern="PATTERN10"
          sample="1|2|3|4|5">
      </field:code_pulldown>

      <field:code_pulldown
          title="コードプルダウン(複数選択可能)"
          name="bean.pulldown3"
          domain="CODE_PULLDOWN"
          codeId="CODE_PULLDOWN"
          multiple="true"
          sample="1|2|3|4|5">
      </field:code_pulldown>

      <field:listbuilder
          title="リストビルダー"
          name="bean.listbuilder"
          id="listbuilder"
          listName="listbuilder"
          domain="LISTBUILDER"
          elementLabelProperty="id"
          elementValueProperty="value"
          sample="1|2|3|4|5">
      </field:listbuilder>

    </field:block>

  </spec:layout>
</n:form>
  </jsp:attribute>
</t:page_template>

