<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="sample属性">
    <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共に値が出力されないこと</span>
    <field:label_id_value
        title="sample属性未指定"
        idName="not-exist"
        valueName="not-exist">
    </field:label_id_value>
    <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共に値が出力されないこと</span>
    <field:label_id_value
        title="sample属性ブランク"
        idName="not-exist"
        valueName="not-exist"
        sample="">
    </field:label_id_value>
    <span class="test-case sample-test">sample属性を指定した場合、クライアントでは指定された値が表示されること。</span>
    <field:label_id_value
        title="sample属性指定（クライアントサイドでは指定した値が表示されるよ）"
        idName="not-exist"
        valueName="not-exist"
        sample="サンプルID:サンプルVALUE">
    </field:label_id_value>
  </field:block>

  <field:block title="タイトルのサイズと入力部のサイズ">
    <span class="test-case title-input-size">
      titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_id_value
        title="titleSizeとinputSize未指定"
        idName="server.id"
        valueName="server.value"
        sample="サンプルID:サンプルVALUE">
    </field:label_id_value>

    <span class="test-case title-input-size">
      titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label_id_value
        title="titleSizeとinputSizeブランク"
        idName="server.id"
        valueName="server.value"
        sample="サンプルID:サンプルVALUE"
        titleSize=""
        inputSize="">
    </field:label_id_value>

    <span class="test-case title-input-size">
      titleSizeとinputSizeをともに指定<br/>

      タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
      入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
    </span>
    <field:label_id_value
        title="titleSizeとinputSize指定"
        idName="server.id"
        valueName="server.value"
        sample="サンプルID:サンプルVALUE"
        titleSize="14"
        inputSize="9">
    </field:label_id_value>

  </field:block>
</n:form>
