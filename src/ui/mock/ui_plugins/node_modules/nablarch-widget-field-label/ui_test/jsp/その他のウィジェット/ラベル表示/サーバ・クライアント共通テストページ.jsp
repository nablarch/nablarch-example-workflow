<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
  <field:block title="id属性">
    <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
    <field:label
        title="id属性未指定"
        name="server.id-none">
    </field:label>
    <span class="test-case id-test">id属性が空文字列の場合、name属性がid属性に設定されること</span>
    <field:label
        title="id属性ブランク"
        name="server.id-blank"
        id="">
    </field:label>
    <span class="test-case id-test">id属性を指定した場合、そのidがid属性に設定されること</span>
    <field:label
        title="id属性指定"
        name="server.id-nonblank"
        id="test-id">
    </field:label>
  </field:block>

  <field:block title="cssClass属性">
    <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がfield-contentのみとなること(ソースから確認)</span>
    <field:label
        title="cssClass属性未指定"
        name="server.cssClass-none">
    </field:label>
    <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がfield-contentとなること(ソースから確認)</span>
    <field:label
        title="cssClass属性ブランク"
        name="server.cssClass-blank"
        cssClass="">
    </field:label>
    <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
    <field:label
        title="cssClass属性指定"
        name="server.cssClass-nonblank"
        cssClass="cssClass-test">
    </field:label>
  </field:block>

  <field:block title="domain属性">
    <span class="test-case domain-test">domain属性を指定しない場合、親のdivのclass属性がfieldのみとなること(ソースから確認)</span>
    <field:label
        title="domain属性未指定"
        name="server.domain-none">
    </field:label>
    <span class="test-case domain-test">domain属性にブランクを指定した場合、親のdivのclass属性がfieldのみとなること(ソースから確認)</span>
    <field:label
        title="domain属性ブランク"
        name="server.domain-blank"
        domain="">
    </field:label>
    <span class="test-case domain-test">domain属性を指定した場合、親のdivのclass属性に指定したdomainが設定されること</span>
    <field:label
        title="domain属性指定"
        name="server.domain-nonblank"
        domain="domain-test">
    </field:label>
  </field:block>

  <field:block title="sample属性">
    <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
    <field:label
        title="sample属性未指定"
        name="dummy">
    </field:label>
    <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
    <field:label
        title="sample属性ブランク"
        sample=""
        name="dummy">
    </field:label>
    <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値が出力されること</span>
    <field:label
        title="sample属性指定"
        sample="サンプル値"
        name="dummy">
    </field:label>
  </field:block>

  <field:block title="unit属性">
    <span class="test-case unit-test">
      unit属性を指定していないので、単位は出力されないこと
    </span>
    <field:label
        title="unit属性未指定"
        name="server.not-unit"
        valueFormat="decimal{###,##0}">
    </field:label>

    <span class="test-case unit-test">
      unit属性にブランクを指定した場合、単位は出力されないこと
    </span>
    <field:label
        title="unit属性にブランク指定"
        name="server.unit-blank"
        valueFormat="decimal{###,##0}"
        unit="">
    </field:label>

    <span class="test-case unit-test">
      unit属性を指定しているが、出力される値が空のため単位は出力されないこと
    </span>
    <field:label
        title="unit属性を指定(値は空)"
        name="server.unit-value-empty"
        valueFormat="decimal{###,##0}"
        unit="万円">
    </field:label>

    <span class="test-case unit-test">
      unit属性を指定した場合、ラベルの右側に単位が出力されること
    </span>
    <field:label
        title="unit属性を指定(指定単位がラベルの右側に表示されるはず)"
        name="server.unit"
        valueFormat="decimal{###,###}"
        sample="100"
        unit="万円">
    </field:label>
  </field:block>

  <field:block title="タイトルのサイズと入力部のサイズ">
    <span class="test-case title-input-size">
      titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>

    <field:label
        title="titleSizeとinputSizeは未指定"
        name="server.noneTitleInputSize">
    </field:label>

    <span class="test-case title-input-size">
      titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
    </span>
    <field:label
        title="titleSizeとinputSizeはブランク"
        name="server.emptyTitleInputSize"
        titleSize=""
        inputSize="">
    </field:label>

    <span class="test-case title-input-size">
      titleSizeとinputSizeをともに指定<br/>

      タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
      入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
    </span>
    <field:label
        title="titleSizeとinputSize指定"
        name="server.titleInputSize"
        titleSize="6"
        inputSize="7">
    </field:label>

  </field:block>
</n:form>
