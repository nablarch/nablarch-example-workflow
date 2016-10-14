<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="nablarch.core.message.ApplicationException" %>
<%@ page import="nablarch.core.message.StringResource" %>
<%@ page import="nablarch.core.validation.ValidationResultMessage" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!--
<%
  request.setAttribute("serverMode", true);

  if (!request.getParameterMap().containsKey("server.date1")) {
    request.setAttribute("cs", new HashMap<String, String>() {{
      put("date1", "20120101");
      put("date2", "20120102");
      put("date3", "20120103");
      put("date4", "20120104");
      put("date5", "20120105");
      put("date6", "20120106");
      put("date7", "20120107");
      put("date8", "20120108");
      put("date9", "20120109");
      put("date10", "20120110");
      put("date11", "20120111");
      put("date12", "20120112");
      put("date13", "20120113");
      put("date14", "20120114");
      put("date15", "20120115");
      put("date16", "20120116");
      put("date17", "20120117");
      put("date18", "20120118");
      put("date19", "20120119");
      put("date20", "20120120");
      put("date20_1", "20120120");
      put("date21", "20120121");
      put("date21_1", "20120121");
      put("date22", "20120122");
      put("date23", "20120123");
      put("date24", "20120124");
      put("date25", "20120125");
      put("date26", "20120126");
      put("date27", "20120127");
      put("date28", "20120128");
      put("date29", "20120129");
    }});
    request.setAttribute("server", new HashMap<String, String>() {{
      put("date1", "20120101");
      put("date2", "20120102");
      put("date3", "20120103");
      put("date4", "20120104");
      put("date5", "20120105");
      put("date6", "20120106");
      put("date7", "20120107");
      put("date8", "20120108");
      put("date9", "20120109");
    }});
  }

  ApplicationException exception = new ApplicationException();
  exception.addMessages(new ValidationResultMessage("server.date2", new StringResource() {
    @Override
    public String getId() {
      return "id";
    }

    @Override
    public String getValue(Locale locale) {
      return "server.date2はエラー";
    }
  }, new Object[0]));

  request.setAttribute("nablarch_application_error", exception);
%>
-->

