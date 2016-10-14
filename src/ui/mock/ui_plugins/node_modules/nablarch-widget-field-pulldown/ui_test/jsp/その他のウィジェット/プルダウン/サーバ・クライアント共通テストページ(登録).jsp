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

<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:pulldown
      title="required未指定"
      name="server.required-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      sample="[]|サンプル値1|サンプル値2|サンプル値3"
      listName="pulldown-list">
  </field:pulldown>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:pulldown
      title="requiredブランク"
      name="server.required-blank"
      required=""
      elementLabelProperty="label"
      elementValueProperty="value"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="pulldown-list">
  </field:pulldown>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:pulldown
      title="required[false]"
      name="server.required-false"
      required="false"
      elementLabelProperty="label"
      elementValueProperty="value"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="pulldown-list">
  </field:pulldown>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:pulldown
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="pulldown-list">
  </field:pulldown>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:pulldown
      title="hint未指定"
      name="server.hint-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      listName="pulldown-list">
  </field:pulldown>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:pulldown
      title="hintブランク"
      name="server.hint-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="">
  </field:pulldown>
  <span class="test-case hint-test">hint属性を指定した場合、入力画面ではhintが出力されること（確認画面では出力されないこと）</span>
  <field:pulldown
      title="hint指定"
      name="server.hint-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="ヒント">
  </field:pulldown>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:pulldown
      title="タイトル属性に長い文言を設定することで折り返す"
      name="server.hint-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      hint="ヒント">
  </field:pulldown>

</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:pulldown
      title="readonly未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.readonly-none">
  </field:pulldown>
  <span class="test-case readonly-test">readonly属性が空文字列の場合、編集可能になること</span>
  <field:pulldown
      title="readonlyブランク"
      name="server.readonly-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="">
  </field:pulldown>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:pulldown
      title="readonly[true]"
      name="server.readonly-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="true">
  </field:pulldown>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:pulldown
      title="readonly[false]"
      name="server.readonly-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      readonly="false">
  </field:pulldown>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:pulldown
      title="disabled未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.disabled-none">
  </field:pulldown>
  <span class="test-case disabled-test">disabled属性が空文字列の場合、編集可能となりサーバに値が送信されること</span>
  <field:pulldown
      title="disabledブランク"
      name="server.disabled-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="">
  </field:pulldown>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:pulldown
      title="disabled[true]"
      name="server.disabled-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="true">
  </field:pulldown>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:pulldown
      title="disabled[false]"
      name="server.disabled-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      disabled="false">
  </field:pulldown>
</field:block>

<field:block title="id属性">
  <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
  <field:pulldown
      title="id属性未指定"
      name="server.id-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]">
  </field:pulldown>
  <span class="test-case id-test">id属性が空文字列の場合、name属性がid属性に設定されること</span>
  <field:pulldown
      title="id属性ブランク"
      name="server.id-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      id="">
  </field:pulldown>
  <span class="test-case id-test">id属性を指定した場合、そのidがid属性に設定されること</span>
  <field:pulldown
      title="id属性指定"
      name="server.id-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      id="test-id">
  </field:pulldown>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性がブランクとなること(ソースから確認)</span>
  <field:pulldown
      title="cssClass属性未指定"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      name="server.cssClass-none">
  </field:pulldown>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性がブランクとなること(ソースから確認)</span>
  <field:pulldown
      title="cssClass属性ブランク"
      name="server.cssClass-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      cssClass="">
  </field:pulldown>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性に指定したcssClassが設定されること</span>
  <field:pulldown
      title="cssClass属性指定"
      name="server.cssClass-nonblank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      cssClass="cssClass-test">
  </field:pulldown>
</field:block>
<field:block title="multiple属性">
  <span class="test-case multiple-test">multiple属性を指定しない場合、複数選択できないプルダウンが出力されること</span>
  <field:pulldown
      title="multiple属性未指定"
      name="server.multiple-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|[サンプル値2]|[サンプル値3]">
  </field:pulldown>
  <span class="test-case multiple-test">multiple属性にブランクを指定した場合、複数選択できないプルダウンが出力されること</span>
  <field:pulldown
      title="multiple属性ブランク"
      name="server.multiple-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      multiple=""
      sample="サンプル値1|[サンプル値2]|[サンプル値3]">
  </field:pulldown>
  <span class="test-case multiple-test">multiple属性にtrueを指定した場合、複数選択できるプルダウンが出力されること</span>
  <field:pulldown
      title="multiple[true]"
      name="server.multiple-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      multiple="true"
      sample="サンプル値1|[サンプル値2]|[サンプル値3]">
  </field:pulldown>
  <span class="test-case multiple-test">multiple属性にfalseを指定した場合、複数選択できないプルダウンが出力されること</span>
  <field:pulldown
      title="multiple[false]"
      name="server.multiple-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      multiple="false"
      sample="サンプル値1|[サンプル値2]|[サンプル値3]">
  </field:pulldown>
</field:block>

