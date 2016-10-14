<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

<n:forInputPage>
  <input type="hidden" name="confirm" />
</n:forInputPage>
<tab:group name="tab">
<c:if test="${not serverMode}">
  <tab:content title="クライアント" value="c">
    <span class="test-case">
      サーバサイドで指定する値を含めて全て設定してもクライアントの動作が問題ないこと
      <table:plain
          title="全属性を設定"
          resultSetName="test"
          sampleResults="10"
          multipleRowLayout="true"
          id="t1">
        <table:row>
          <column:radio key="key"
              title="ラジオボタン"
              name="name"
              cssClass="red-line"
              rowspan="2"
              disabled="false"
              readonly="false"
              value="12345"
              width="250px"
              dataFrom="画面"
              initialValueDesc="特になし"
              comment="ラジオボタン">
          </column:radio>
          <column:label key="" title="あ" sample="サンプル１">
          </column:label>
        </table:row>
        <table:row>
          <column:label key="" title="い" sample="サンプル２">
          </column:label>
        </table:row>
        <table:row>
          <column:radio key="key"
              title="ラジオボタン"
              name="name"
              cssClass="red-line"
              colspan="2"
              disabled="false"
              readonly="false"
              value="12345"
              width="250px"
              dataFrom="画面"
              initialValueDesc="特になし"
              comment="ラジオボタン">
          </column:radio>
        </table:row>
      </table:plain>
    </span>
  </tab:content>
</c:if>

<tab:content title="サーバ・クライアント共通" value="cs" selected="true">
<span class="test-case 必須属性指定">
  必須属性を指定した場合
</span>

<table:plain
    title="必須属性指定"
    resultSetName="result"
    sampleResults="2"
    id="t2">
  <column:radio
      key="id"
      title="必須属性をした場合のタイトル"
      name="req1">
  </column:radio>
  <column:label
      key="id"
      title="ID"
      sample="1001|1002">
  </column:label>
</table:plain>

<span class="test-case cssClass属性未指定">
  cssClassを指定しない場合、th及びtdにはclass属性が設定されないこと
</span>

<table:plain
    title="cssClass未指定"
    resultSetName="result"
    sampleResults="2"
    id="t3">
  <column:radio key="id" title="選択" name="cssClass1"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case cssClass属性ブランク">
  cssClassにブランクを指定した場合、th及びtdにはclass属性が設定されないこと
</span>
<table:plain
    title="cssClassブランク"
    resultSetName="result"
    sampleResults="3"
    id="t4">
  <column:radio
      key="id"
      title="選択"
      name="cssClass2"
      cssClass=""
      ></column:radio>
  <column:label key="id" title="ID" sample="1|2|3">
  </column:label>
</table:plain>

<span class="test-case cssClass属性指定">
  cssClassを指定した場合、その値がth及びtdのclass属性に設定されること
</span>
<table:plain
    title="cssClass指定"
    resultSetName="result"
    sampleResults="3"
    id="t5">
  <column:radio
      key="id"
      title="選択"
      name="cssClass3"
      cssClass="red-line"
      ></column:radio>
  <column:label key="id" title="ID" sample="1">
  </column:label>
</table:plain>

<span class="test-case disable未指定">
  disable属性を指定しない場合、操作可能な状態であること
</span>
<table:plain
    title="disable未指定"
    resultSetName="result"
    sampleResults="2"
    id="t6">
  <column:radio key="id" title="選択" name="disabled1"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case disableブランク">
  disable属性にブランクを設定した場合、操作可能な状態であること
</span>
<table:plain
    title="disableブランク"
    resultSetName="result"
    sampleResults="3"
    id="t7">
  <column:radio key="id" title="選択" name="disabled2" disabled=""></column:radio>
  <column:label key="id" title="ID" sample="1|2"></column:label>
</table:plain>

<span class="test-case disable_false">
  disable属性にfalseを設定した場合、操作可能な状態であること
</span>
<table:plain
    title="disableにfalse"
    resultSetName="result"
    sampleResults="3"
    id="t8">
  <column:radio key="id" title="選択" name="disabled3" disabled="false"></column:radio>
  <column:label key="id" title="ID" sample="1|2"></column:label>
</table:plain>

<span class="test-case disable_true">
  disable属性にtrueを設定した場合、操作不可能であること
</span>
<table:plain
    title="disableにtrue"
    resultSetName="result"
    sampleResults="4"
    id="t9">
  <column:radio key="id" title="選択" name="disabled4" disabled="true"></column:radio>
  <column:label key="id" title="ID" sample="1|2"></column:label>
</table:plain>

<span class="test-case readonly未指定">
  readonly属性を指定しない場合、操作可能な状態であること
</span>
<table:plain
    title="readonly未指定"
    resultSetName="result"
    sampleResults="2"
    id="t10">
  <column:radio key="id" title="選択" name="readonly1"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case readonlyブランク">
  readonly属性がブランクの場合、操作可能な状態であること
</span>
<table:plain
    title="readonlyブランク"
    resultSetName="result"
    sampleResults="3"
    id="t11">
  <column:radio key="id" title="選択" name="readonly2" readonly=""></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case readonly_false">
  readonly属性がfalseの場合、操作可能な状態であること
</span>
<table:plain
    title="readonlyにfalse"
    resultSetName="result"
    sampleResults="3"
    id="t12">
  <column:radio key="id" title="選択" name="readonly3" readonly="false"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case readonly_true">
  readonly属性がtrueの場合、操作不可能であること。ただし、値はサーバに送信されること。
