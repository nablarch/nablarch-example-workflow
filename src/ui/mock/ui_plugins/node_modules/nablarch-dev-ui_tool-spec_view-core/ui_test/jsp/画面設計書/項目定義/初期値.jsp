<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="spec" tagdir="/WEB-INF/tags/widget/spec" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>

<t:page_template title="初期値">
  <jsp:attribute name="contentHtml">
    <n:form>
      <spec:layout name="初期値設定のテスト:カラムチェックボックス">
        <table:plain title="カラムチェックボックス" sampleResults="2" resultSetName="name">
          <column:checkbox
              name=""
              key="checkbox"
              title="初期値指定なし"
              dataFrom="USERS.KANJI_NAME">
          </column:checkbox>
          <column:checkbox
              name=""
              key="checkbox"
              title="初期値指定ブランク"
              initialValueDesc=""
              dataFrom="USERS.KANJI_NAME">
          </column:checkbox>
          <column:checkbox
              name=""
              key="checkbox"
              title="初期値指定あり"
              initialValueDesc="これが初期値だ！！"
              dataFrom="USERS.KANJI_NAME">
          </column:checkbox>
        </table:plain>
      </spec:layout>
      <spec:layout name="初期値設定のテスト:カラムラジオ">
        <table:plain title="カラムラジオボタン" sampleResults="2" resultSetName="name">
          <column:radio
              name=""
              key="radio"
              title="初期値指定なし"
              dataFrom="USERS.KANJI_NAME">
          </column:radio>
          <column:radio
              name=""
              key="radio"
              title="初期値指定ブランク"
              initialValueDesc=""
              dataFrom="USERS.KANJI_NAME">
          </column:radio>
          <column:radio
              name=""
              key="radio"
              title="初期値指定あり"
              initialValueDesc="初期値！！！"
              dataFrom="USERS.KANJI_NAME">
          </column:radio>
        </table:plain>
      </spec:layout>
    </n:form>
  </jsp:attribute>
</t:page_template>
