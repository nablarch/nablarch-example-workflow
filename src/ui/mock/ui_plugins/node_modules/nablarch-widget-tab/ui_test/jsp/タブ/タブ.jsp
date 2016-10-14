<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
  // サーバーモードを表す
  request.setAttribute("serverMode", true);
%>

<t:ui_test_template
    suite="タブ"
    title="タブ表示切替サンプル"
    confirmationPageTitle="タブ表示切替サンプル（遷移先画面）">

  <jsp:attribute name="localCss">
    span.procedure {
      display: block;
      clear: both;
      font-size: 80%;
    }

    div.nablarch_Tab.border-blue {
      border: 3px blue solid;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <n:form>
      <tab:group name="test">
        <c:if test="${not serverMode}">
          <tab:content title="クライアントサイド" value="client">
            <field:block title="必須属性のみ">
              <span class="test-case">
                クライアントサイドで必須の項目のみ指定して動作すること
              </span>
              <span class="procedure">「タブ」を選択する</span>
              <tab:group name="">
                <tab:content title="タブ" value="">
                  <h4>「タブ」を選択するとこのブロックが表示されること</h4>
                  <span class="procedure">「切替用タブ」も選択すること。</span>
                </tab:content>
                <tab:content title="切替用タブ" value="">
                  <h4>切り替えた後にこのブロックが表示されること</h4>
                </tab:content>
              </tab:group>
            </field:block>
            <field:block title="全属性を指定">
              <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで動作すること</span>
              <tab:group name="client.all">
                <tab:content title="タブ" value="client.all1" selected="true" cssClass="border-blue">
                  <h4>初期表示時にこのブロックが選択状態であること</h4>
                  <span class="procedure">「切替用タブ」も選択すること。</span>
                </tab:content>
                <tab:content title="切替用タブ" value="client.all2" selected="false" cssClass="border-blue">
                  <h4>切り替えた後にこのブロックが表示されること</h4>
                  <span class="procedure">「タブ」も選択すること。</span>
                </tab:content>
              </tab:group>
            </field:block>
          </tab:content>
        </c:if>
        <tab:content title="サーバサイド・クライアントサイド共通" value="server_client" selected="true">
          <field:block title="Selected属性">
            <tab:group name="server_client_selected">
              <tab:content title="Selected未指定" value="server_client_selected_none">
                <h4>初期表示時にこのブロックは選択状態でないこと</h4>
              </tab:content>
              <tab:content title="Selectedブランク" value="server_client_selected_blank" selected="">
                <h4>初期表示時にこのブロックは選択状態でないこと</h4>
              </tab:content>
              <tab:content title="selected[false]" value="server_client_selected_false" selected="false">
                <h4>初期表示時にこのブロックは選択状態でないこと</h4>
              </tab:content>
              <tab:content title="selected[true]" value="server_client_selected_true" selected="true">
                <h4>初期表示時にこのブロックが選択状態であること</h4>
              </tab:content>
            </tab:group>
          </field:block>
          <field:block title="cssClass属性">
            <span class="test-case">cssClassが未指定の場合、タブにはclass属性が指定されないこと</span>
            <span class="test-case">cssClassがブランクの場合、タブにはclass属性が指定されないこと</span>
            <span class="test-case">cssClassを指定した場合、タブにclass属性が指定されること</span>
            <tab:group name="server_client_css">
              <tab:content title="cssClass未指定" value="server_client_none">
              </tab:content>
              <tab:content title="cssClassブランク" value="server_client_css_blank" cssClass="">
              </tab:content>
              <tab:content title="cssClass指定" value="server_client_true" selected="true" cssClass="border-blue">
              </tab:content>
            </tab:group>
          </field:block>
          <field:block title="画面遷移時の選択状態維持">
            <n:forInputPage>
              <span class="test-case">次画面に遷移しても、タブの選択状態が維持されていること。</span>
              <span class="procedure">Selected属性がfalseのものを選択して遷移する。</span>
            </n:forInputPage>
            <n:forConfirmationPage>
              <span class="test-case">元画面に遷移しても、タブの選択状態が維持されていること。</span>
              <span class="procedure">現在選択中のタブと異なるタブを選択して遷移する。</span>
            </n:forConfirmationPage>
          </field:block>
          <button:block>
            <n:forInputPage>
              <button:submit
                  label="次画面へ"
                  uri="./タブ_遷移先.jsp"
                  dummyUri="タブ_遷移先.jsp">
              </button:submit>
            </n:forInputPage>
            <n:forConfirmationPage>
              <button:back
                  uri="./タブ.jsp"
                  dummyUri="タブ.jsp">
              </button:back>
            </n:forConfirmationPage>
          </button:block>
          <field:block title="精査エラー発生時の選択状態">
          </field:block>
          <button:block>
            <button:submit
                label="精査エラー発生"
                uri="./タブ_精査エラー.jsp"
                dummyUri="タブ_精査エラー.jsp">
            </button:submit>
          </button:block>
        </tab:content>
        <tab:content title="サーバサイド" value="server">
          <field:block title="必須属性のみ">
              <span class="test-case">
                サーバサイドで必須の項目のみ指定して動作すること
              </span>
            <span class="procedure">「タブ」を選択する</span>
            <tab:group name="server_required_only">
              <tab:content title="必須項目のみ" value="server_required_only_one">
                <h4>「タブ」を選択するとこのブロックが表示されること</h4>
                <span class="procedure">「切替用タブ」も選択すること。</span>
              </tab:content>
              <tab:content title="切替用タブ" value="server_required_only_another">
                <h4>切り替えた後にこのブロックが表示されること</h4>
              </tab:content>
            </tab:group>
          </field:block>
        </tab:content>
      </tab:group>
    </n:form>
</jsp:attribute>

</t:ui_test_template>
