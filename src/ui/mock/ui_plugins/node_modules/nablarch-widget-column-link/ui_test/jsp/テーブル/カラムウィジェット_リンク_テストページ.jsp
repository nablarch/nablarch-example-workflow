<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
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
              必須属性を全て指定した場合、クライアント上でリンクが正しく表示され、ページ遷移ができること
            </span>
        <table:plain
            title="必須属性を指定"
            resultSetName="result"
            sampleResults="2"
            id="t1">
          <column:link
              key=""
              uri=""
              title="メールアドレス"
              dummyUri="./カラムウィジェット_リンク.jsp"
              sample="mail@mail.com|mail2@mail.com">
          </column:link>
        </table:plain>

            <span class="test-case">
              全属性を指定（サーバサイドで使用する属性も指定）した場合でもクライアントの動作に問題がないこと
            </span>
        <table:plain
            title="全属性指定"
            resultSetName="result"
            sampleResults="2"
            id="t2">
          <column:link
              key="mail"
              uri="カラムウィジェット_リンク.jsp"
              title="メールアドレス"
              dummyUri="./カラムウィジェット_リンク.jsp"
              inactive="false"
              cssClass="border-red"
              value="選択"
              sample="mail@mail.com|mail2@mail.com"
              dataFrom="テーブル名.カラム名"
              comment="備考">
          </column:link>
        </table:plain>
      </tab:content>
    </c:if>

    <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case cssClass-test">
            cssClassを指定しない場合、タイトル及び各行にclass属性が設定されないこと
          </span>
      <table:plain
          title="cssClass未指定"
          resultSetName="result"
          sampleResults="2"
          id="t3">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

       <span class="test-case cssClass-test">
            cssClassにブランクを指定した場合、タイトル及び各行にclass属性が設定されないこと
          </span>
      <table:plain
          title="cssClassブランク"
          resultSetName="result"
          sampleResults="2"
          id="t4">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            cssClass=""
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case cssClass-test">
            cssClassを指定した場合、タイトル及び各行にclass属性が設定されること
          </span>
      <table:plain
          title="cssClass指定"
          resultSetName="result"
          sampleResults="2"
          id="t5">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            cssClass="border-red"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
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
        <column:link
            key="mail"
            title="メールアドレス"
            uri="./カラムウィジェット_リンク.jsp"
            dummyUri="./カラムウィジェット_リンク.jsp"
            sample="a@a.com|b@b.com">
        </column:link>
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
        <column:link
            key="mail"
            title="メールアドレス"
            sample="a@a.com|b@b.com"
            uri="./カラムウィジェット_リンク.jsp"
            dummyUri="./カラムウィジェット_リンク.jsp"
            sortable="">
        </column:link>
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
        <column:link
            key="mail"
            title="メールアドレス"
            sortable="false"
            uri="./カラムウィジェット_リンク.jsp"
            dummyUri="./カラムウィジェット_リンク.jsp"
            sample="a@a.com|b@b.com">
        </column:link>
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
          searchUri="././カラムウィジェット_リンク.jsp"
          listSearchInfoName="listSearchInfo"
          sampleResults="2"
          id="t9">
        <column:link
            key="mail"
            title="メールアドレス"
            sortable="true"
            uri="./カラムウィジェット_リンク.jsp"
            dummyUri="./カラムウィジェット_リンク.jsp"
            sample="a@a.com|b@b.com">
        </column:link>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:search_result>

          <span class="test-case inactive-test">
            inactiveを指定しない場合、リンクとして表示されること
          </span>
      <table:plain
          title="inactive未指定"
          resultSetName="result"
          sampleResults="2"
          id="t10">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case inactive-test">
            inactiveにブランクを指定した場合、リンクとして表示されること
          </span>
      <table:plain
          title="inactiveブランク"
          resultSetName="result"
          sampleResults="2"
          id="t11">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            inactive=""
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case inactive-test">
            inactiveにfalseを指定した場合、リンクとして表示されること
          </span>
      <table:plain
          title="inactive[false]"
          resultSetName="result"
          sampleResults="2"
          id="t12">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            inactive="false"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case inactive-test">
            inactiveにtrueを指定した場合、テキストとして表示されること
          </span>
      <table:plain
          title="inactive[true]"
          resultSetName="result"
          sampleResults="2"
          id="t13">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            inactive="true"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case domain-test">
            domainに指定した値が、class属性に出力されること
          </span>
      <table:plain
          title="domain属性指定"
          resultSetName="result"
          sampleResults="2"
          id="t14">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            domain="mail"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>

          <span class="test-case domain-test">
            domainとcssClassを指定すると、両方の値がclass属性に出力されること
          </span>
      <table:plain
          title="domain属性指定"
          resultSetName="result"
          sampleResults="2"
          id="t15">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            domain="mail"
            cssClass="bg-red"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
      </table:plain>
      <span class="test-case width-test">
        widthを指定しなかった場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t16">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            sample="mail@mail.com|mail2@mail.com">
        </column:link>
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
          id="t17">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            sample="mail@mail.com|mail2@mail.com"
            width="">
        </column:link>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02">
        </column:label>
      </table:plain>
      <span class="test-case width-test">
        widthを指定した場合、style属性にwidthが指定されること。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t18">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            sample="a@a.com|b@b.com"
            width="100px">
        </column:link>
        <column:label
            key="date"
            title="日付"
            sample="2013/01/01|2013/02/02"
            width="30%">
        </column:label>
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
          id="t19">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス">
        </column:link>
      </table:plain>

          <span class="test-case value-test">
            value属性を指定しない場合、サーバサイドで設定された値がリンクテキストとして出力せれること
          </span>
      <table:plain
          title="value属性未指定"
          resultSetName="result"
          id="t20">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス">
        </column:link>
      </table:plain>

          <span class="test-case value-test">
            value属性にブランクを指定した場合、サーバサイドで設定された値がリンクテキストとして出力せれること
          </span>
      <table:plain
          title="value属性ブランク"
          resultSetName="result"
          id="t21">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            value="">
        </column:link>
      </table:plain>

          <span class="test-case value-test">
            value属性を指定した場合、value属性の値がリンクテキストとして出力されること
          </span>
      <table:plain
          title="value属性指定"
          resultSetName="result"
          id="t22">
        <column:link
            key="mail"
            uri="カラムウィジェット_リンク.jsp"
            title="メールアドレス"
            value="メールアドレス${count}">
        </column:link>
      </table:plain>

    </tab:content>
    </tab:group>
    </n:form>
