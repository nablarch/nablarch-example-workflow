<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ page import="nablarch.core.db.support.ListSearchInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form>
    <tab:group name="base">
    <tab:content title="テスト" selected="true" value="test">
      <span class="test-case require-test">複数行レイアウトの必須属性のみを指定</span>
      <table:plain
            title="必須属性を指定"
            resultSetName="result"
            sampleResults="6"
            id="t1"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox name="checkbox" title="選択" key="id"></column:checkbox>
          <column:code codeId="code1" key="code" title="コード" sample="val1|val2|val3"></column:code>
          <column:label key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}"  sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:radio name="radio" title="単一" key="number"></column:radio>
          <column:link uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" value="確認画面"></column:link>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-blank-test">rowspanにblankを指定</span>
      <table:plain
            title="rowspanをblankに設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_blank"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     rowspan="" name="checkbox" title="選択"></column:checkbox>
          <column:code     key="code"   rowspan="" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date"   rowspan="" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:radio    key="number" rowspan="" name="radio" title="単一" ></column:radio>
          <column:link    value="確認画面" rowspan=""  uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" ></column:link>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-set-one-test">rowspanに1を指定</span>
      <table:plain
            title="rowspanを1に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_set_one"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     rowspan="1" name="checkbox" title="選択"></column:checkbox>
          <column:code     key="code"   rowspan="1" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
          <column:label    key="date"   rowspan="1" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:radio    key="number" rowspan="1" name="radio" title="単一" ></column:radio>
          <column:link    value="確認画面" rowspan="1"  uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" ></column:link>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-checkbox-test">column:checkbox rowspanに2を指定</span>
      <table:plain
            title="checkbox.rowspanを2に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_checkbox"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id" rowspan="2" name="checkbox" title="選択"></column:checkbox>
          <column:code     key="code" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
         </table:row>
        <table:row>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-code-test">column:code rowspanに2を指定</span>
      <table:plain
            title="code.rowspanを2に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_code"
            multipleRowLayout="true">
        <table:row>
          <column:code     key="code" rowspan="2"  codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
          <column:code     key="code" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
         </table:row>
        <table:row>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-radio-test">column:radio rowspanに2を指定</span>
      <table:plain
            title="radio.rowspanを2に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_radio"
            multipleRowLayout="true">
        <table:row>
          <column:radio    key="number" rowspan="2" name="radio" title="単一" ></column:radio>
          <column:code     key="code" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
         </table:row>
        <table:row>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-label-test">column:label rowspanに2を指定</span>
      <table:plain
            title="label.rowspanを2に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_label"
            multipleRowLayout="true">
        <table:row>
          <column:label    key="number" rowspan="2" title="数字" ></column:label>
          <column:code     key="code" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
         </table:row>
        <table:row>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case rowspan-link-test">column:link rowspanに2を指定</span>
      <table:plain
            title="link.rowspanを2に設定"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_link"
            multipleRowLayout="true">
        <table:row>
          <column:link   value="確認"  rowspan="2" title="リンク:2" uri="./サーバークライアント共通_テストケース(確認).jsp" dummyUri="./サーバークライアント共通_テストケース(確認).jsp"></column:link>
          <column:code   key="code" codeId="code1" title="コード"  sample="val1|val2|val3"></column:code>
         </table:row>
        <table:row>
          <column:label  key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case colspan-blank-test">colspanにblankを指定</span>
      <table:plain
            title="colspanをblankに設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_blank"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     colspan="" name="checkbox" title="選択"></column:checkbox>
          <column:code     key="code"   colspan="" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date"   colspan="" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:radio    key="number" colspan="" name="radio" title="単一" ></column:radio>
          <column:link    value="確認画面" colspan=""  uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" ></column:link>
        </table:row>
      </table:plain>

      <span class="test-case colspan-set-one-test">colspanに1を指定</span>
      <table:plain
            title="colspanに1を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_set_one"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     colspan="1" name="checkbox" title="選択"></column:checkbox>
          <column:code     key="code"   colspan="1" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date"   colspan="1" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:radio    key="number" colspan="1" name="radio" title="単一" ></column:radio>
          <column:link    value="確認画面" colspan="1"  uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" ></column:link>
        </table:row>
      </table:plain>

      <span class="test-case colspan-checkbox-test">column:checkbox colspanに2を指定</span>
      <table:plain
            title="checkbox.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_checkbox"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     colspan="2" name="checkbox" title="選択"></column:checkbox>
        </table:row>
        <table:row>
          <column:code     key="code"  codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date"  title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case colspan-code-test">column:code colspanに2を指定</span>
      <table:plain
            title="code.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_code"
            multipleRowLayout="true">
        <table:row>
          <column:code     key="code"   colspan="2" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
        </table:row>
        <table:row>
          <column:checkbox key="id"     name="checkbox" title="選択"></column:checkbox>
          <column:label    key="date"   title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case colspan-radio-test">column:radio colspanに2を指定</span>
      <table:plain
            title="radio.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_radio"
            multipleRowLayout="true">
        <table:row>
          <column:radio key="number" colspan="2"  name="radio" title="単一" ></column:radio>
        </table:row>
        <table:row>
          <column:code     key="code" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case colspan-radio-test">column:radio colspanに2を指定</span>
      <table:plain
            title="radio.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_radio"
            multipleRowLayout="true">
        <table:row>
          <column:radio key="number" colspan="2"  name="radio" title="単一" ></column:radio>
        </table:row>
        <table:row>
          <column:code     key="code" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label    key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>

      <span class="test-case colspan-label-test">column:label colspanに2を指定</span>
      <table:plain
            title="label.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_label"
            multipleRowLayout="true">
        <table:row>
          <column:label key="date" title="日付" colspan="2" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
        <table:row>
          <column:code  key="code" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:link uri="./サーバークライアント共通_テストケース(確認).jsp" title="リンク" value="確認画面"></column:link>
        </table:row>
      </table:plain>

      <span class="test-case colspan-link-test">column:link colspanに2を指定</span>
      <table:plain
            title="link.colspanに2を設定"
            resultSetName="result"
            sampleResults="6"
            id="colspan_link"
            multipleRowLayout="true">
        <table:row>
          <column:link uri="./サーバークライアント共通_テストケース(確認).jsp" colspan="2"  title="リンク" value="確認画面"></column:link>
        </table:row>
        <table:row>
          <column:code  key="code" codeId="code1" title="コード" sample="val1|val2|val3"></column:code>
          <column:label key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}" sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
        </table:row>
      </table:plain>



     </tab:content>
     <tab:content value="sample" title="サンプル">
      <table:plain
            title="組み合わせてみる。(テストコードないです。)"
            resultSetName="result"
            sampleResults="6"
            id="rowspan_multi"
            multipleRowLayout="true">
        <table:row>
          <column:checkbox key="id"     rowspan="4"  title="チェックボックス:row=4" name="checkbox"></column:checkbox>
          <column:label    key="number" title="数字" sample="1|2|3"></column:label>
          <column:label    key="date_1" value="${row.date}" title="date/区切り" valueFormat="yyyymmdd{yyyy/MM/dd}"  sample="2014/12/23|2014/12/24|2014/12/25"></column:label>
          <column:label    key="name"   title="名前" ></column:label>
        </table:row>
        <table:row>
          <column:code     key="code" rowspan="3" title="コード:row=3" codeId="code1" sample="val1|val2|val3"></column:code>
          <column:label    key="mail" title="メール:col=2" colspan="2"  sample="aaaaa@mail.com|bbbbb@mail.com|ccccc@mail.com"></column:label>
        </table:row>
        <table:row>
          <column:link   value="確認"  rowspan="2" title="リンク:row=2" uri="./サーバークライアント共通_テストケース(確認).jsp" dummyUri="./サーバークライアント共通_テストケース(確認).jsp"></column:link>
          <column:label    key="date_3" value="dummy" title="ダミー"></column:label>
        </table:row>
        <table:row>
          <column:label    key="number" title="数字" sample="1111|22222|333333"></column:label>
        </table:row>
      </table:plain>
    </tab:content>
    </tab:group>
    <n:forConfirmationPage>
       <link:submit label="入力画面へ" uri="./サーバークライアント共通_テストケース.jsp" dummyUri="./サーバークライアント共通_テストケース.jsp"></link:submit>
     </n:forConfirmationPage>
     <n:forInputPage>
       <link:submit label="確認画面へ" uri="./サーバークライアント共通_テストケース(確認).jsp" dummyUri="./サーバークライアント共通_テストケース(確認).jsp"></link:submit>
     </n:forInputPage>

    </n:form>
