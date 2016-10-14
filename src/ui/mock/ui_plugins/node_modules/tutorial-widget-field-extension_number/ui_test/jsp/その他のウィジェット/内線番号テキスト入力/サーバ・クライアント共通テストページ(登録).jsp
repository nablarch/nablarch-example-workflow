<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form name="text">

  <n:forInputPage>
    <input name="input" type="hidden" value="1" />
  </n:forInputPage>

  <field:block title="required属性">
    <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
    <field:extension_number
        title="required未指定"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty">
    </field:extension_number>
    <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
    <field:extension_number
        title="requiredブランク"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        required="">
    </field:extension_number>
    <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
    <field:extension_number
        title="required[false]"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        required="false">
    </field:extension_number>
    <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
    <field:extension_number
        title="required[true](必須マークがタイトルの右側につくこと)"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        required="true">
    </field:extension_number>
  </field:block>

  <field:block title="hint属性">
    <span class="test-case hint-test">hint属性を指定しない場合、hintが出力されないこと</span>
    <field:extension_number
        title="hint未指定"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty">
    </field:extension_number>
    <span class="test-case hint-test">hint属性にブランクを指定した場合、hintが出力されないこと</span>
    <field:extension_number
        title="hintブランク"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        hint="">
    </field:extension_number>
    <span class="test-case hint-test">入力画面では、hint属性に指定した値が出力されること。確認画面では出力されないこと。</span>
    <field:extension_number
        title="hint指定"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        hint="hint属性を指定">
    </field:extension_number>
    <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
    <field:extension_number
        title="タイトル属性に長い文言を設定することで折り返す"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        hint="hint属性を指定">
    </field:extension_number>
  </field:block>

  <field:block title="readonly属性">
    <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能であること</span>
    <field:extension_number
        title="readonly未指定"
        builName="server.builNo-readonly-none"
        personalName="server.personalNo-readonly-none">
    </field:extension_number>
    <span class="test-case readonly-test">readonly属性にブランクを指定した場合、編集可能であること</span>
    <field:extension_number
        title="readonlyブランク"
        builName="server.builNo-readonly-blank"
        personalName="server.personalNo-readonly-blank"
        readonly="">
    </field:extension_number>
    <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能であること</span>
    <field:extension_number
        title="readonly[false]"
        builName="server.builNo-readonly-false"
        personalName="server.personalNo-readonly-false"
        readonly="false">
    </field:extension_number>
    <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可であること</span>
    <field:extension_number
        title="readonly[true]"
        builName="server.builNo-readonly"
        personalName="server.personalNo-readonly"
        readonly="true"
        hint="入力値はサーバに送信され確認画面に表示されること">
    </field:extension_number>
  </field:block>

  <field:block title="disabled属性">
    <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能でサーバに値が送信されること</span>
    <field:extension_number
        title="disabled未指定"
        builName="server.builNo-disabled-none"
        personalName="server.personalNo-disabled-none">
    </field:extension_number>
    <span class="test-case disabled-test">disabled属性にブランクを指定した場合、編集可能でサーバに値が送信されること</span>
    <field:extension_number
        title="disabledブランク"
        builName="server.builNo-disabled-blank"
        personalName="server.personalNo-disabled-blank"
        disabled="">
    </field:extension_number>
    <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能でサーバに値が送信されること</span>
    <field:extension_number
        title="disabled[false]"
        builName="server.builNo-disabled-false"
        personalName="server.personalNo-disabled-false"
        disabled="false">
    </field:extension_number>
    <span class="test-case disabled-test">disabled属性にtrueを指定した場合、編集不可でサーバに値が送信されないこと</span>
    <field:extension_number
        title="disabled[true]"
        builName="server.builNo-disabled"
        personalName="server.personalNo-disabled"
        disabled="true">
    </field:extension_number>
  </field:block>

  <field:block title="id属性">
    <span class="test-case id-test">id属性を指定しない場合、対応する入力欄のname属性の値がid属性に設定されること</span>
    <field:extension_number
        title="id未指定"
        builName="server.builNo-id"
        personalName="server.personalNo-id">
    </field:extension_number>
    <span class="test-case id-test">id属性にブランクを指定した場合、対応する入力欄のname属性の値がid属性に設定されること</span>
    <field:extension_number
        title="idブランク"
        builName="server.builNo-id"
        personalName="server.personalNo-id"
        id="">
    </field:extension_number>
    <span class="test-case id-test">idを指定した場合、その値がid属性に設定されること</span>
    <field:extension_number
        title="id指定"
        builName="server.builNo-id"
        personalName="server.personalNo-id"
        id="test-id">
    </field:extension_number>
  </field:block>

  <field:block title="cssClass属性">
    <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性にはウィジェットで指定のクラス以外設定されないこと（ソースにて確認）</span>
    <field:extension_number
        title="cssClass未指定"
        builName="server.builNo-cssClass"
        personalName="server.personalNo-cssClass">
    </field:extension_number>
    <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性にはウィジェットで指定のクラス以外設定されないこと（ソースにて確認）</span>
    <field:extension_number
        title="cssClassブランク"
        builName="server.builNo-cssClass"
        personalName="server.personalNo-cssClass"
        cssClass="">
    </field:extension_number>
    <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性にその値が設定されること</span>
    <field:extension_number
        title="cssClass指定"
        builName="server.builNo-cssClass"
        personalName="server.personalNo-cssClass"
        cssClass="border-blue">
    </field:extension_number>
  </field:block>

  <field:block title="sample属性">
    <span class="test-case sample-test">sample属性を指定しない場合、初期表示で値は出力されないこと</span>
    <field:extension_number
        title="sample未指定"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty">
    </field:extension_number>
    <span class="test-case sample-test">sample属性にブランクを指定した場合、初期表示で値は出力されないこと</span>
    <field:extension_number
        title="sampleブランク"
        builName="server.builNo-empty"
        sample=""
        personalName="server.personalNo-empty">
    </field:extension_number>
    <span class="test-case sample-test">sample属性を指定した場合、クライアントの場合のみ指定した値が初期表示されること</span>
    <field:extension_number
        title="sample指定"
        builName="server.builNo-empty"
        personalName="server.personalNo-empty"
        sample="12-3456">
    </field:extension_number>
  </field:block>


  <button:block>
    <n:forInputPage>
      <button:check
          uri="サーバ・クライアント共通テストページ(確認).jsp"
          dummyUri="サーバ・クライアント共通テストページ(確認).jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./サーバ・クライアント共通テストケース.jsp"
          dummyUri="サーバ・クライアント共通テストケース.jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
</n:form>
