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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form>
    <tab:group name="tab">

    <c:if test="${not serverMode}">
      <tab:content title="クライアント" value="c">
        <span class="test-case">
          必須属性を全て指定した場合、クライアント上でリンクが正しく表示され、ページ遷移ができること<br />
          ※sample属性はブランクなので、codeIdに対応するサンプル値が表示される。
        </span>
        <table:plain
            title="必須属性を指定"
            resultSetName="result"
            sampleResults="2"
            id="t1">
          <column:code
              key=""
              title="年号"
              sample=""
              codeId="code1">
          </column:code>
        </table:plain>

        <span class="test-case">
          sample属性を指定した場合、その値がクライアント上で表示されること
        </span>
        <table:plain
            title="必須属性を指定"
            resultSetName="result"
            sampleResults="2"
            id="t2">
          <column:code
              key=""
              title="年号"
              sample="サンプル１|サンプル２|サンプル３"
              codeId="code1">
          </column:code>
        </table:plain>

        <span class="test-case">
          全属性を指定（サーバサイドで使用する属性も指定）した場合でもクライアントの動作に問題がないこと
        </span>
        <table:search_result
            title="全属性を指定"
            resultSetName="require"
            sampleResults="3"
            listSearchInfoName="listSearchInfo"
            id="t3">
          <column:code
              key="code"
              title="年号"
              codeId="code1"
              cssClass="border-red"
              labelPattern="$NAME$($VALUE$)"
              optionColumnName="OPTION02"
              sample="サンプル１|サンプル２"
              pattern="PATTERN01"
              listFormat="br"
              dataFrom="テーブル名.カラム名"
              comment="備考">
          </column:code>
        </table:search_result>
        <span class="test-case">
          samplePattern属性を指定した場合に複数のデータが1レコードに出力することを確認する。
        </span>
        <table:plain
            title="samplePattern属性の確認"
            resultSetName="result"
            sampleResults="4"
            id="samplePattern1">
          <column:code
              key=""
              title="媒体"
              samplePattern="1,3"
              listFormat="ul"
              sample=""
              codeId="code1">
          </column:code>
        </table:plain>

      </tab:content>
    </c:if>

    <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
      <span class="test-case cssClass-test">
        cssClassを指定しない場合、タイトル及び各列の要素にclass属性が設定されないこと
      </span>
      <table:plain
          title="cssClass未指定"
          resultSetName="result"
          sampleResults="3"
          id="t4">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassにブランクを指定した場合、タイトル及び各列の要素にclass属性が設定されないこと
      </span>
      <table:plain
          title="cssClassブランク"
          resultSetName="result"
          sampleResults="3"
          id="t5">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            cssClass=""
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassを指定した場合、タイトル及び各列の要素にclass属性が設定されること
      </span>
      <table:plain
          title="cssClass指定"
          resultSetName="result"
          sampleResults="3"
          id="t6">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            cssClass="border-red"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

      <span class="test-case sortable-test">
        sortableを指定しない場合、タイトル部がソート用リンクとならないこと
      </span>
      <table:search_result
          title="sortable未指定"
          resultSetName="result"
          sampleResults="3"
          listSearchInfoName="listSearchInfo"
          id="t7">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにブランクを指定した場合、タイトル部がソート用リンクとならないこと
      </span>
      <table:search_result
          title="sortableブランク"
          resultSetName="result"
          sampleResults="3"
          listSearchInfoName="listSearchInfo"
          id="t8">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1"
            sortable="">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにfalseを指定した場合、タイトル部がソート用リンクとならないこと
      </span>
      <table:search_result
          title="sortable[false]"
          resultSetName="result"
          sampleResults="3"
          listSearchInfoName="listSearchInfo"
          id="t9">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1"
            sortable="false">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにtrueを指定した場合、タイトル部がソート用リンクとなること
      </span>
      <table:search_result
          title="sortable[true]"
          resultSetName="result"
          searchUri="./カラムウィジェット_コード.jsp"
          sampleResults="3"
          listSearchInfoName="listSearchInfo"
          id="t10">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1"
            sortable="true">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:search_result>

      <span class="test-case width-test">
        widthを指定しなかった場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t11">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>
      <span class="test-case width-test">
        widthをblankにした場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t12">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1"
            width="">
        </column:code>
        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

      <span class="test-case width-test">
        widthを指定した場合、style属性にwidthが指定されること。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t13">
        <column:code
            key="code"
            title="コード"
            listFormat="br"
            codeId="code1"
            width="100px">
        </column:code>
        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1"
            width="30%">
        </column:code>
      </table:plain>
    <span class="test-case listFormat-test">
      listFormatが未指定の場合、デフォルトのsp区切りでフォーマットされること
    </span>
    <table:plain
        title="listFormat未指定"
        resultSetName="result"
        sampleResults="3"
        id="t29">
      <column:code
          key="code"
          title="コード"
          samplePattern="1,2,1"
          codeId="code1">
      </column:code>

      <column:code
          key="code"
          title="コード値"
          labelPattern="$VALUE$"
          codeId="code1">
      </column:code>
    </table:plain>

    <span class="test-case listFormat-test">
      listFormatにブランクを指定した場合、デフォルトのsp区切りでフォーマットされること<br/>
    </span>
    <table:plain
      title="listFormatブランク"
      sampleResults="3"
      resultSetName="result"
      id="t30">
      <column:code
        key="code"
        title="コード"
        listFormat=""
        samplePattern="1,2,1"
        codeId="code1">
      </column:code>

      <column:code
        key="code"
        title="コード値"
        labelPattern="$VALUE$"
        codeId="code1">
      </column:code>
    </table:plain>

    <span class="test-case listFormat-test">
      listFormatにデフォルト値のspを指定した場合、sp区切りでフォーマットされること<br/>
    </span>
    <table:plain
        title="listFormatにデフォルト値指定"
        sampleResults="3"
        resultSetName="result"
        id="t31">
      <column:code
          key="code"
          title="コード"
          listFormat="sp"
          samplePattern="1,2,1"
          codeId="code1">
      </column:code>

      <column:code
          key="code"
          title="コード値"
          labelPattern="$VALUE$"
          codeId="code1">
      </column:code>
    </table:plain>

    <span class="test-case listFormat-test">
      listFormatにデフォルト値以外の値（br）を指定した場合、brでフォーマットされること
    </span>
    <table:plain
        title="listFormatにデフォルト値以外指定"
        sampleResults="3"
        resultSetName="result"
        id="t32">
      <column:code
          key="code"
          title="コード"
          listFormat="br"
          samplePattern="1,2,1"
          codeId="code1">
      </column:code>

      <column:code
          key="code"
          title="コード値"
          labelPattern="$VALUE$"
          codeId="code1">
      </column:code>
    </table:plain>
    <span class="test-case additional-test">additional属性が未指定の場合、narrow表示で付加情報用の制御が出ないこと。</span>
    <table:plain title="指定がない場合narrowでは状態が変わらないこと" resultSetName="result" id="no-additional">
       <column:label key="label" title="見出し" value="表示用のラベル" sample="表示用のラベル"></column:label>
       <column:code codeId="code1" key="code" title="未指定" sample="重要1|重要2|重要3|重要4" ></column:code>
    </table:plain>

    <span class="test-case additional-test">additional属性がブランクの場合、narrow表示で付加情報用の制御が出ないこと。</span>
    <table:plain title="blankの場合narrowでは状態が変わらないこと" resultSetName="result" id="blank-additional">
       <column:label key="label" title="見出し" value="表示用のラベル" sample="表示用のラベル"></column:label>
       <column:code codeId="code1" key="code" title="ブランク" additional="" sample="重要1|重要2|重要3|重要4" ></column:code>
    </table:plain>

    <span class="test-case additional-test">additional属性がfalseの場合、narrow表示で付加情報用の制御が出ないこと。</span>
    <table:plain title="falseの場合narrowでは状態が変わらないこと" resultSetName="result" id="false-additional">
       <column:label key="label" title="見出し" value="表示用のラベル" sample="表示用のラベル"></column:label>
       <column:code codeId="code1" key="code" title="false" additional="false" sample="重要1|重要2|重要3|重要4" ></column:code>
    </table:plain>
    <span class="test-case additional-test">additional属性がtrueの場合、narrow表示で付加情報用の制御が有効になること。</span>
    <table:plain title="trueのnarrowで状態が変わること" resultSetName="result" id="true-additional" sampleResults="4">
       <column:label key="label"  sample="表示用のラベル" title="見出し" value="表示用のラベル"></column:label>
       <column:code codeId="code1" sample="追加1-1|追加1-2" key="code" title="true"  additional="true"></column:code>
    </table:plain>

    <span class="test-case additional-test">複数の行で true を指定した場合指定行が付加情報となること。</span>
    <table:plain
        title="複数のカラムにadditonal属性を指定"
        resultSetName="result"
        sampleResults="3"
        id="t-additional">
      <column:code
          key="code"
          title="コード名"
          labelPattern="$NAME$"
          sample="コード1|コード2|コード3"
          codeId="code1">
      </column:code>
      <column:code
          key="code"
          title="コード値(additional属性)"
          labelPattern="$VALUE$"
          codeId="code1"
          sample="値1|値2|値3"
          additional="true">
      </column:code>
      <column:code
          key="code"
          title="オプション(additional項目)"
          labelPattern="オプション：$OPTIONALNAME$($VALUE$) - $NAME$"
          codeId="code1"
          sample="オプション: opt1 - コード1|オプション: opt2 - コード2|オプション: opt3 - コード3"
          additional="true">
      </column:code>
    </table:plain>

    <span class="test-case pattern-test">
      patternを指定しない場合、PATTERN01の値が表示されること
    </span>
      <table:plain
          title="pattern未指定"
          resultSetName="result"
          sampleResults="3"
          id="t15">
        <column:code
            key="code"
            title="コード"
            samplePattern="3,3,3"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      patternにブランクを指定した場合、PATTERN01の値が表示されること
    </span>
      <table:plain
          title="patternブランク"
          resultSetName="result"
          sampleResults="3"
          id="t16">
        <column:code
            key="code"
            title="コード"
            pattern=""
            samplePattern="3,3,3"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      patternにPATTERN01（デフォルト値）を指定した場合、そのパターンの値が表示されること
    </span>
      <table:plain
          title="pattern指定（デフォルト値）"
          resultSetName="result"
          sampleResults="3"
          id="t17">
        <column:code
            key="code"
            title="コード"
            pattern="PATTERN01"
            samplePattern="3,3,3"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      patternにPATTERN02（デフォルト値以外）を指定した場合、そのパターンの値が表示されること
    </span>
      <table:plain
          title="pattern指定（デフォルト値以外）"
          resultSetName="result"
          sampleResults="3"
          id="t18">
        <column:code
            key="code"
            title="コード"
            pattern="PATTERN02"
            samplePattern="3,3,3"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            pattern="PATTERN02"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      optionColumnNameを指定しない場合、デフォルトのOPTION01の値が表示されること。<br />
      labelPatternに$OPTIONALNAME$を指定して確認
    </span>
      <table:plain
          title="optionColumnName名未指定"
          resultSetName="result"
          sampleResults="3"
          id="t19">
        <column:code
            key="code"
            title="コード"
            labelPattern="$OPTIONALNAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      optionColumnNameにブランクを指定した場合、デフォルトのOPTION01の値が表示されること。<br />
      labelPatternに$OPTIONALNAME$を指定して確認<br />

    </span>
      <table:plain
          title="optionColumnNameにブランク"
          resultSetName="result"
          sampleResults="3"
          id="t20">
        <column:code
            key="code"
            title="コード"
            optionColumnName=""
            labelPattern="$OPTIONALNAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      optionColumnNameにデフォルト値の「OPTION01」を指定した場合、デフォルトのOPTION01の値が表示されること<br />
      labelPatternに$OPTIONALNAME$を指定して確認
    </span>
      <table:plain
          title="optionColumnNameにデフォルトを指定"
          resultSetName="result"
          sampleResults="3"
          id="t21">
        <column:code
            key="code"
            title="コード"
            optionColumnName="OPTION01"
            labelPattern="$OPTIONALNAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      optionColumnNameにデフォルト値以外の値を指定した場合、そのオプションの値が表示されること<br />
      labelPatternに$OPTIONALNAME$を指定して確認
    </span>
      <table:plain
          title="optionColumnNameにデフォルト以外を指定"
          resultSetName="result"
          sampleResults="3"
          id="t22">
        <column:code
            key="code"
            title="コード"
            optionColumnName="OPTION03"
            labelPattern="$OPTIONALNAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternを指定しない場合、デフォルトの$NAME$の値が表示されること。
    </span>
      <table:plain
          title="labelPattern未指定"
          resultSetName="result"
          sampleResults="3"
          id="t23">
        <column:code
            key="code"
            title="コード"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternにブランクを指定した場合、デフォルトの$NAME$の値が表示されること。
    </span>
      <table:plain
          title="labelPatternブランク"
          resultSetName="result"
          sampleResults="3"
          id="t24">
        <column:code
            key="code"
            title="コード"
            labelPattern=""
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternにブランクを指定した場合、デフォルトの$NAME$の値が表示されること。
    </span>
      <table:plain
          title="labelPatternブランク"
          resultSetName="result"
          sampleResults="3"
          id="t25">
        <column:code
            key="code"
            title="コード"
            labelPattern=""
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternにデフォルト値の「$NAME$」を指定した場合、$NAME$の値が表示されること。
    </span>
      <table:plain
          title="labelPatternにデフォルト値を指定"
          resultSetName="result"
          sampleResults="3"
          id="t26">
        <column:code
            key="code"
            title="コード"
            labelPattern="$NAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternにデフォルト値以外の値（$SHORTNAME$）、$SHORTNAME$の値が表示されること。
    </span>
      <table:plain
          title="labelPatternにデフォルト値以外を指定"
          resultSetName="result"
          sampleResults="3"
          id="t27">
        <column:code
            key="code"
            title="コード"
            labelPattern="$SHORTNAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>

    <span class="test-case">
      labelPatternに複数のパターン文字列を指定した場合、そのとおりに編集され出力されること
    </span>
      <table:plain
          title="labelPatternに複数のパターンを指定"
          resultSetName="result"
          sampleResults="3"
          id="t28">
        <column:code
            key="code"
            title="コード"
            labelPattern="オプション：$OPTIONALNAME$($VALUE$) - $NAME$"
            codeId="code1">
        </column:code>

        <column:code
            key="code"
            title="コード値"
            labelPattern="$VALUE$"
            codeId="code1">
        </column:code>
      </table:plain>
    </tab:content>
    <tab:content title="サーバ" value="s">
    <span class="test-case require_only-test">
      必須属性を指定した場合、列タイトル及び列の値が出力されること<br />
      ※値が出力されたことを確認するためkey属性も指定する。
    </span>
    <table:plain
        title="必須属性（全てのカラムウィジェットを纏めて実施）"
        resultSetName="result"
        id="t14">
      <column:code
          key="code"
          title="コード"
          codeId="code1">
      </column:code>

      <column:code
          key="code"
          title="コード値"
          labelPattern="$VALUE$"
          codeId="code1">
      </column:code>
    </table:plain>
    </tab:content>
    </tab:group>
    </n:form>

