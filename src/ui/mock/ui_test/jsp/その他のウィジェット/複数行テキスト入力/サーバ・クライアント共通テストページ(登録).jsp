<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<n:form>

<n:forInputPage>
  <input name="input" type="hidden" value="1" />
</n:forInputPage>

<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:textarea
      title="required未指定"
      name="server.required-none">
  </field:textarea>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:textarea
      title="requiredブランク"
      name="server.required-blank"
      required="">
  </field:textarea>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:textarea
      title="required[false]"
      name="server.required-false"
      required="false">
  </field:textarea>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:textarea
      title="required[true](必須マークがタイトルの右側につくこと)"
      name="server.required-true"
      required="true">
  </field:textarea>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能になること</span>
  <field:textarea
      title="readonly指定なし"
      name="server.readonly-none">
  </field:textarea>
  <span class="test-case readonly-test">readonly属性がブランクの場合、編集可能になること</span>
  <field:textarea
      title="readonlyブランク"
      name="server.readonly-blank"
      readonly="">
  </field:textarea>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可になること(値は送信され確認画面にラベル表示されること)</span>
  <field:textarea
      title="readonly[true]"
      name="server.readonly-true"
      readonly="true">
  </field:textarea>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能になること</span>
  <field:textarea
      title="readonly[false]"
      name="server.readonly-false"
      readonly="false">
  </field:textarea>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能となりサーバに値が送信されること</span>
  <field:textarea
      title="disabled指定なし"
      sample="指定なし"
      name="server.disabled-none">
  </field:textarea>
  <span class="test-case disabled-test">disabled属性がブランクの場合、編集可能となりサーバに値が送信されること</span>
  <field:textarea
      title="disabledブランク"
      name="server.disabled-blank"
      sample="ブランクを指定"
      disabled="">
  </field:textarea>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、サーバに値が送信されないこと（確認画面に表示されないこと）</span>
  <field:textarea
      title="サーバに値は送信されない"
      name="server.disabled-true"
      sample="trueを指定"
      disabled="true">
  </field:textarea>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能となりサーバに値が送信されること</span>
  <field:textarea
      title="サーバに値は送信される"
      name="server.disabled-false"
      sample="falseを指定"
      disabled="false">
  </field:textarea>
</field:block>

<field:block title="id属性">
  <span class="test-case id-test">id属性を指定しない場合、name属性がid属性に設定されること</span>
  <field:textarea
      title="id属性未指定"
      name="server.id-none">
  </field:textarea>

  <span class="test-case id-test">id属性がブランクの場合、name属性がid属性に設定されること</span>
  <field:textarea
      title="id属性ブランク"
      name="server.id-blank"
      id="">
  </field:textarea>

  <span class="test-case id-test">id属性を指定した場合、指定したid属性が設定されること</span>
  <field:textarea
      title="id属性指定"
      id="id-identified"
      name="server.id-identified">
  </field:textarea>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、classは設定されないこと（ソースから確認）</span>
  <field:textarea
      title="cssClass属性未指定"
      name="server.cssClass-none">
  </field:textarea>

  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、classは設定されないこと（ソースから確認）</span>
  <field:textarea
      title="cssClass属性ブランク"
      cssClass=""
      name="server.cssClass-blank">
  </field:textarea>

  <span class="test-case cssClass-test">cssClass属性を指定した値が、classに設定されること</span>
  <field:textarea
      title="cssClass属性指定"
      cssClass="testCss"
      name="server.cssClass">
  </field:textarea>
</field:block>

<field:block title="maxlength属性">
  <span class="test-case maxlength-test">maxlengthを指定しない場合、maxlengthは設定されないこと（ソースから確認）</span>
  <field:textarea
      title="maxlength属性未指定"
      name="server.maxlength-none">
  </field:textarea>

  <span class="test-case maxlength-test">maxlengthにブランクを指定した場合、maxlengthは設定されないこと（ソースから確認）</span>
  <field:textarea
      title="maxlength属性ブランク"
      maxlength=""
      name="server.maxlength-blank">
  </field:textarea>

  <span class="test-case maxlength-test">maxlengthを指定した場合、上限以上の文字数を入力しても画面には表示されずに無視されること</span>
  <field:textarea
      title="maxlength属性指定(5文字)"
      maxlength="5"
      name="server.maxlength">
  </field:textarea>
