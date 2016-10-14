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
          サーバサイドで指定する値を含めて全て設定してもクライアントの動作が問題ないこと
        </span>
        <table:plain
            title="全属性設定"
            resultSetName="result"
            sampleResults="3"
            id="t1">
          <column:checkbox
              key="mail"
              title="選択"
              disabled="false"
              readonly="true"
              cssClass="border-red"
              checkboxCssClass="hoge"
              name="mail"
              dataFrom="テーブル名.カラム名"
              comment="備考">
          </column:checkbox>
          <column:label
              key="date"
              title="日付"
              sample="2013/01/02|2013/01/03">
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
          id="t2">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="mail@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassにブランクを指定した場合、該当列のth及びtdにはclass属性が設定されないこと
      </span>
      <table:plain
          title="cssClassをブランク"
          resultSetName="result"
          sampleResults="2"
          id="t3">
        <column:checkbox
            key="mail"
            title="選択"
            cssClass=""
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            cssClass=""
            sample="mail@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case cssClass-test">
        cssClassを指定した場合、該当列のth及びtdにはclass属性が設定されること
      </span>
      <table:plain
          title="cssClassを指定"
          resultSetName="result"
          sampleResults="3"
          id="t4">
        <column:checkbox
            key="mail"
            title="選択"
            cssClass="border-red"
            checkboxCssClass=""
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case checkboxCssClass-test">
        checkboxCssClass指定しない場合、チェックボックスのclass属性は設定されないこと
      </span>
      <table:plain
          title="checkboxCssClass未指定指定"
          resultSetName="result"
          sampleResults="3"
          id="t5">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case checkboxCssClass-test">
        checkboxCssClassにブランクを指定した場合、チェックボックスのclass属性は設定されないこと
      </span>
      <table:plain
          title="checkboxCssClassブランク"
          resultSetName="result"
          sampleResults="3"
          id="t6">
        <column:checkbox
            key="mail"
            title="選択"
            checkboxCssClass=""
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case checkboxCssClass-test">
        checkboxCssClassを指定した場合、チェックボックスのclass属性にその値が設定されること<br/>
        ※display:noneなスタイルをクラスであてる
      </span>
      <table:plain
          title="checkboxCssClass指定"
          resultSetName="result"
          sampleResults="3"
          id="t7">
        <column:checkbox
            key="mail"
            title="選択"
            checkboxCssClass="check-none"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case disabled-test">
       disabled属性を指定しない場合、操作可能な状態であること
      </span>
      <table:plain
          title="disabled未指定"
          resultSetName="result"
          sampleResults="3"
          id="t8">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case disabled-test">
        disabled属性にブランクを指定した場合、操作可能な状態であること
      </span>
      <table:plain
          title="disabledブランク"
          resultSetName="result"
          sampleResults="3"
          id="t9">
        <column:checkbox
            key="mail"
            title="選択"
            disabled=""
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case disabled-test">
        disabled属性にfalseを指定した場合、操作可能な状態であること
      </span>
      <table:plain
          title="disabled[false]"
          resultSetName="result"
          sampleResults="3"
          id="t10">
        <column:checkbox
            key="mail"
            title="選択"
            disabled="false"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case disabled-test">
        disabled属性にtrueを指定した場合、操作不可能な状態であること
      </span>
      <table:plain
          title="disabled[true]"
          resultSetName="result"
          sampleResults="3"
          id="t11">
        <column:checkbox
            key="mail"
            title="選択"
            disabled="true"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>


      <span class="test-case readonly-test">
        readonly属性を指定しない場合、操作可能な状態であること
      </span>
      <table:plain
          title="readonly未指定"
          resultSetName="result"
          sampleResults="3"
          id="t12">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case readonly-test">
        readonly属性に空文字を指定した場合、操作可能な状態であること
      </span>
      <table:plain
          title="readonlyブランク"
          resultSetName="result"
          sampleResults="3"
          id="t13">
        <column:checkbox
            key="mail"
            title="選択"
            readonly=""
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case readonly-test">
        readonly属性にfalseを指定した場合、操作可能な状態であること
      </span>
      <table:plain
          title="readonly[false]"
          resultSetName="result"
          sampleResults="3"
          id="t14">
        <column:checkbox
            key="mail"
            title="選択"
            readonly="false"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case readonly-test">
        readonly属性にtrueを指定した場合、操作不可能な状態であること
      </span>
      <table:plain
          title="readonly[true]"
          resultSetName="result"
          sampleResults="3"
          id="t15">
        <column:checkbox
            key="mail"
            title="選択"
            readonly="true"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case width-test">
        widthを指定しなかった場合、style属性にwidthが指定されないこと。
      </span>
      <table:plain
          title="width属性の指定"
          resultSetName="result"
          sampleResults="3"
          id="t16">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
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
        <column:checkbox
            key="mail"
            title="選択"
            name="mail"
            width="">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
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
        <column:checkbox
            key="mail"
            title="選択"
            name="mail"
            width="100px">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case toggle-test">
        toggleを指定しない場合、全選択/解除用のクラス属性が設定されないこと
      </span>
      <table:plain
          title="toggle属性を未指定"
          resultSetName="result"
          sampleResults="3"
          id="t19">
        <column:checkbox
            key="mail"
            title="選択"
            name="mail"
            width="100px">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case toggle-test">
        toggleにブランクを指定した場合、全選択/解除用のクラス属性が設定されないこと
      </span>
      <table:plain
          title="toggle属性をブランク"
          resultSetName="result"
          sampleResults="3"
          id="t20">
        <column:checkbox
            key="mail"
            title="選択"
            toggle=""
            name="mail"
            width="100px">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case toggle-test">
        toggleにfalseを指定した場合、全選択/解除用のクラス属性が設定されないこと
      </span>
      <table:plain
          title="toggle属性にfalse"
          resultSetName="result"
          sampleResults="3"
          id="t21">
        <column:checkbox
            key="mail"
            title="選択"
            toggle="false"
            name="mail"
            width="100px">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
        </column:label>
      </table:plain>

      <span class="test-case toggle-test">
        toggleにtrueを指定した場合、全選択/解除用のクラスが設定され、タイトルが「全選択/全解除」となること
      </span>
      <table:plain
          title="toggle属性にtrue"
          resultSetName="result"
          sampleResults="3"
          id="t22">
        <%-- 全選択/解除対象のチェックボックス --%>
        <column:checkbox
            key="mail"
            title="選択"
            toggle="true"
            name="mail"
            width="100px">
        </column:checkbox>
        <%-- 全選択/解除対象外のチェックボックス --%>
        <column:checkbox
            key="id"
            title="選択"
            toggle="false"
            name="mail"
            width="100px">
        </column:checkbox>
        <column:label
            key="mail"
            title="メールアドレス"
            sample="aa@mail.com|bb@mail.com">
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
          id="t23">
        <column:checkbox
            key="id"
            title="選択"
            name="checkbox.id">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case value-test">
        value属性を設定していない場合、サーバサイドで設定した値がチェックon時に送信された値となること
      </span>
      <table:plain
          title="value未設定"
          resultSetName="result"
          id="t24">
        <column:checkbox
            key="id"
            title="選択"
            name="checkbox.id2">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id2" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case value-test">
        value属性にブランクを設定した場合、サーバサイドで設定した値がチェックon時に送信された値となること
      </span>
      <table:plain
          title="valueブランク"
          resultSetName="result"
          id="t25">
        <column:checkbox
            key="id"
            title="選択"
            value=""
            name="checkbox.id3">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id3" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case value-test">
        value属性を設定した場合、チェックon時にその値がサーバサイドに送信されること
      </span>
      <table:plain
          title="value設定"
          resultSetName="result"
          id="t26">
        <column:checkbox
            key="id"
            title="選択"
            value="check on"
            name="checkbox.id4">
        </column:checkbox>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id4" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case offValue-test">
        offValue属性を設定していない場合、offValue値は送信されないこと
      </span>
      <table:plain
          title="offValue未設定"
          resultSetName="result"
          id="t27">
        <column:checkbox
            key="id"
            title="選択"
            name="checkbox.id5">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id5" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case offValue-test">
        offValue属性にブランクを設定した場合、offValue値は送信されないこと
      </span>
      <table:plain
          title="offValueブランク"
          resultSetName="result"
          id="t28">
        <column:checkbox
            key="id"
            title="選択"
            name="checkbox.id6[${count}]"
            offValue="">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id6" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>

      <span class="test-case offValue-test">
        offValue属性を設定した場合、offValue値が送信されること
      </span>
      <table:plain
          title="offValue指定"
          resultSetName="result"
          id="t29">
        <column:checkbox
            key="id"
            title="選択"
            name="checkbox.id7[${count}]"
            offValue="チェックされていない値">
        </column:checkbox>
        <column:label key="id" title="checkboxのvalue値">
        </column:label>
      </table:plain>
      <button:block>
        <button:submit label="checkbox.id7" uri="サーバ送信確認.jsp">
        </button:submit>
      </button:block>
    </tab:content>
    </tab:group>
    </n:form>
