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
    title="タブ型リンクサンプル">

  <jsp:attribute name="localCss">
    span.procedure {
      display: block;
      clear: both;
      font-size: 80%;
    }

    div.nablarch_TabLink.border-blue {
      border: 3px blue solid;
    }

    a#test-id {
      border: 3px green solid;
    }
  </jsp:attribute>

  <jsp:attribute name="contentHtml">
    <n:form>
      <tab:group name="test">
        <c:if test="${not serverMode}">
          <tab:content title="クライアントサイド" value="client">
            <field:block title="必須属性のみ">
              <span class="test-case">クライアントサイドで必須の項目のみ指定して動作すること</span>
              <tab:group name="">
                <tab:content title="タブ" value="" selected="true">
                  <h4>「タブ型リンク」というタブが表示されていること。</h4>
                </tab:content>
                <tab:link title="タブ型リンク" uri="">
                </tab:link>
              </tab:group>
            </field:block>
            <field:block title="全属性を指定">
              <span class="test-case">クライアントサイドでは利用されない属性を含む、全ての属性を設定してもクライアントサイドで動作すること</span>
              <tab:group name="client.all">
                <tab:content title="タブ" value="client.all1" selected="true" cssClass="border-blue">
                  <h4>「タブ型リンク」というタブが表示されていること。</h4>
                </tab:content>
                <tab:link
                    title="タブ型リンク"
                    uri="./タブ型リンク_ページ2.jsp"
                    dummyUri="タブ型リンク_ページ2.jsp"
                    allowDoubleSubmission="false"
                    cssClass="border-blue"
                    id="id">
                </tab:link>
              </tab:group>
            </field:block>
          </tab:content>
        </c:if>
        <tab:content title="サーバサイド・クライアントサイド共通" value="server_client" selected="true">
          <field:block title="id属性">
            <span class="test-case">id属性が未指定の場合、タブにはid属性が指定されないこと</span>
            <span class="test-case">id属性がブランクの場合、タブにはid属性が指定されないこと</span>
            <span class="test-case">id属性を指定した場合、タブにid属性が指定されること</span>
            <span class="procedure">id属性が指定されているタブは、緑色の枠線で囲まれる。</span>
            <tab:group name="server_client_id">
              <tab:link
                  title="id未指定"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false"
                  dummyUri="タブ型リンク_ページ2.jsp">
              </tab:link>
              <tab:link
                  title="idブランク"
                  id=""
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false"
                  dummyUri="タブ型リンク_ページ2.jsp">
              </tab:link>
              <tab:link
                  title="id指定"
                  id="test-id"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false"
                  dummyUri="タブ型リンク_ページ2.jsp">
              </tab:link>
            </tab:group>
          </field:block>
          <field:block title="dummyUri属性">
            <span class="test-case">dummyUri属性が指定された場合、リンクをクリックすると指定されたリンク先に遷移すること（クライアントサイドのみ）</span>
            <span class="test-case">dummyUri属性が指定されていても、サーバサイドでは有効にならず、uri属性に指定されたリンク先に遷移すること</span>
            <span class="procedure">「タブ型リンク_ページ2.jsp」に遷移すればよい。</span>
            <tab:group name="server_client_dummyUri">
              <tab:link
                  title="dummyUri指定"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false"
                  dummyUri="タブ型リンク_ページ2.jsp">
              </tab:link>
              <tab:link
                  title="サーバサイド動作"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false"
                  dummyUri="dummy.jsp">
              </tab:link>
            </tab:group>
          </field:block>
        </tab:content>
        <tab:content title="サーバサイド" value="server" >
          <field:block title="必須属性">
            <span class="test-case">サーバサイドで必須の項目のみ指定する。指定したURIに遷移すること。</span>
            <span class="procedure">「タブ型リンク_ページ2.jsp」に遷移すればよい。</span>
            <tab:group name="server_required">
              <tab:link
                  title="必須のみ"
                  uri="./タブ型リンク_ページ2.jsp">
              </tab:link>
            </tab:group>
          </field:block>
          <field:block title="allowDoubleSubmission属性">
            <span class="test-case">allowDoubleSubmission属性が未指定の場合、allowDoubleSubmission属性はtrueが指定されること</span>
            <span class="test-case">allowDoubleSubmission属性がブランクの場合、allowDoubleSubmission属性はtrueが指定されること</span>
            <span class="test-case">allowDoubleSubmission属性にtrueを指定した場合、allowDoubleSubmission属性はtrueが指定されること</span>
            <span class="test-case">allowDoubleSubmission属性にfalseを指定した場合、allowDoubleSubmission属性はfalseが指定されること</span>
            <span class="procedure">allowDoubleSubmission属性がtrueのタブは、紫色の枠線で囲まれる。</span>
            <tab:group name="server_doubleSubmit">
              <tab:link
                  title="allowDoubleSubmission未指定"
                  uri="./タブ型リンク_ページ2.jsp">
              </tab:link>
              <tab:link
                  title="allowDoubleSubmissionブランク"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="">
              </tab:link>
              <tab:link
                  title="allowDoubleSubmission[true]"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="true">
              </tab:link>
              <tab:link
                  title="allowDoubleSubmission[false]"
                  uri="./タブ型リンク_ページ2.jsp"
                  allowDoubleSubmission="false">
              </tab:link>
            </tab:group>
          </field:block>
        </tab:content>
      </tab:group>
    </n:form>
  </jsp:attribute>

  <jsp:attribute name="localJs">
    $('div.nablarch_TabLink > a').each(function () {
      var $a = $(this);
      var name = $a.attr('name');
      var $form = $a.parents('form');
      var formName = $form.attr('name');
      var allowDoubleSubmission = formName && nablarch_submission_info[formName][name]['allowDoubleSubmission'];
      if (allowDoubleSubmission) {
        $a.parent().css("border", "3px purple solid")
      }
    });
  </jsp:attribute>
</t:ui_test_template>
