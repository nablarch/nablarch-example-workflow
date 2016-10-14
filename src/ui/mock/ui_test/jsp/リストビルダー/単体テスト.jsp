<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Map" %>
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

  List<Map<String, String>> list = new ArrayList<Map<String, String>>() {{
    add(new HashMap<String, String>() {{
      put("id", "01");
      put("name", "普通口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "02");
      put("name", "定期口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "03");
      put("name", "自動積立定期口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "11");
      put("name", "外貨口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "12");
      put("name", "外貨積立口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "21");
      put("name", "投資信託口座");
    }});
    add(new HashMap<String, String>() {{
      put("id", "22");
      put("name", "投資信託口座(NISA)");
    }});
  }};
  request.setAttribute("list", list);

  if (!request.getParameterMap().containsKey("必須")) {
    for (String s : new String[]{
        "必須",
        "required未指定",
        "requiredブランク",
        "required_false",
        "required_true",
        "readonly未指定",
        "readonlyブランク",
        "readonly_false",
        "disabled未指定",
        "disabledブランク",
        "disabled_false",
        "disabled_true",
        "cssClass未指定",
        "cssClassブランク",
        "cssClass指定",
    }) {
      request.setAttribute(s, new String[]{"01", "11"});
    }
    request.setAttribute("readonly_true", new String[]{"01", "11", "12"});

    ApplicationException exception = new ApplicationException();
    exception.addMessages(new ValidationResultMessage("nameAlias未指定", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "単一項目のエラー";
      }
    }, new Object[0]));
    exception.addMessages(new ValidationResultMessage("error", new StringResource() {
      @Override
      public String getId() {
        return "id";
      }

      @Override
      public String getValue(Locale locale) {
        return "メッセージ";
      }
    }, new Object[0]));
    request.setAttribute("nablarch_application_error", exception);
  }

%>
-->

<t:ui_test_template
    suite="リストビルダー"
    title="リストビルダー単体テスト"
    confirmationPageTitle="リストビルダー単体テスト（確認）">

  <jsp:attribute name="localCss">
    .style {
      border: none;
      color: #ffffff;
      background-color: #ffc66d;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <n:form name="builder">
      <tab:group name="tab">

        <c:if test="${not serverMode}">
          <tab:content title="クライアント" value="c">
            <span class="test-case">
              必須属性を全て指定
            </span>
            <field:listbuilder
                title="クライアント必須"
                name="クライアント必須"
                id="クライアント必須"
                listName=""
                elementLabelProperty=""
                elementValueProperty=""
                sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]|サンプル５|サンプル６|サンプル７">
            </field:listbuilder>

            <span class="test-case">
              サーバサイドで指定する値も含めて全て指定
            </span>
            <field:listbuilder
                title="全指定"
                name="全指定"
                id="全指定"
                listName="list"
                elementLabelProperty="name"
                elementValueProperty="id"
                size="5"
                cssClass="style"
                disabled="false"
                readonly="false"
                required="true"
                hint="ひんと部分"
                domain="ドメイン"
                elementLabelPattern="$NAME$($VALUE$)"
                nameAlias="error"
                sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]|サンプル５|サンプル６|サンプル７"
                dataFrom="テーブル名.カラム名"
                comment="備考">
            </field:listbuilder>
          </tab:content>
        </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case">
            requiredを指定しない場合、必須マークがつかないこと
          </span>
          <field:listbuilder
              title="required未指定"
              name="required未指定"
              id="required未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            requiredにブランクを指定した場合、必須マークがつかないこと
          </span>
          <field:listbuilder
              title="requiredブランク"
              name="requiredブランク"
              id="requiredブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              required="">
          </field:listbuilder>

          <span class="test-case">
            requiredにfalseを指定した場合、必須マークがつかないこと
          </span>
          <field:listbuilder
              title="required[false]"
              name="required_false"
              id="required_false"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              required="false">
          </field:listbuilder>

          <span class="test-case">
            requiredにtrueを指定した場合、必須マークがつくこと
          </span>
          <field:listbuilder
              title="required_true(必須マークがタイトルの右側につくこと)"
              name="required_true"
              id="required_true"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              required="true">
          </field:listbuilder>

          <span class="test-case">
            readonlyを指定しない場合、編集可能な状態であること(サーバに値が送信される）
          </span>
          <field:listbuilder
              title="readonly未指定"
              name="readonly未指定"
              id="readonly未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            readonlyにブランクを指定した場合、編集可能な状態であること(サーバに値が送信される）
          </span>
          <field:listbuilder
              title="readonlyブランク"
              name="readonlyブランク"
              id="readonlyブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              readonly="">
          </field:listbuilder>

          <span class="test-case">
            readonlyにfalseを指定した場合、編集可能な状態であること(サーバに値が送信される）
          </span>
          <field:listbuilder
              title="readonly[false]"
              name="readonly_false"
              id="readonly_false"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              readonly="false">
          </field:listbuilder>

          <span class="test-case">
            readonlyにtrueを指定した場合、編集できなくなること（サーバに値は送信される）
          </span>
          <field:listbuilder
              title="readonly[true]"
              name="readonly_true"
              id="readonly_true"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              readonly="true">
          </field:listbuilder>

          <span class="test-case">
            disabledを指定しない場合、編集可能な状態であること（サーバに値は送信される）
          </span>
          <field:listbuilder
              title="disabled未指定"
              name="disabled未指定"
              id="disabled未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            disabledにブランクを指定した場合、編集可能な状態であること（サーバに値は送信される）
          </span>
          <field:listbuilder
              title="disabledブランク"
              name="disabledブランク"
              id="disabledブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              disabled="">
          </field:listbuilder>

          <span class="test-case">
            disabledにfalseを指定した場合、編集可能な状態であること（サーバに値は送信される）
          </span>
          <field:listbuilder
              title="disabled[false]"
              name="disabled_false"
              id="disabled_false"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              disabled="false">
          </field:listbuilder>

          <span class="test-case">
            disabledにtrueを指定した場合、編集できなくなること（サーバに値は送信されない）
          </span>
          <field:listbuilder
              title="disabled[true]"
              name="disabled_true"
              id="disabled_true"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              disabled="true">
          </field:listbuilder>

          <span class="test-case">
            cssClassを指定しない場合、class属性(リストビルダ関連のclass属性以外)が設定されないこと
          </span>
          <field:listbuilder
              title="cssClass未指定"
              name="cssClass未指定"
              id="cssClass未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            cssClassにブランクを指定した場合、class属性(リストビルダ関連のclass属性以外)が設定されないこと
          </span>
          <field:listbuilder
              title="cssClassブランク"
              name="cssClassブランク"
              id="cssClassブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              cssClass="">
          </field:listbuilder>

          <span class="test-case">
            cssClassを指定した場合、class属性(リストビルダ関連のclass属性以外)が設定されること
          </span>
          <field:listbuilder
              title="cssClass指定"
              name="cssClass指定"
              id="cssClass指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              cssClass="style">
          </field:listbuilder>

          <span class="test-case">
            hint属性を指定しない場合、ヒントが表示されないこと
          </span>
          <field:listbuilder
              title="hint未指定"
              name="hint未指定"
              id="hint未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            hint属性にブランクを指定した場合、ヒントが表示されないこと
          </span>
          <field:listbuilder
              title="hintブランク"
              name="hintブランク"
              id="hintブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              hint="">
          </field:listbuilder>

          <span class="test-case">
            hint属性を指定した場合、ヒントが表示されること
          </span>
          <field:listbuilder
              title="hint指定"
              name="hint指定"
              id="hint指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              hint="ヒント">
          </field:listbuilder>

          <span class="test-case">
            size属性を指定しない場合、高さは6要素文となること
          </span>
          <field:listbuilder
              title="size未指定"
              name="size未指定"
              id="size未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]">
          </field:listbuilder>

          <span class="test-case">
            size属性にブランクを指定した場合、高さは6要素文となること
          </span>
          <field:listbuilder
              title="sizeブランク"
              name="sizeブランク"
              id="sizeブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              size="">
          </field:listbuilder>

          <span class="test-case">
            size属性を指定した場合、高さは指定したサイズ分になること
          </span>
          <field:listbuilder
              title="size指定"
              name="size指定"
              id="size指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              sample="サンプル１|サンプル２|[サンプル３]|[サンプル４]"
              size="9">
          </field:listbuilder>

          <span class="test-case">
            titleSizeが未指定の場合、タイトル部にgrid-col関連のクラスが設定されないこと
          </span>
          <field:listbuilder
              title="titleSize未指定"
              name="titleSize未指定"
              id="titleSize未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id">
          </field:listbuilder>

          <span class="test-case">
            titleSizeがブランクの場合、タイトル部にgrid-col関連のクラスが設定されないこと
          </span>
          <field:listbuilder
              title="titleSizeブランク"
              name="titleSizeブランク"
              id="titleSizeブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              titleSize="">
          </field:listbuilder>

          <span class="test-case">
            titleSizeを指定した場合、タイトル部にgrid-colが設定されること
          </span>
          <field:listbuilder
              title="titleSize指定"
              name="titleSize指定"
              id="titleSize指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              titleSize="15">
          </field:listbuilder>

        </tab:content>

        <tab:content title="サーバ" value="s">
          <span class="test-case">
            必須属性を全て設定した場合
          </span>
          <field:listbuilder
              title="必須項目設定"
              name="必須"
              id="必須"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id">
          </field:listbuilder>

          <span class="test-case">
            elementLabelPatternを指定しない場合、名称のみ表示されること
          </span>
          <field:listbuilder
              title="elementLabelPattern未指定"
              name="elementLabelPattern未指定"
              id="elementLabelPattern未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id">
          </field:listbuilder>

          <span class="test-case">
            elementLabelPatternにブランクを指定した場合、名称のみ表示されること
          </span>
          <field:listbuilder
              title="elementLabelPatternブランク"
              name="elementLabelPatternブランク"
              id="elementLabelPatternブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              elementLabelPattern="">
          </field:listbuilder>

          <span class="test-case">
            elementLabelPatternを指定した場合、そのフォーマットで表示されること
          </span>
          <field:listbuilder
              title="elementLabelPattern指定"
              name="elementLabelPattern指定"
              id="elementLabelPattern指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              elementLabelPattern="$LABEL$($VALUE$)">
          </field:listbuilder>

          <span class="test-case">
            nameAliasを未指定の場合、エラー表示されないこと
          </span>
          <field:listbuilder
              title="nameAlias未指定"
              name="nameAlias未指定"
              id="nameAlias未指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id">
          </field:listbuilder>

          <span class="test-case">
            nameAliasがブランクの場合、エラー表示されないこと
          </span>
          <field:listbuilder
              title="nameAliasブランク"
              name="nameAliasブランク"
              id="nameAliasブランク"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              nameAlias="">
          </field:listbuilder>

          <span class="test-case">
            nameAliasを指定した場合、エラー表示されること
          </span>
          <field:listbuilder
              title="nameAlias指定"
              name="nameAlias指定"
              id="nameAlias指定"
              listName="list"
              elementLabelProperty="name"
              elementValueProperty="id"
              nameAlias="error">
          </field:listbuilder>
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