<t:ui_test_template
    suite="カレンダー日付入力"
    title="カレンダー日付入力（単体テスト）"
    confirmationPageTitle="カレンダー日付入力確認画面（単体テスト）">

  <jsp:attribute name="localCss">
    .border-blue {
      border: solid 2px blue;
      height: 50px !important;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <n:form name="builder">
    <tab:group name="tab">

    <c:if test="${not serverMode}">
      <tab:content title="クライアント" value="c">
        <field:block title="必須属性">
          <span class="test-case">
            必須属性を全て指定した場合
          </span>
          <field:calendar
              title="必須"
              name=""
              sample="2013/01/02">
          </field:calendar>
        </field:block>

        <field:block title="全属性指定">
          <span class="test-case">
            サーバサイドで指定する値も含めて全ての属性を設定
          </span>
          <field:calendar
              title="全属性指定"
              name="cs"
              id="cs_1"
              sample="2013-11-02"
              locale="it"
              format="yyyy-MM-dd"
              hint="日付"
              example="2013-10-10"
              cssClass="border-blue"
              disabled="false"
              readonly="false"
              required="true"
              domain="birthday"
              maxlength="20"
              nameAlias="error"
              comment="コメント"
              dataFrom="テーブル名.カラム名">
          </field:calendar>
        </field:block>
      </tab:content>
    </c:if>

    <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
      <field:block title="id属性">
        <span class="test-case">
          id属性を指定しない場合、name属性の値が使用されること
        </span>
        <field:calendar
            title="id未指定"
            name="date1">
        </field:calendar>
      
        <span class="test-case">
          id属性もしくはname属性に.が使用されている場合でも正しく動作すること。
        </span>
        <field:calendar
            title="nameに.(ドット)使用"
            name="form.cs.date1">
        </field:calendar>
      </field:block>
    
      <field:block title="format属性">
        <span class="test-case">
          format属性を指定しない場合、デフォルトの「yyyy/MM/dd」型式でフォーマットされること
        </span>
        <field:calendar
            title="format未指定"
            name="cs.date1"
            id="cs_date1">
        </field:calendar>

        <span class="test-case">
          format属性にブランクを指定した場合、デフォルトの「yyyy/MM/dd」型式でフォーマットされること<br/>
        </span>
        <field:calendar
          title="formatブランク"
          name="cs.date2"
          id="cs_date2"
          format="">
        </field:calendar>

        <span class="test-case">
          format属性を指定した場合、その値でフォーマットされること
        </span>
        <field:calendar
            title="format指定"
            name="cs.date3"
            id="cs_date3"
            format="yyyy年MM月dd日">
        </field:calendar>
      </field:block>

      <field:block title="required属性">
        <span class="test-case">
          required属性を指定しない場合、必須マークが表示されないこと
        </span>
        <field:calendar
            title="required属性未指定"
            name="cs.date4"
            id="cs_date4">
        </field:calendar>

        <span class="test-case">
          requiredにブランクを指定した場合、必須マークが表示されないこと
        </span>
        <field:calendar
            title="required属性ブランク"
            name="cs.date5"
            id="cs_date5"
            required="">
        </field:calendar>

        <span class="test-case">
          requiredにfalseを指定した場合、必須マークが表示されないこと
        </span>
        <field:calendar
            title="required属性false"
            name="cs.date6"
            id="cs_date6"
            required="false">
        </field:calendar>

        <span class="test-case">
          requiredにtrueを指定した場合、必須マークが表示されること
        </span>
        <field:calendar
            title="required属性true(必須マークがタイトルの右側につくこと)"
            name="cs.date7"
            id="cs_date7"
            required="true">
        </field:calendar>
      </field:block>

      <field:block title="readonly属性">
        <span class="test-case">
          readonly属性を指定しない場合、編集可能な状態であること
        </span>
        <field:calendar
            title="readonly属性未指定"
            name="cs.date8"
            id="cs_date8">
        </field:calendar>

        <span class="test-case">
          readonly属性にブランクを指定した場合、編集可能な状態であること
        </span>
        <field:calendar
            title="readonly属性ブランク"
            name="cs.date9"
            id="cs_date9"
            readonly="">
        </field:calendar>

        <span class="test-case">
          readonly属性にfalseを指定した場合、編集可能な状態であること
        </span>
        <field:calendar
            title="readonly属性false"
            name="cs.date10"
            id="cs_date10"
            readonly="false">
        </field:calendar>

        <span class="test-case">
          readonly属性にtrueを指定した場合、編集不可能な状態であること。<br/>
          ※サーバへの値の送信は行われること
        </span>
        <field:calendar
            title="readonly属性true"
            name="cs.date11"
            id="cs_date11"
            readonly="true">
        </field:calendar>
       </field:block>

      <field:block title="disabled属性">
        <span class="test-case">
          disabled属性を指定しない場合、編集可能な状態でサーバに値が送信されること
        </span>
        <field:calendar
            title="disabled属性未指定"
            name="cs.date12"
            id="cs_date12">
        </field:calendar>

        <span class="test-case">
          disabledにブランクを指定した場合、編集可能な状態でサーバに値が送信されること
        </span>
        <field:calendar
            title="disabled属性ブランク"
            name="cs.date13"
            id="cs_date13"
            disabled="">
        </field:calendar>

        <span class="test-case">
          disabledにfalseを指定した場合、編集可能な状態でサーバに値が送信されること
        </span>
        <field:calendar
            title="disabled属性false"
            name="cs.date14"
            id="cs_date14"
            disabled="false">
        </field:calendar>

        <span class="test-case">
          disabledにtrueを指定した場合、編集不可でサーバに値が送信されないこと
        </span>
        <field:calendar
            title="disabled属性true"
            name="cs.date15"
            id="cs_date15"
            disabled="true">
        </field:calendar>
      </field:block>

      <field:block title="cssClass属性">
        <span class="test-case">
          cssClass属性を指定しない場合、カレンダーに関連するclass以外はclass属性に指定されないこと
        </span>
        <field:calendar
            title="cssClass属性未指定"
            name="cs.date16"
            id="cs_date16">
        </field:calendar>

        <span class="test-case">
          cssClass属性にブランクを指定した場合、カレンダーに関連するclass以外はclass属性に指定されないこと
        </span>
        <field:calendar
            title="cssClass属性ブランク"
            name="cs.date17"
            id="cs_date17"
            cssClass="">
        </field:calendar>

        <span class="test-case">
          cssClass属性を指定した場合、そのclassがclassに指定されること
        </span>
        <field:calendar
            title="cssClass属性指定"
            name="cs.date18"
            id="cs_date18"
            cssClass="border-blue">
        </field:calendar>
      </field:block>

      <field:block title="maxlength属性">
        <span class="test-case">
          format属性を指定していないので、デフォルトフォーマットの長さ10が設定されること
        </span>
        <field:calendar
            title="format未指定"
            name="cs.date19"
            id="cs_date19">
        </field:calendar>

        <span class="test-case">
          format属性を指定し、maxlengthにブランクを指定した場合はmaxlength属性自体が出力されないこと
        </span>
        <field:calendar
            title="maxlengthブランク"
            name="cs.date20"
            id="cs_date20"
            format="yyyyMMdd"
            maxlength="">
        </field:calendar>

        <span class="test-case">
          format属性を指定し、maxlengthを指定しない場合はmaxlength属性自体が出力されないこと
        </span>
        <field:calendar
            title="maxlengthブランク"
            name="cs.date20_1"
            id="cs_date20_1"
            format="yyyyMMdd">
        </field:calendar>

        <span class="test-case">
          maxlengthを指定しているが、format属性を指定していないためデフォルト値のmaxlengthはデフォルト値の10となること
        </span>
        <field:calendar
            title="maxlength指定&format未指定"
            name="cs.date21"
            id="cs_date21"
            maxlength="8">
        </field:calendar>

        <span class="test-case">
          maxlengthとformat属性をともに指定しているので、指定したmaxlengthの値がhtmlのmaxlength属性に設定されること
        </span>
        <field:calendar
            title="maxlength指定&format指定"
            name="cs.date21_1"
            id="cs_date22_1"
            format="yyyyMMdd"
            maxlength="8">
        </field:calendar>
      </field:block>

      <field:block title="example属性">
        <span class="test-case">
          exampleを指定しない場合、placeholderとして何も表示されないこと
        </span>
        <field:calendar
            title="example未指定"
            name="cs.blank"
            id="cs-blank1">
        </field:calendar>

        <span class="test-case">
          exampleにブランクを指定した場合、placeholderとして何も表示されないこと
        </span>
        <field:calendar
            title="exampleブランク"
            name="cs.blank"
            id="cs-blank2"
            example="">
        </field:calendar>
        <span class="test-case">
          exampleを指定した場合、その値がplaceholderとして表示されること
        </span>
        <field:calendar
            title="example指定"
            name="cs.blank"
            id="cs-blank3"
            example="誕生日を選択してください">
        </field:calendar>
      </field:block>

      <field:block title="hint属性">
        <span class="test-case">
          hintを指定しない場合、ヒントは表示されないこと
        </span>
        <field:calendar
            title="hint未指定"
            name="cs.date22"
            id="cs-date22">
        </field:calendar>

        <span class="test-case">
          hintにブランクを指定した場合、ヒントは表示されないこと
        </span>
        <field:calendar
            title="hintブランク"
            name="cs.date23"
            id="cs-date23"
            hint="">
        </field:calendar>

        <span class="test-case">
          hintを指定した場合、その値がヒントとして表示されること
        </span>
        <field:calendar
            title="hint指定(タイトルが折り返す)"
            name="cs.date24"
            id="cs-date24"
            hint="生年月日を選択してください">
        </field:calendar>
      </field:block>

      <field:block title="locale属性">
        <span class="test-case">
          locale属性を指定しない場合、デフォルトの「ja」が設定されること。（カレンダーを表示して確認）
        </span>
        <field:calendar
            title="locale未指定"
            name="cs.date25"
            id="cs_date25">
        </field:calendar>

        <span class="test-case">
          locale属性にブランクを指定した場合、デフォルトの「ja」が設定されること。（カレンダーを表示して確認）
        </span>
        <field:calendar
            title="localeブランク"
            name="cs.date26"
            id="cs_date26"
            locale="">
        </field:calendar>

        <span class="test-case">
          locale属性を指定した場合、そのロケールに準じたカレンダー表示になること
        </span>
        <field:calendar
            title="locale指定"
            name="cs.date27"
            id="cs_date27"
            locale="it">
        </field:calendar>

      </field:block>

      <field:block title="size属性">
        <span class="test-case">
          size属性が未指定の場合、タイトル部と入力部のクラス属性にはgrid-colのクラスが設定されないこと
        </span>
        <field:calendar
            title="size未指定"
            name="server.notSize">
        </field:calendar>

        <span class="test-case">
          size属性がブランクの場合、タイトル部と入力部のクラス属性にはgrid-colのクラスが設定されないこと
        </span>
        <field:calendar
            title="sizeブランク"
            name="server.sizeBlank"
            titleSize=""
            inputSize="">
        </field:calendar>

        <span class="test-case">
          size属性を指定した場合、タイトル部と入力部のクラス属性にgrid-colのクラスが設定されること<br/>
          タイトル部(label)には、指定したグリッド数 - 2のグリッド数が設定されること<br/>
          入力部(div.field-content)には、指定したグリッド数が設定されること
        </span>
        <field:calendar
            title="sizeブランク"
            name="server.size"
            titleSize="20"
            inputSize="25">
        </field:calendar>
      </field:block>

    </tab:content>

    <tab:content title="サーバ" value="s">
      <field:block title="必須属性">
        <span class="test-case">
          必須属性を全て指定した場合、入力画面で入力した値が確認画面に表示されること<br/>
          ※カレンダーとの連携部は、打鍵にて動作を確認する。
        </span>
        <field:calendar
            title="必須属性全て指定"
            name="server.date1"
            id="server_date1">
        </field:calendar>
      </field:block>

      <field:block title="nameAlias属性">
        <span class="test-case">
          nameAlias属性を未指定の場合、エラーハイライト表示されないこと<br/>
          name属性に対応するエラー情報により、エラー表示がされる。
        </span>
        <field:calendar
            title="nameAlias未指定"
            name="server.date2"
            id="server_date2">
        </field:calendar>

        <span class="test-case">
          nameAlias属性にブランクを指定した場合、エラーハイライト表示されないこと<br/>
        </span>
        <field:calendar
            title="nameAliasブランク"
            name="server.date3"
            id="server_date3"
            nameAlias="">
        </field:calendar>

        <span class="test-case">
          nameAlias属性を指定した場合、エラーハイライト表示されること<br/>
        </span>
        <field:calendar
            title="nameAlias指定"
            name="server.date4"
            id="server_date4"
            nameAlias="server.date2">
        </field:calendar>
      </field:block>
    </tab:content>
    </tab:group>
    <button:block>
      <n:forInputPage>
        <button:check uri="単体テスト_確認.jsp" dummyUri="単体テスト_確認.jsp">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:back uri="単体テスト.jsp" dummyUri="単体テスト.jsp">
        </button:back>
      </n:forConfirmationPage>
    </button:block>
    </n:form>
  </jsp:attribute>
</t:ui_test_template>
