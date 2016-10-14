<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="必須属性のみ">
    <span class="test-case label_block-test">必須属性のみ指定した場合titleに指定した値（「タイトル」）が、title部に出力されること</span>
    <field:label_block title="タイトル">
    </field:label_block>
  </field:block>
  <field:block title="ラベル表示">
    <span class="test-case label_block-test">body部に記載した内容が、ラベルとして表示されること</span>
    <field:label_block title="body(body部に指定された内容がラベルに出力される)">
      この内容がラベルとして表示されること。
    </field:label_block>
  </field:block>

  <field:block title="タイトルのサイズと入力部のサイズ">
    <span class="test-case title-input-size">
      titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_block
        title="titleSizeとinputSize未指定">
      いろいろ表示される場所
    </field:label_block>

    <span class="test-case title-input-size">
      titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_block
        title="titleSizeとinputSizeにブランク指定"
        titleSize=""
        inputSize="">
      いろいろ表示される場所
    </field:label_block>

    <span class="test-case title-input-size">
      titleSizeとinputSizeをともに指定<br/>

      タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
      入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
    </span>
    <field:label_block
        title="titleSizeとinputSizeにブランク指定"
        titleSize="10"
        inputSize="12">
      hoge<br/>
      fuga<br/>
    </field:label_block>
  </field:block>
</n:form>

