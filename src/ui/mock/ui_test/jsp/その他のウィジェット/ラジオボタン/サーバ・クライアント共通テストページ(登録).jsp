<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>
<n:forInputPage>
  <input name="input" type="hidden" value="1" />
</n:forInputPage>

<field:block title="打鍵動作確認">
  <span class="test-case">ラベルをクリックすることでラジオボタンを選択状態にできること</span>
  <field:radio
      title="ラベルをクリック！"
      name="server.label-click"
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
</field:block>
<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:radio
      title="required未指定"
      name="server.required-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:radio
      title="requiredブランク"
      name="server.required-blank"
      required=""
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:radio
      title="required[false]"
      name="server.required-false"
      required="false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:radio
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:radio
      title="hint未指定"
      name="server.hint-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="radio-list">
  </field:radio>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:radio
      title="hintブランク"
      name="server.hint-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="">
  </field:radio>
  <span class="test-case hint-test">hint属性を指定した場合、hintが出力されること</span>
  <field:radio
      title="hint指定"
      name="server.hint-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="ヒント">
  </field:radio>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:radio
      title="タイトル属性に長い文言を設定することで折り返す"
      name="server.hint-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="ヒント"
      disabled="true">
  </field:radio>

</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:radio
      title="readonly未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.readonly-none">
  </field:radio>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:radio
      title="readonlyブランク"
      name="server.readonly-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="">
  </field:radio>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:radio
      title="readonly[true]"
      name="server.readonly-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="true">
  </field:radio>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:radio
      title="readonly[false]"
      name="server.readonly-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="false">
  </field:radio>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:radio
      title="disabled未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.disabled-none">
  </field:radio>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:radio
      title="disabledブランク"
      name="server.disabled-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="">
  </field:radio>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:radio
      title="disabled[true]"
      name="server.disabled-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="true">
  </field:radio>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:radio
      title="disabled[false]"
      name="server.disabled-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="false">
  </field:radio>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
  <field:radio
      title="cssClass属性未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.cssClass-none">
  </field:radio>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
  <field:radio
      title="cssClass属性ブランク"
      name="server.cssClass-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      cssClass="">
  </field:radio>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
  <field:radio
      title="cssClass属性指定"
      name="server.cssClass-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      cssClass="cssClass-test">
  </field:radio>
</field:block>

<field:block title="listFormat属性">
  <span class="test-case listFormat-test">listFormat属性を指定しない場合、span区切りのリスト表示となること</span>
  <field:radio
      title="listFormat属性未指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      sample="[default区切り1]|default区切り2|default区切り3"
      name="server.listformat-none">
  </field:radio>
  <span class="test-case listFormat-test">listFormat属性にブランクを指定した場合、span区切りのリスト表示となること</span>
  <field:radio
      title="listFormat属性ブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat=""
      sample="[default区切り1]|default区切り2|default区切り3"
      name="server.listformat-blank">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(br)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(br)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="br"
      sample="br区切り1|[br区切り2]|br区切り3"
      name="server.listformat-br">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(div)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(div)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="div"
      sample="div区切り1|[div区切り2]|div区切り3"
      name="server.listformat-div">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(span)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(span)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="span"
      sample="span区切り1|[span区切り2]|span区切り3"
      name="server.listformat-span">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(ul)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(ul)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="ul"
      sample="ul区切り1|[ul区切り2]|ul区切り3"
      name="server.listformat-ul">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(ol)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(ol)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="ol"
      sample="ol区切り1|[ol区切り2]|ol区切り3"
      name="server.listformat-ol">
  </field:radio>

  <span class="test-case listFormat-test">listFormat属性を指定した場合、指定したフォーマット(sp)でのリスト表示となること</span>
  <field:radio
      title="listFormat属性指定(sp)"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="sp"
      sample="sp区切り1|[sp区切り2]|sp区切り3"
      name="server.listformat-sp">
  </field:radio>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:radio
      title="sample属性未指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      listFormat="sp"
      name="dummy">
  </field:radio>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:radio
      title="sample属性ブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      listFormat="sp"
      sample=""
      name="dummy">
  </field:radio>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値が出力され、[]で囲まれた値が選択状態となること。</span>
  <field:radio
      title="sample属性指定"
      required="true"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      listFormat="sp"
      name="dummy">
  </field:radio>
</field:block>

<field:block title="size属性">
  <span class="test-case size-test">
    size属性が未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:radio
      title="size属性未指定"
      required="true"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="br"
      name="input.notSize">
  </field:radio>

  <span class="test-case size-test">
    size属性がブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:radio
      title="size属性未指定"
      required="true"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="br"
      name="input.blankSize"
      titleSize=""
      inputSize="">
  </field:radio>

  <span class="test-case size-test">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>
  <field:radio
      title="size属性指定"
      required="true"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="radio-list"
      listFormat="br"
      name="input.size"
      titleSize="5"
      inputSize="10">
  </field:radio>

</field:block>

<button:block>
  <n:forInputPage>
    <button:check
        uri="./サーバ・クライアント共通テストページ(確認).jsp"
        dummyUri="サーバ・クライアント共通テストページ(確認).jsp">
    </button:check>
  </n:forInputPage>
  <n:forConfirmationPage>
    <button:back
        uri="./サーバ・クライアント共通テストケース.jsp"
        dummyUri="サーバ・クライアント共通テストケース.jsp">
    </button:back>
  </n:forConfirmationPage>
</button:block>
</n:form>