<field:block title="withNoneOption属性">
  <span class="test-case withNoneOption-test">withNoneOptionを指定しない場合、「（選択しない）」の項目が表示されないこと</span>
  <field:pulldown
      title="withNoneOption属性未指定"
      name="server.noneOption-none"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="サンプル値1|サンプル値2|サンプル値3">
  </field:pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにブランクを指定した場合、「（選択しない）」の項目が表示されないこと</span>
  <field:pulldown
      title="withNoneOption属性ブランク"
      name="server.noneOption-blank"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      withNoneOption=""
      sample="サンプル値1|サンプル値2|サンプル値3">
  </field:pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにtrueを指定した場合、「（選択しない）」の項目が表示されること</span>
  <field:pulldown
      title="withNoneOption[true]"
      name="server.noneOption-true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      withNoneOption="true"
      sample="サンプル値1|サンプル値2|サンプル値3">
  </field:pulldown>
  <span class="test-case withNoneOption-test">withNoneOptionにfalseを指定した場合、「（選択しない）」の項目が表示されないこと</span>
  <field:pulldown
      title="withNoneOption[false]"
      name="server.noneOption-false"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      withNoneOption="false"
      sample="サンプル値1|サンプル値2|サンプル値3">
  </field:pulldown>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:pulldown
      title="sample属性未指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      name="dummy">
  </field:pulldown>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:pulldown
      title="sample属性ブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      sample=""
      name="dummy">
  </field:pulldown>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値が出力され、[]で囲まれた値が選択状態となること。</span>
  <field:pulldown
      title="sample属性指定"
      required="true"
      sample="サンプル値1|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      name="dummy">
  </field:pulldown>
  <span class="test-case sample-test">複数項目を[]で囲むと、囲まれた値が全て選択状態となること。(multiple)</span>
  <field:pulldown
      title="sample属性指定"
      required="true"
      sample="[サンプル値1]|サンプル値2|[サンプル値3]"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="not-exist"
      multiple="true"
      name="dummy">
  </field:pulldown>
</field:block>
<field:block title="制約事項確認">
  <span class="test-case">プルダウン内に非常に長い文字列が含まれると、すべて表示されずに見切れてしまう。</span>
  <field:pulldown
      title="IEでの制約事項"
      name="server.very-long-label"
      listName="very-long-pulldown-list"
      sample="非常に長いラベル1：いろはにほへとちりぬるをわかよたれそつねならむ|非常に長いラベル2：うゐのおくやまけふこえてあさきゆめみしゑひもせす|普通のラベル"
      elementLabelProperty="label"
      elementValueProperty="value">
  </field:pulldown>
</field:block>

<field:block title="size属性">
  <span class="test-case size-test">size属性を指定しない場合、デフォルトの行数で表示されること</span>
  <field:pulldown
      title="size属性未指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="oversize-list"
      sample="ラベル1|ラベル2|ラベル3|ラベル4|ラベル5|ラベル6|ラベル7|ラベル8|ラベル9|ラベル10|ラベル11|ラベル12|ラベル13|ラベル14"
      name="server.size-none">
  </field:pulldown>
  <span class="test-case size-test">size属性にブランクを指定した場合、デフォルトの行数で表示されること</span>
  <field:pulldown
      title="size属性ブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="oversize-list"
      size=""
      sample="ラベル1|ラベル2|ラベル3|ラベル4|ラベル5|ラベル6|ラベル7|ラベル8|ラベル9|ラベル10|ラベル11|ラベル12|ラベル13|ラベル14"
      name="server.size-blank">
  </field:pulldown>
  <span class="test-case size-test">size属性を指定した場合、指定した行数で表示されること</span>
  <field:pulldown
      title="size属性指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="oversize-list"
      size="10"
      sample="ラベル1|ラベル2|ラベル3|ラベル4|ラベル5|ラベル6|ラベル7|ラベル8|ラベル9|ラベル10|ラベル11|ラベル12|ラベル13|ラベル14"
      name="server.size-blank">
  </field:pulldown>
</field:block>

<field:block title="タイトルのサイズと入力部のサイズ">
  <span class="test-case title-input-size">
    titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:pulldown
      title="titleSizeとinputSize未指定"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="ラベル1|ラベル2|ラベル3|ラベル4"
      name="server.noneTitleInputSize">
  </field:pulldown>

  <span class="test-case title-input-size">
    titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:pulldown
      title="titleSizeとinputSizeブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="ラベル1|ラベル2|ラベル3|ラベル4"
      name="server.emptyTitleInputSize"
      titleSize=""
      inputSize="">
  </field:pulldown>

  <span class="test-case title-input-size">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>
  <field:pulldown
      title="titleSizeとinputSizeブランク"
      required="true"
      elementLabelProperty="label"
      elementValueProperty="value"
      listName="pulldown-list"
      sample="ラベル1|ラベル2|ラベル3|ラベル4"
      name="server.titleInputSize"
      titleSize="12"
      inputSize="8">
  </field:pulldown>

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
