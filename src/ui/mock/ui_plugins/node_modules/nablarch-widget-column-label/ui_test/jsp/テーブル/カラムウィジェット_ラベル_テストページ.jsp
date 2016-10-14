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
          必須属性を全て指定した場合、サンプル値が出力されること
        </span>
        <table:plain
            title="cssClass未指定"
            resultSetName="result"
            sampleResults="3"
            id="t1">
          <column:label
              key="mail"
              title="メールアドレス"
              sample="a@a.com|b@b.com">
          </column:label>
          <column:label
              key="date"
              title="日付"
              sample="2013/01/02|2013/01/03">
          </column:label>
        </table:plain>

        <span class="test-case">
          サーバサイドで指定する値を全て設定してもクライアントの動作が問題ないこと
        </span>
        <table:plain
            title="全要素指定"
            resultSetName="result"
            sampleResults="3"
            id="t2">
          <column:label
              key="mail"
              title="メールアドレス"
              sample="a@a.com|b@b.com"
              value="hoge@hoge.com"
              cssClass="fuga"
              sortable="false"
              valueFormat="yyyymmdd{yyyy}"
              dataFrom="テーブル名.カラム名"
              formatSpec="編集仕様"
              comment="備考">
          </column:label>
          <column:label
              key="date"
              title="日付"
              value="2013/10/15"
              sample="2013/01/01|2013/01/02"
              cssClass="fuga"
              sortable="false"
              valueFormat="yyyymmdd{yyyy/MM/dd}">
          </column:label>
        </table:plain>
      </tab:content>
    </c:if>

    <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
      <span class="test-case cssClass-test">
        cssClassを指定しない場合、該当列のth及びtdにはclass属性が設定されないこと
      </span>
      <table:plain
          title="cssClass未指定"
          resultSetName="result"
          sampleResults="2"
          id="t3">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01">
        </column:label>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassにブランクを指定した場合、該当列のth及びtdにはclass属性が設定されないこと
      </span>
      <table:plain
          title="cssClassをブランク"
          resultSetName="result"
          sampleResults="2"
          id="t4">
        <column:label
            key="mail"
            title="メールアドレス"
            cssClass=""
            sample="a@a.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            cssClass=""
            sample="2013/01/01">
        </column:label>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassを指定した場合、該当列のth及びtdにはclass属性が設定されること
      </span>
      <table:plain
          title="cssClassを指定"
          resultSetName="result"
          sampleResults="3"
          id="t5">
        <column:label
            key="mail"
            title="メールアドレス"
            cssClass="font-red"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            cssClass="font-blue"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:plain>

      <span class="test-case sortable-test">
        sortableを指定しない場合、タイトルはソート用のリンクにならないこと
      </span>
      <table:search_result
          title="sortable未指定"
          resultSetName="result"
          listSearchInfoName="listSearchInfo"
          sampleResults="3"
          id="t6">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにブランクを指定した場合、タイトルはソート用のリンクにならないこと
      </span>
      <table:search_result
          title="sortableブランク"
          resultSetName="result"
          listSearchInfoName="listSearchInfo"
          sampleResults="4"
          id="t7">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com"
            sortable="">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2012/01/01|2013/01/02">
        </column:label>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにfalseを指定した場合、タイトルはソート用のリンクにならないこと
      </span>
      <table:search_result
          title="sortable[false]"
          resultSetName="result"
          listSearchInfoName="listSearchInfo"
          sampleResults="4"
          id="t8">
        <column:label
            key="mail"
            title="メールアドレス"
            sortable="false"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/01/02">
        </column:label>
      </table:search_result>

      <span class="test-case sortable-test">
        sortableにtrueを指定した場合、タイトルはソート用のリンクになること
      </span>
      <table:search_result
          title="sortable[true]"
          resultSetName="result"
          searchUri="./カラムウィジェット_ラベル.jsp"
          listSearchInfoName="listSearchInfo"
          sampleResults="2"
          id="t9">
        <column:label
            key="mail"
            title="メールアドレス"
            sortable="true"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:search_result>

      <span class="test-case domain-test">
        domainに指定した値が、class属性に出力されること
      </span>
      <table:search_result
          title="domain属性指定"
          resultSetName="result"
          searchUri="./カラムウィジェット_ラベル.jsp"
          listSearchInfoName="listSearchInfo"
          sampleResults="2"
          id="t10">
        <column:label
            key="mail"
            title="メールアドレス"
            domain="mail"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            domain="date"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:search_result>

      <span class="test-case domain-test">
        domainとcssClassを指定すると、両方の値がclass属性に出力されること
      </span>
      <table:search_result
          title="domain属性、cssClass属性指定"
          resultSetName="result"
          searchUri="./カラムウィジェット_ラベル.jsp"
          listSearchInfoName="listSearchInfo"
          sampleResults="2"
          id="t11">
        <column:label
            key="mail"
            title="メールアドレス"
            cssClass="font-red"
            domain="mail"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            cssClass="font-blue"
            domain="date"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:search_result>
      <span class="test-case domain-test">
        domainとcssClassを指定すると、両方の値がclass属性に出力されること
      </span>
      <span class="test-case width-test">
        widthを指定しなかった場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t12">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:plain>
      <span class="test-case width-test">
        widthをblankにした場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t13">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com"
            width="">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02"
            width="">
        </column:label>
      </table:plain>
      <span class="test-case width-test">
        widthを指定した場合、style属性にwidthが指定されること。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t14">
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com"
            width="100px">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02"
            width="30%">
        </column:label>
      </table:plain>

      <span class="test-case autospan-test">
        autospan属性を指定しない場合、行は結合されない。
      </span>
      <table:plain
        title="autospan属性(未指定)"
        resultSetName="result"
        sampleResults="5"
          id="t16">
        <column:label
            key="status"
            value="${(row.status == 0) ? '未読' : '既読'}"
            title="ステータス"
            sample="既読|既読|既読|未読|未読">
        </column:label>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02|2013/03/03|2013/04/04">
        </column:label>
      </table:plain>

      <span class="test-case autospan-test">
        autospan属性にblankを指定した場合、行は結合されない。
      </span>
      <table:plain
        title="autospan属性(blank)"
        resultSetName="result"
        sampleResults="5"
          id="t16">
        <column:label
            key="status"
            value="${(row.status == 0) ? '未読' : '既読'}"
            title="ステータス"
            autospan=""
            sample="既読|既読|既読|未読|未読">
        </column:label>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02|2013/03/03|2013/04/04">
        </column:label>
      </table:plain>

      <span class="test-case autospan-test">
        autospan属性を指定した場合、その内容が一致する
        上下に隣接するカラムを自動的に結合する。
      </span>
      <table:plain
        title="autospan属性(ステータス列)"
        resultSetName="result"
        sampleResults="5"
          id="t17">
        <column:label
            key="status"
            value="${(row.status == 0) ? '未読' : '既読'}"
            title="ステータス"
            autospan="${row.status}"
            sample="既読|既読|既読|未読|未読">
        </column:label>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com">
        </column:label>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:plain>

      <span class="test-case autospan-test">
        autospan属性を指定した場合、その内容が一致する
        上下に隣接するカラムを自動的に結合する。(表示とは別の項目を利用した場合)
      </span>
      <table:plain
        title="autospan属性(日付列<-制御用)"
        resultSetName="result"
        sampleResults="5"
          id="t18">
        <column:label
            key="no_span_date"
            value="${row.date}"
            title="日付"
            sample="2013/01/01|2013/02/02|2013/03/03|2013/04/04">
        </column:label>
        <column:label
            key="date"
            title="日付(制御用をキーに結合)"
            autospan="${row.hidden}"
            sample="2013/01/01|2013/02/02|2013/03/03|2013/04/04">
        </column:label>
        <column:label
            key="hidden"
            title="制御用(参照用)"
            sample="002|002|002|001|001">
        </column:label>
      </table:plain>

      <span class="test-case additionalTest">
         additional属性のテスト
         narrow表示ではtrueが列から消え、inlay表示になること
       </span>
      <table:plain
         title="additinal属性のテスト"
         resultSetName="result"
         id="additional"
         sampleResults="3">
        <column:label
            title="日付(未指定)"
            key="date"
            sample="2012/03/22|2014/01/21">
        </column:label>
        <column:label
            title="数値(blank)"
            key="number"
            sample="12|23|21">
        </column:label>
        <column:label
            title="名前(false)"
            key="name"
            additional="false"
            sample="name1|name2">
        </column:label>
        <column:label
            title="メール(true)"
            key="mail"
            additional="true"
            sample="aaaa@mail.com|bbbb@mail.com">
        </column:label>
      </table:plain>
      <span class="test-case additionalTest">valueおよびvalueFormatが利用できること</span>
      <table:plain
         title="additinal属性のテスト"
         resultSetName="result"
         id="additionalAndValue"
         sampleResults="3">
        <column:label
            title="名前(false)"
            key="name"
            additional="false"
            sample="name1|name2">
        </column:label>
        <column:label
            title="メール(true)"
            key="mail"
            additional="true"
            sample="aaaa@mail.com|bbbb@mail.com">
        </column:label>
        <column:label
            title="value & format(true)"
            key="formatNum"
            additional="true"
            value="${row.number}"
            valueFormat="decimal{###,###}"
            sample="1,000|1,000,000">
        </column:label>
      </table:plain>
    </tab:content>


    <tab:content title="サーバ" value="s" selected="true">
      <span class="test-case require_only-test">
        必須属性を指定した場合、列タイトル及び列の値が出力されること<br />
        ※値が出力されたことを確認するためkey属性も指定する。
      </span>
      <table:plain
          title="必須属性（全てのカラムウィジェットを纏めて実施）"
          resultSetName="result"
          id="t16">
        <column:label
            key="mail"
            title="メールアドレス">
        </column:label>
      </table:plain>

      <span class="test-case value-test">
        value属性を指定しない場合、サーバサイドで設定した値が表示されること
      </span>
      <table:plain
          title="value属性未指定"
          resultSetName="result"
          id="t17">
        <column:label
            key="mail"
            title="メールアドレス">
        </column:label>
      </table:plain>

      <span class="test-case value-test">
        value属性にブランクを指定した場合、サーバサイドで設定した値が表示されること
      </span>
      <table:plain
          title="value属性にブランク指定"
          resultSetName="result"
          id="t18">
        <column:label
            title="id"
            value="" key="id">
        </column:label>
      </table:plain>

      <span class="test-case value-test">
        value属性に値を指定した場合、各行にその値が表示されること
      </span>
      <table:plain
          title="value属性指定"
          resultSetName="result"
          id="t19">
        <column:label
            title="連番"
            value="${count}"
            key="">  <%-- count属性を使用して連番を設定 --%>
        </column:label>
      </table:plain>

      <span class="test-case valueFormat-test">
        valueFormat属性を指定しない場合、フォーマットされないこと
      </span>
      <table:plain
          title="valueFormat属性未指定"
          resultSetName="result"
          id="t20">
        <column:label
            title="日付"
            key="date">
        </column:label>
      </table:plain>

      <span class="test-case valueFormat-test">
        valueFormat属性にブランクを指定した場合、フォーマットされないこと
      </span>
      <table:plain
          title="valueFormat属性ブランク"
          resultSetName="result"
          id="t21">
        <column:label
            title="日付"
            key="date"
            valueFormat="">
        </column:label>
      </table:plain>

      <span class="test-case valueFormat-test">
        valueFormat属性を指定した場合、フォーマットされること
      </span>
      <table:plain
          title="valueFormat属性指定"
          resultSetName="result"
          id="t22">
        <column:label
            title="日付(yyyy/MM/dd)"
            key="date"
            valueFormat="yyyymmdd{yyyy/MM/dd}">
        </column:label>
        <column:label
            title="日付(yyyy年MM月dd日)"
            key="date"
            valueFormat="yyyymmdd{yyyy年MM月dd日}">
        </column:label>
        <column:label
            title="数値"
            key="number"
            valueFormat="decimal{###,###}">
        </column:label>
      </table:plain>
    </tab:content>
    </tab:group>
    </n:form>