</field:block>

<field:block title="example属性">
  <span class="test-case example-test">example属性を指定しない場合、プレースホルダとして何も表示されないこと</span>
  <field:textarea
      title="example属性未指定"
      name="server.example-none">
  </field:textarea>

  <span class="test-case example-test">example属性にブランクを指定した場合、プレースホルダとして何も表示されないこと</span>
  <field:textarea
      title="example属性ブランク"
      example=""
      name="server.example-blank">
  </field:textarea>

  <span class="test-case example-test">入力画面では、exampleに指定した値がプレースホルダに設定されること。確認画面では、表示されないこと。</span>
  <field:textarea
      title="example属性指定"
      example="プレースホルダが表示されること"
      name="server.example">
  </field:textarea>
</field:block>

<field:block title="rows属性">
  <span class="test-case rows-test">rows属性を指定しない場合、デフォルトの行数が利用されること</span>
  <field:textarea
      title="rows属性未指定"
      name="server.rows-none">
  </field:textarea>

  <span class="test-case rows-test">rows属性にブランクを指定した場合、デフォルトの行数が利用されること</span>
  <field:textarea
      title="rows属性ブランク"
      rows=""
      name="server.rows-blank">
  </field:textarea>

  <span class="test-case rows-test">rows属性に指定した値が行数となること</span>
  <field:textarea
      title="rows属性指定"
      rows="10"
      name="server.rows">
  </field:textarea>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintは出力されないこと</span>
  <field:textarea
      title="hint属性未指定"
      name="server.hint-none">
  </field:textarea>

  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintは出力されないこと</span>
  <field:textarea
      title="hint属性ブランク"
      hint=""
      name="server.hint-blank">
  </field:textarea>

  <span class="test-case hint-test">入力画面では、hint属性に指定した値が出力されること。確認画面では出力されないこと。</span>
  <field:textarea
      title="hint属性指定"
      hint="このhintが表示されること。"
      name="server.hint">
  </field:textarea>

  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:textarea
      title="目的はhintの位置までタイトルを表示することなので長いタイトル属性を設定する。"
      hint="このhintが表示されること。"
      name="server.hint"
      rows="1">
  </field:textarea>

</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:textarea
      title="sample属性未指定"
      example="sample"
      name="server.sample-none">
  </field:textarea>

  <span class="test-case sample-test">sample属性にブランクを指定した場合、サーバ・クライアント共にサンプル値が出力されないこと</span>
  <field:textarea
      title="sample属性ブランク"
      example="sample"
      sample=""
      name="server.sample-blank">
  </field:textarea>

  <span class="test-case sample-test">sample属性を指定した場合、クライアントではサンプル値が出力されること</span>
  <field:textarea
      title="sample属性指定"
      example="sample"
      sample="このサンプルが出力されること"
      name="server.sample">
  </field:textarea>
</field:block>

<field:block title="size属性">
  <span class="test-case size-test">
    size属性が未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:textarea
      title="size属性指定なし"
      example="sample"
      sample="このサンプルが出力されること"
      name="server.sample">
  </field:textarea>

  <span class="test-case size-test">
    size属性がブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
  </span>
  <field:textarea
      title="size属性ブランク指定"
      example="sample"
      sample="このサンプルが出力されること"
      name="server.sample"
      titleSize=""
      inputSize="">
  </field:textarea>

  <span class="test-case size-test">
    titleSizeとinputSizeをともに指定<br/>

    タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
    入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
  </span>
  <field:textarea
      title="size属性指定"
      example="sample"
      sample="このサンプルが出力されること"
      name="server.sample"
      titleSize="15"
      inputSize="5">
  </field:textarea>

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
