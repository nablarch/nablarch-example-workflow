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
    <tab:group name="test">

      <c:if test="${not serverMode}">
        <tab:content title="クライアントサイド" value="c">
          <span class="test-case">
            必須属性（sampleResults）を指定した場合、その件数が検索結果件数としてタイトル部に表示されること
          </span>
          <table:search_result
              title="必須属性を確認"
              listSearchInfoName=""
              sampleResults="10">
            <column:label
                key=""
                title="ID"
                sample="12345|abcd">
            </column:label>
            <column:label
                key=""
                title="なまえ"
                sample="なまえ１|なまえ２">
            </column:label>
            <column:label
                key=""
                title="メールアドレス"
                sample="hoge@hoge.com|hoge2@hoge.com">
            </column:label>
          </table:search_result>

          <span class="test-case">
            サーバサイドで指定する属性を含めて全ての属性を指定した場合でも、クライアントでの動作に問題がないこと
          </span>
          <table:search_result
              title="全属性を指定"
              listSearchInfoName="testInfo"
              resultSetName="result"
              sampleResults="10"
              resultSetCss="sytle"
              searchUri="search.do"
              usePaging="true"
              id="table2"
              comment="備考"
              sortCondition="初期ソート条件"
              estimatedMaxSearchResults="想定最大検索結果">
            <column:label
                key="id"
                title="ID"
                sample="12345|abcd">
            </column:label>
            <column:label
                key="name"
                title="なまえ"
                sample="なまえ１|なまえ２">
            </column:label>
            <column:label
                key="mail"
                title="メールアドレス"
                sample="hoge@hoge.com|hoge2@hoge.com">
            </column:label>
          </table:search_result>
        </tab:content>
      </c:if>

      <tab:content title="サーバサイド・クライアントサイド共通" value="sc" selected="true">
        <span class="test-case usePaging-test">
          usePaging属性を指定しない場合、ページング用のリンクが表示の上部及び下部に出力されること
        </span>
        <table:search_result
            title="usePaging属性指定なし"
            listSearchInfoName="searchInfo"
            resultSetName="searchResult"
            searchUri="./検索結果表示用テーブル.jsp"
            sampleResults="2">
          <column:label
              key="id"
              title="ユーザID"
              sample="0001|0002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２">
          </column:label>
        </table:search_result>

        <span class="test-case usePaging-test">
          usePaging属性にブランクを指定した場合、ページング用のリンクが表示の上部及び下部に出力されること
        </span>
        <table:search_result
            title="usePaging属性指定ブランク"
            listSearchInfoName="searchInfo-usePaging-blank"
            resultSetName="searchResult-usePaging-blank"
            searchUri="./検索結果表示用テーブル.jsp"
            usePaging=""
            sampleResults="2">
          <column:label
              key="id"
              title="ユーザID"
              sample="aaa|bbb">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="name1|name2">
          </column:label>
        </table:search_result>

        <span class="test-case usePaging-test">
          usePaging属性にtrueを指定した場合、ページング用のリンクが表示の上部及び下部に出力されること
        </span>
        <table:search_result
            title="usePaging属性=true"
            listSearchInfoName="searchInfo-usePaging-true"
            resultSetName="searchResult-usePaging-true"
            searchUri="./検索結果表示用テーブル.jsp"
            usePaging="true"
            sampleResults="3">
          <column:label
              key="id"
              title="ユーザID"
              sample="abcd|efgh">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２">
          </column:label>
        </table:search_result>

        <span class="test-case usePaging-test">
          usePaging属性にfalseを指定した場合、ページング用のリンクが表示の上部及び下部に出力されないこと
        </span>
        <table:search_result
            title="usePaging属性=false"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>

        <span class="test-case resultSetCss-test">
          resultSetCss属性を指定にない場合、テーブルの親となるdivタグのclass属性は「nablarch_resultSet」のみであること(ソースから確認)
        </span>
        <table:search_result
            title="resultSetCss属性未指定"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>
        <span class="test-case resultSetCss-test">
          resultSetCss属性にブランクを指定した場合、テーブルの親となるdivタグのclass属性は「nablarch_resultSet」のみであること(ソースから確認)
        </span>
        <table:search_result
            title="resultSetCss属性ブランク"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            resultSetCss=""
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>
        <span class="test-case resultSetCss-test">
          resultSetCss属性を指定した場合、そのスタイルが適用されること
        </span>
        <table:search_result
            title="resultSetCss属性指定"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            resultSetCss="border-blue"
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>

        <span class="test-case id-test">
          id属性を指定しない場合、テーブル表示領域を囲むdivタグにid属性が設定されないこと
        </span>
        <table:search_result
            title="id属性未指定"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>

        <span class="test-case id-test">
          id属性にブランクを指定した場合、テーブル表示領域を囲むdivタグにid属性が設定されないこと
        </span>
        <table:search_result
            title="id属性ブランク指定"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            id=""
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>

        <span class="test-case id-test">
          id属性を指定した場合、そのidがテーブル表示領域を囲むdivタグに設定されること
        </span>
        <table:search_result
            title="id属性を指定"
            listSearchInfoName="searchInfo-usePaging-false"
            resultSetName="searchResult-usePaging-false"
            usePaging="false"
            id="hogefuga"
            sampleResults="10">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ１|なまえ２|なまえ３|なまえ４">
          </column:label>
        </table:search_result>

        <span class="test-case layout">wideモードでは横スクロールせず、compact,narrowでは横スクロールすること</span>
        <table:search_result
            title="レイアウトの確認"
            listSearchInfoName="searchInfo"
            resultSetName="searchResult"
            id="layout"
            sampleResults="10">
          <column:label
              key="id"
              title="wideモードでは  content をはみ出して表示されるように。"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="narrow, compactモード表示では、tableが横スクロールできるようになり、contentから出ないように。"
              sample="なまえ|なまえ２">
          </column:label>
            </table:search_result>
      </tab:content>

      <tab:content title="サーバサイド" value="s">
        <span class="test-case require_only-test">
          必須属性を全て指定（必須属性は常に必要なので纏めてテスト）した場合、それぞれの属性値がただしく出力されること<br />
          (ページングなしを使用してテストを実施する。)
        </span>
        <table:search_result
            title="必須属性-検索結果"
            listSearchInfoName="searchInfo-server-default"
            resultSetName="searchResult-server-default"
            usePaging="false">
          <column:label key="id" title="ユーザID">
          </column:label>
          <column:label key="name" title="名前">
          </column:label>
        </table:search_result>
      </tab:content>
    </tab:group>
  </n:form>