</span>
<table:plain
    title="readonlyにtrue"
    resultSetName="result"
    sampleResults="3"
    id="t13">
  <column:radio key="id" title="選択" name="readonly4" readonly="true"></column:radio>
  <column:label key="id" title="ID" sample="1001|1003"></column:label>
</table:plain>

<span class="test-case width未指定">
  width属性を指定しない場合、style属性にwidthが設定されないこと
</span>
<table:plain
    title="width未指定"
    resultSetName="result"
    sampleResults="2"
    id="t14">
  <column:radio key="id" title="選択" name="width1"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case widthブランク">
  width属性にブランクを指定した場合、style属性にwidthが設定されないこと
</span>
<table:plain
    title="widthブランク"
    resultSetName="result"
    sampleResults="3"
    id="t15">
  <column:radio key="id" title="選択" name="width2" width=""></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case width指定">
  width属性にブランクを指定した場合、style属性にwidthが設定されないこと
</span>
<table:plain
    title="width指定"
    resultSetName="result"
    sampleResults="3"
    id="t16">
  <column:radio key="id" title="選択" name="width3" width="123px"></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case value未指定">
  value属性を未指定の場合、resultSet内の対象カラムの値がvalue値に設定されること
</span>
<table:plain
    title="value未指定"
    resultSetName="result"
    sampleResults="3"
    id="t17">
  <column:radio key="id" title="選択" name="value1"></column:radio>
  <column:label key="id" title="ID" sample="1|2"></column:label>
</table:plain>

<span class="test-case valueブランク">
  value属性にブランクを設定した場合、resultSet内の対象カラムの値がvalue値に設定されること
</span>
<table:plain
    title="valueブランク"
    resultSetName="result"
    sampleResults="3"
    id="t18">
  <column:radio key="id" title="選択" name="value2" value=""></column:radio>
  <column:label key="id" title="ID" sample="2"></column:label>
</table:plain>

<span class="test-case value指定">
  value属性を指定した場合、その値がvalue値となること
</span>
<table:plain
    title="value指定"
    resultSetName="result"
    sampleResults="3"
    id="t19">
  <column:radio key="id" title="選択" name="value3" value="abcdefg"></column:radio>
  <column:label key="id" title="ID" sample="3"></column:label>
</table:plain>

<span class="test-case colspan未指定">
  colspan属性を指定しない場合、colspanはブランクとなること
</span>
<table:plain
    title="colspan未指定"
    resultSetName="result"
    sampleResults="3"
    id="t20">
  <column:radio key="id" title="選択" name="colspan1"></column:radio>
  <column:label key="id" title="ID" sample="3"></column:label>
</table:plain>

<span class="test-case colspanブランク">
  colspan属性にブランクを指定した場合、colspanはブランクとなること
</span>
<table:plain
    title="colspanブランク"
    resultSetName="result"
    sampleResults="3"
    id="t21">
  <column:radio key="id" title="選択" name="colspan2" colspan=""></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case colspan指定">
  colspan属性を指定した場合、その値がcolspanに設定されること
</span>
<table:plain
    title="colspan指定"
    resultSetName="result"
    sampleResults="3"
    id="t22">
  <column:radio key="id" title="選択" name="colspan3" colspan="123"></column:radio>
  <column:label key="id" title="ID" sample="3"></column:label>
</table:plain>

<span class="test-case rowspan未指定">
  rowspanを未指定の場合、rowspan属性はブランクとなること
</span>
<table:plain
    title="rowspan未指定"
    resultSetName="result"
    sampleResults="3"
    id="t23">
  <column:radio key="id" title="選択" name="rowspan1"></column:radio>
  <column:label key="id" title="ID" sample="1|2"></column:label>
</table:plain>

<span class="test-case rowspanブランク">
  rowspanを未指定の場合、rowspan属性はブランクとなること
</span>
<table:plain
    title="rowspanブランク"
    resultSetName="result"
    sampleResults="2"
    id="t24">
  <column:radio key="id" title="選択" name="rowspan2" rowspan=""></column:radio>
  <column:label key="id" title="ID" sample="1"></column:label>
</table:plain>

<span class="test-case rowspan指定">
  rowspanを指定した場合、rowspanにはその値が設定されること
</span>
<table:plain
    title="rowspan指定"
    resultSetName="result"
    sampleResults="3"
    multipleRowLayout="true"
    id="t25">
  <table:row>
    <column:radio key="id" title="選択" name="rowspan3" rowspan="2"></column:radio>
    <column:label key="id" title="IDその１" sample="1"></column:label>
  </table:row>
  <table:row>
    <column:label key="id" title="IDその２" sample="2"></column:label>
  </table:row>
</table:plain>

</tab:content>

</tab:group>
<c:if test="${serverMode}">
<button:block>
  <n:forInputPage>
    <button:check
        uri="カラムウィジェット_ラジオ_テストページ（確認）.jsp"
        dummyUri="カラムウィジェット_ラジオ_テストページ（確認）.jsp">
    </button:check>
  </n:forInputPage>
  <n:forConfirmationPage>
    <button:back
        uri="カラムウィジェット_ラジオ_テストケース.jsp"
        dummyUri="カラムウィジェット_ラジオ_テストケース.jsp">
    </button:back>
  </n:forConfirmationPage>
</button:block>
</c:if>
</n:form>
