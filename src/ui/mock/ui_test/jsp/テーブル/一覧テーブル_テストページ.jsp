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
    <tab:group name="test">

      <c:if test="${not serverMode}">
        <tab:content title="クライアントサイド" value="c">
          <span class="test-case">
            必須属性を全て指定
          </span>
          <table:plain
              title="必須属性を全て指定"
              sampleResults="4"
              id="table1">
            <column:label
                key="id"
                title="ユーザID"
                sample="001|002">
            </column:label>
            <column:label
                key="name"
                title="名前"
                sample="なまえ|なまえ２">
            </column:label>
          </table:plain>

          <span class="test-case">
            サーバサイド用の値も含めて全て属性を指定した状態でも問題なく動作すること
          </span>
          <table:plain
              title="全ての属性を指定"
              resultSetName="result"
              resultSetCss="border-blue"
              sampleResults="4"
              id="table2"
              comment="備考"
              estimatedMaxSearchResults="想定最大検索結果">
            <column:label
                key="id"
                title="ユーザID"
                sample="001|002">
            </column:label>
            <column:label
                key="name"
                title="名前"
                sample="なまえ|なまえ２">
            </column:label>
          </table:plain>
        </tab:content>
      </c:if>

      <tab:content title="サーバサイド・クライアントサイド共通" value="sc" selected="true">
        <span class="test-case resultSetCss-test">
          resultSetCssを指定しない場合、テーブルの外側のdivタグにclass属性が設定されないこと<br/>
          ※デフォルトで、nablarch_resultSetクラスが適用されるが
        </span>
        <table:plain
            title="resultSetCss未指定"
            resultSetName="result"
            sampleResults="4"
            id="table3">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

        <span class="test-case resultSetCss-test">
          resultSetCssにブランクを指定した場合、テーブルの外側のdivタグにclass属性が設定されないこと<br/>
          ※デフォルトで、nablarch_resultSetクラスが適用されるが
        </span>
        <table:plain
            title="resultSetCssブランク"
            resultSetName="result"
            resultSetCss=""
            sampleResults="4"
            id="table4">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

        <span class="test-case resultSetCss-test">
          resultSetCssを指定した場合、テーブルの外側のdivタグにclass属性が設定されること<br/>
        </span>
        <table:plain
            title="resultSetCss指定"
            resultSetName="result"
            resultSetCss="border-blue"
            sampleResults="4"
            id="table5">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

        <span class="test-case additional-test">
          additional属性をtrueに設定したカラムが存在する場合、
          ナロー表示モードでは当該列が非表示なること。
          また、各行の右端にボタンを表示し、
          それをクリック(タッチ)することで非表示カラムをinlay表示すること。
        </span>
        <table:plain
            title="additional属性(ナロー表示での非表示項目制御)"
            resultSetName="result"
            sampleResults="4"
            id="table6">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002|003|004">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ1|なまえ2|なまえ3|なまえ4">
          </column:label>
          <column:label
              key="mail"
              title="メールアドレス"
              sample="mail.address.001@example.com|mail.address..002@example.com|mail.address.003@example.com|mail.address..004@example.com"
              additional="true">
         </column:label>
         <column:label
              key="date"
              title="登録日"
              sample="2013/12/12|2014/01/05"
              additional="true">
         </column:label>
        </table:plain>

        <span class="test-case multi-layout-table-test">
         multipleRowLayout属性をtrueに設定し、子要素に&lt;table:row&gt;要素を置くことで
         複数の行レイアウトを定義できること。
        </span>
        <table:plain
          title="multipleRowLayout属性(1レコード複数行表示)"
          resultSetName="result"
          sampleResults="4"
          multipleRowLayout="true"
          id="table_multipleRowLayout">
          <table:row>
            <column:label
              key="id"
              title="ユーザID"
              sample="001|002"
              rowspan="2">
            </column:label>
            <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
            </column:label>
            <column:label
              key="number"
              title="ポイント"
              sample="98090|3400">
            </column:label>
          </table:row>
          <table:row>
            <column:label
              key="mail"
              title="メールアドレス"
              sample="mail.address.001@example.com|mail.address..002@example.com">
            </column:label>
            <column:label
              key="date"
              title="登録日"
              sample="2013/12/12|2014/01/05">
            </column:label>
          </table:row>
        </table:plain>

        <span class="test-case multi-layout-table-test">
          &lt;table:row&gt;タグのcond属性を指定することにより、当該の行レイアウトを
          表示する条件を指定することができる。
        </span>
        <table:plain
          title="multipleRowLayout属性(cond属性による行レイアウト制御)"
          resultSetName="result"
          sampleResults="5"
          multipleRowLayout="true"
          id="table_multipleRowLayout_cond">
          <table:row>
            <column:label
              key="id"
              title="ユーザID"
              sample="001|002"
              rowspan="2">
            </column:label>
            <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
            </column:label>
          </table:row>
          <table:row>
            <column:label
              key="mail"
              title="メールアドレス"
              sample="mail.address.001@example.com|mail.address.002@example.com">
            </column:label>
          </table:row>
          <table:row cond="${renderingRows && (count == resultCount)}" cssClass="subTotal">
            <column:label
              title="小計" value="小計:" key="">
            </column:label>
            <column:label
              title="小計"
              sample="999999"
              key=""
              value="${totalAmount}">
            </column:label>
          </table:row>
        </table:plain>

        <span class="test-case id-test">
          id属性を指定しない場合、テーブル表示領域を囲むdivタグにid属性が設定されないこと
        </span>
        <table:plain
            title="id属性未指定"
            resultSetName="for.noId.result"
            resultSetCss=""
            sampleResults="4">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

        <span class="test-case id-test">
          id属性にブランクを指定した場合、テーブル表示領域を囲むdivタグにid属性が設定されないこと
        </span>
        <table:plain
            title="id属性ブランク指定"
            resultSetName="result"
            resultSetCss=""
            sampleResults="4"
            id="">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

        <span class="test-case id-test">
          id属性を指定した場合、そのidがテーブル表示領域を囲むdivタグに設定されること
        </span>
        <table:plain
            title="id属性を指定"
            resultSetName="result"
            resultSetCss=""
            sampleResults="4"
            id="hogefuga">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
          </table:plain>
          <span class="test-case layout">wideモードではウィンドウでの横スクロール、compact,narrowでは内部での横スクロールができること</span>
          <table:plain
            title="レイアウトの確認"
            resultSetName="result"
            resultSetCss=""
            sampleResults="4"
            id="wideTable">
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
        </table:plain>
        <span class="test-case id-test">
          id属性に「.」(ピリオドを利用した場合の確認)
          <br>※このケースはresultSetNameにピリオドを利用した場合の動作を検証する代替手段です。
          <br>narrow表示でレイアウトが壊れないことを確認してください。
        </span>
        <table:plain
            title="id属性に「.」を利用(resultSetNameでも利用するため)"
            resultSetName="result"
            resultSetCss=""
            sampleResults="4"
            id="result.setName">
          <column:label
              key="id"
              title="ユーザID"
              sample="001|002">
          </column:label>
          <column:label
              key="name"
              title="名前"
              sample="なまえ|なまえ２">
          </column:label>
        </table:plain>

      </tab:content>

      <tab:content title="サーバサイド" value="s">
        <span class="test-case require_only-test">
          必須属性を全て指定（必須属性は常に必要なので纏めてテスト）した場合、それぞれの属性値がただしく出力されること<br />
        </span>
        <table:plain
            title="必須属性"
            resultSetName="result">
          <column:label key="id" title="ユーザID">
          </column:label>
          <column:label key="name" title="名前">
          </column:label>
          <column:label key="mail" title="メールアドレス">
          </column:label>
          <column:label key="date" title="日付" valueFormat="yyyymmdd{yyyy/MM/dd}">
          </column:label>
        </table:plain>
      </tab:content>
    </tab:group>
  </n:form>
