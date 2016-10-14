<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
    <tab:group name="test">
    <tab:content value="attribute" title="属性での単体テスト" selected="true">
      <field:block id="require_only_test" title="必須属性のみの確認"> <%-- 他の定義が影響しないようにコンテキストの境界を作成する。 --%>
        <span class="test-case require_only">必須属性のみの確認。(必須属性のみを指定した場合に動作することを確認する。)</span>
        <event:listen event='input[name="formdata.require_only"] change'>
          <event:toggle_readonly condition=":is-value(readonly)"
                                 target="#require_only_target_readonly"></event:toggle_readonly>
          <event:toggle_disabled condition=":is-value(disable)"
                                 target="#require_only_target_disable"></event:toggle_disabled>
        </event:listen>
      <field:radio name="formdata.require_only"
                   title="イベントの基点"
                   listName="switches"
                   elementValueProperty="value"
                   elementLabelProperty="label">
      </field:radio>
      <field:text title="読取専用"
                  name="formdata.require_only_target_readonly"
                  id="require_only_target_readonly">
      </field:text>
      <field:text title="非活性化"
                  name="formdata.require_only_target_disable"
                  id="require_only_target_disable">
      </field:text>

      </field:block>

      <field:block id="reverse_attr_test" title="reverse属性(読取専用)">
        <span class="test-case reverse_test">reverse属性を指定した場合の確認<br>reverse属性にtrueを指定した場合、条件に一致した場合のみ活性になる。</span>
        <event:listen event='input[name="formdata.reverse"] change'
                      title="reverse属性の確認">
           <event:toggle_readonly
              title="reverse属性を指定しない場合のテスト"
              target="#readonly_reverse_attr_none"
              condition=":is-value(readonly)"></event:toggle_readonly>
           <event:toggle_readonly
              title="reverse属性がブランクの場合のテスト"
              target="#readonly_reverse_attr_blank"
              condition=":is-value(readonly)"
              reverse="">
           </event:toggle_readonly>
           <event:toggle_readonly
              title="reverse属性がfalseの場合のテスト"
              target="#readonly_reverse_attr_false"
              condition=":is-value(readonly)"
              reverse="false">
           </event:toggle_readonly>
           <event:toggle_readonly
              title="reverse属性がtrueの場合のテスト"
              target="#readonly_reverse_attr_true"
              condition=":is-value(readonly)"
              reverse="true"></event:toggle_readonly>

           <event:toggle_disabled
              title="reverse属性を指定しない場合のテスト"
              target="#disabled_reverse_attr_none"
              condition=":is-value(disable)"></event:toggle_disabled>
           <event:toggle_disabled
              title="reverse属性がブランクの場合のテスト"
              target="#disabled_reverse_attr_blank"
              condition=":is-value(disable)"
              reverse="">
           </event:toggle_disabled>
           <event:toggle_disabled
              title="reverse属性がfalseの場合のテスト"
              target="#disabled_reverse_attr_false"
              condition=":is-value(disable)"
              reverse="false">
           </event:toggle_disabled>
           <event:toggle_disabled
              title="reverse属性がtrueの場合のテスト"
              target="#disabled_reverse_attr_true"
              condition=":is-value(disable)"
              reverse="true"></event:toggle_disabled>
        </event:listen>
        <field:radio name="formdata.reverse"
                   title="イベントの基点"
                   listName="switches"
                   elementValueProperty="value"
                   elementLabelProperty="label">
        </field:radio>

        <field:text title="指定なし(読取)" id="readonly_reverse_attr_none" name="formdata.readonly_reverse_attr_none" cssClass="target onReadonly"></field:text>
        <field:text title="ブランク(読取)"  id="readonly_reverse_attr_blank" name="formdata.readonly_reverse_attr_blank"  cssClass="target onReadonly"></field:text>
        <field:text title="false(読取)"  id="readonly_reverse_attr_false" name="formdata.readonly_reverse_attr_false" cssClass="target onReadonly"></field:text>
        <field:text title="true(読取)"   id="readonly_reverse_attr_true" name="formdata.readonly_reverse_attr_true" cssClass="target onReadonly reverse"></field:text>
        <field:text title="指定なし(非活性)" id="disabled_reverse_attr_none" name="formdata.disabled_reverse_attr_none" cssClass="target onDisabled"></field:text>
        <field:text title="ブランク(非活性)"  id="disabled_reverse_attr_blank" name="formdata.disabled_reverse_attr_blank"  cssClass="target onDisabled"></field:text>
        <field:text title="false(非活性)"  id="disabled_reverse_attr_false" name="formdata.disabled_reverse_attr_false" cssClass="target onDisabled"></field:text>
        <field:text title="true(非活性)"   id="disabled_reverse_attr_true" name="formdata.disabled_reverse_attr_true" cssClass="target onDisabled reverse"></field:text>
      </field:block>
    </tab:content>
    <tab:content value="readonly" title="radio">
    <span class="test-case radio-title">ラジオボタンをサポートすることの確認</span>
    <field:block
      title="ユーザ基本情報"
      collapsible="true"
      name="block_status"
      value="toggle-radio">
      <event:listen event='input[name="formdata.switch-radio"] change'>
         <event:toggle_readonly
           target='#mailAddress'
           condition=':is-value(sales)'></event:toggle_readonly>
         <event:toggle_readonly
           target='#card'
           condition=':is-value(owner)'
           reverse='true'></event:toggle_readonly>
         <event:toggle_readonly
           target='input[name^="formdata.mobilePhoneNumber"]'
           condition=':is-value(agency, sales)'
           reverse='false'></event:toggle_readonly>
      </event:listen>
      <field:radio name="formdata.switch-radio"
                   title="入力者"
                   listName="operators"
                   elementValueProperty="id"
                   elementLabelProperty="role">
      </field:radio>
      <field:text title="漢字氏名"
                  name="formdata.kanjiName"
                  id="kanjiName"
                  sample="名部　楽太郎"
                  hint="全員入力可能">
      </field:text>
      <field:text title="メールアドレス"
                  name="formdata.mailAddress"
                  id="mailAddress"
                  sample="nabla@example.com"
                  hint="[O：本人、代理店、サポート][X:営業]">
      </field:text>
      <field:text
                  title="カード番号"
                  name="formdata.card"
                  id="card"
                  hint="[O：本人][X:営業、代理店、サポート]">
      </field:text>
      <field:text
                  title="更新日"
                  name="formdata.before"
                  readonly="true"
                  hint="常に読取専用">
      </field:text>
    </field:block>
    </tab:content>

    <tab:content value="プルダウン" title="pulldown" >
    <event:listen event='select[name="formdata_disabled.switch-select"] change'>
      <event:toggle_disabled
        target='input[name="formdata_disabled.mailAddress"]'
        condition='[value="lawyer"]'
        reverse='true'>
      </event:toggle_disabled>
      <event:toggle_disabled
        target='input[name="formdata_disabled.card"]'
        condition='[value="lawyer"], [value="spaceman"]'
        reverse='true'>
      </event:toggle_disabled>
      <event:toggle_disabled
        target='input[name^="formdata_disabled.mobilePhoneNumber"]'
        condition='[value="piper"]'
        reverse='true'>
      </event:toggle_disabled>
    </event:listen>

    <span class="test-case pulldown-title">プルダウンで切り替わること。<br ></span>
    <field:block
      title="リクルート"
      collapsible="true"
      name="block_status_disabled"
      value="toggle-pulldown">
      <field:pulldown name="formdata_disabled.switch-select"
                   title="希望職種"
                   listName="operators"
                   elementValueProperty="career"
                   elementLabelProperty="title">
      </field:pulldown>
      <field:text title="漢字氏名"
                  hint="全員入力可能"
                  name="formdata_disabled.kanjiName"
                  sample="名部　楽太郎">
      </field:text>
      <field:text title="メールアドレス"
                  hint="[O：弁護士][X:配管工、料理人、宇宙飛行士]"
                  name="formdata_disabled.mailAddress"
                  sample="nabla@example.com">
      </field:text>
      <field:text
                  title="カード番号"
                  name="formdata_disabled.card"
                  hint="[O：弁護士、宇宙飛行士][X:配管工、料理人]">
      </field:text>
      <field:text
                  title="更新日"
                  name="formdata_disabled.before"
                  disabled="true"
                  hint="常に常に非活性">
      </field:text>

    </field:block>
    </tab:content>
    <tab:content value="inputType" title="checkbox">
    <span class="test-case input-type">チェックボックスで切り替わること</span>
    <event:listen event=':checkbox[name="formdata_checkbox.checkbox"] change'>
        <event:toggle_disabled
          target="#toggle_checkbox_lowyar"
          condition=":is-value(lawyer)"
          reverse="true">
        </event:toggle_disabled>
        <event:toggle_disabled
          target="#toggle_checkbox_piper"
          condition=":is-value(piper)"
          reverse="true">
        </event:toggle_disabled>
        <event:toggle_disabled
          target="#toggle_checkbox_allergy"
          condition=":is-value(spaceman)">
        </event:toggle_disabled>
    </event:listen>
    <field:block collapsible="true"
                 value="toggel_checkbox">
    <field:checkbox name="formdata_checkbox.checkbox"
                    listName="operators"
                    elementValueProperty="career"
                    elementLabelProperty="title"
                    title="checkboxでの切替">
    </field:checkbox>
    <field:text title="事務署名"
                id="toggle_checkbox_lowyar"
                hint="[O：弁護士]"
                name="formdata_checkbox.office">
    </field:text>
    <field:text title="日当"
                id="toggle_checkbox_piper"
                hint="[O：配管工]"
                name="formdata_checkbox.dailyPay">
    </field:text>
    <field:text title="アレルギー"
                id="toggle_checkbox_allergy"
                hint="[X:宇宙飛行士]"
                name="formdata_checkbox.allergy">
    </field:text>

    <field:text title="更新日"
                name="formdata_checkbox.before"
                disabled="true"
                hint="常に非活性">
    </field:text>
    </field:block>
    </tab:content>

    </tab:group>
    <button:block>
      <n:forInputPage>
        <button:check uri="./活性切替_確認画面.jsp">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel uri="./活性切替_登録画面.jsp">
        </button:cancel>
      </n:forConfirmationPage>
    </button:block>
  </n:form>
