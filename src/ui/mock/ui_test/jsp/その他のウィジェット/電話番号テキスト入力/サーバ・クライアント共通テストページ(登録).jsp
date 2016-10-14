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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form name="text">

<n:forInputPage>
  <input name="input" type="hidden" value="1"/>
</n:forInputPage>

<field:block title="required属性">
  <span class="test-case required-test">required属性を指定しない場合、必須マークが出力されないこと</span>
  <field:tel
      title="required未指定"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber">
  </field:tel>
  <span class="test-case required-test">required属性にブランクを指定した場合、必須マークが出力されないこと</span>
  <field:tel
      title="requiredブランク"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      required="">
  </field:tel>
  <span class="test-case required-test">required属性にfalseを指定した場合、必須マークが出力されないこと</span>
  <field:tel
      title="required[false]"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      required="false">
  </field:tel>
  <span class="test-case required-test">required属性にtrueを指定した場合、入力画面では必須マークが出力されること（確認画面では表示されない）</span>
  <field:tel
      title="required[true](必須マークがタイトルの右側につくこと)"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      required="true">
  </field:tel>
</field:block>

<field:block title="hint属性">
  <span class="test-case hint-test">hint属性を指定しない場合、hintが出力されないこと</span>
  <field:tel
      title="hint未指定"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber">
  </field:tel>
  <span class="test-case hint-test">hint属性にブランクを指定した場合、hintが出力されないこと</span>
  <field:tel
      title="hintブランク"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      hint="">
  </field:tel>
  <span class="test-case hint-test">入力画面では、hint属性に指定した値が出力されること。確認画面では出力されないこと。</span>
  <field:tel
      title="hint指定"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      hint="ヒントが出力される">
  </field:tel>
  <span class="test-case viewonly">ラベルが折り返した場合でも、hint属性が入力エリアの直下に左揃えで出力されること。確認画面では出力されないこと。</span>
  <field:tel
      title="タイトル属性に長い文言を設定することで折り返す"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      hint="ヒントが出力される">
  </field:tel>
</field:block>

<field:block title="readonly属性">
  <span class="test-case readonly-test">readonly属性を指定しない場合、編集可能であること</span>
  <field:tel
      title="readonly未指定"
      areaName="server.tel-area-readonly-none"
      localName="server.tel-local-readonly-none"
      subscriberName="server.tel-subscriber-readonly-none">
  </field:tel>
  <span class="test-case readonly-test">readonly属性にブランクを指定した場合、編集可能であること</span>
  <field:tel
      title="readonlyブランク"
      areaName="server.tel-area-readonly-blank"
      localName="server.tel-local-readonly-blank"
      subscriberName="server.tel-subscriber-readonly-blank"
      readonly="">
  </field:tel>
  <span class="test-case readonly-test">readonly属性にfalseを指定した場合、編集可能であること</span>
  <field:tel
      title="readonly[false]"
      areaName="server.tel-area-readonly-false"
      localName="server.tel-local-readonly-false"
      subscriberName="server.tel-subscriber-readonly-false"
      readonly="false">
  </field:tel>
  <span class="test-case readonly-test">readonly属性にtrueを指定した場合、編集不可であること</span>
  <field:tel
      title="readonly[true]"
      areaName="server.tel-area-readonly-true"
      localName="server.tel-local-readonly-true"
      subscriberName="server.tel-subscriber-readonly-true"
      hint="サーバに値は送信され、確認画面に表示されること"
      readonly="true">
  </field:tel>
</field:block>

<field:block title="disabled属性">
  <span class="test-case disabled-test">disabled属性を指定しない場合、編集可能でサーバに値が送信されること</span>
  <field:tel
      title="disabled未指定"
      areaName="server.tel-area-disabled-none"
      localName="server.tel-local-disabled-none"
      subscriberName="server.tel-subscriber-disabled-none"
      hint="確認画面に入力値が表示されること">
  </field:tel>
  <span class="test-case disabled-test">disabled属性にブランクを指定した場合、編集可能でサーバに値が送信されること</span>
  <field:tel
      title="disabledブランク"
      areaName="server.tel-area-disabled-blank"
      localName="server.tel-local-disabled-blank"
      subscriberName="server.tel-subscriber-disabled-blank"
      disabled=""
      hint="確認画面に入力値が表示されること">
  </field:tel>
  <span class="test-case disabled-test">disabled属性にfalseを指定した場合、編集可能でサーバに値が送信されること</span>
  <field:tel
      title="disabled[false]"
      areaName="server.tel-area-disabled-false"
      localName="server.tel-local-disabled-false"
      subscriberName="server.tel-subscriber-disabled-false"
      disabled=""
      hint="確認画面に入力値が表示されること">
  </field:tel>
  <span class="test-case disabled-test">disabled属性にtrueを指定した場合、編集不可でサーバに値が送信されないこと</span>
  <field:tel
      title="disabled[true]"
      areaName="server.tel-area-disabled"
      localName="server.tel-local-disabled"
      subscriberName="server.tel-subscriber-disabled"
      disabled="true"
      hint="確認画面に入力値は表示されないこと">
  </field:tel>
</field:block>

<field:block title="id属性">
  <span class="test-case id-test">id属性を指定しない場合、対応する入力欄のname属性の値がid属性に設定されること</span>
  <field:tel
      title="id未指定"
      areaName="server.tel-area-id"
      localName="server.tel-local-id"
      subscriberName="server.tel-subscriber-id">
  </field:tel>
  <span class="test-case id-test">id属性にブランクを指定した場合、対応する入力欄のname属性の値がid属性に設定されること</span>
  <field:tel
      title="idブランク"
      areaName="server.tel-area-id"
      localName="server.tel-local-id"
      subscriberName="server.tel-subscriber-id"
      id="">
  </field:tel>
  <span class="test-case id-test">idを指定した場合、その値がid属性に設定されること</span>
  <field:tel
      title="id指定"
      areaName="server.tel-area-id"
      localName="server.tel-local-id"
      subscriberName="server.tel-subscriber-id"
      id="tel">
  </field:tel>
</field:block>

<field:block title="cssClass属性">
  <span class="test-case cssClass-test">cssClass属性を指定しない場合、class属性にはウィジェットで指定のクラス以外設定されないこと（ソースにて確認）</span>
  <field:tel
      title="cssClass未指定"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber">
  </field:tel>
  <span class="test-case cssClass-test">cssClass属性にブランクを指定した場合、class属性にはウィジェットで指定のクラス以外設定されないこと（ソースにて確認）</span>
  <field:tel
      title="cssClassブランク"
      areaName="server.tel-area"
      localName="server.tel-local"
      subscriberName="server.tel-subscriber"
      cssClass="">
  </field:tel>
  <span class="test-case cssClass-test">cssClass属性を指定した場合、class属性にその値が設定されること</span>
  <field:tel
      title="cssClass指定"
      areaName="server.tel-area"
      localName="server.tel-local"
      cssClass="border-blue"
      subscriberName="server.tel-subscriber">
  </field:tel>
</field:block>

<field:block title="sample属性">
  <span class="test-case sample-test">sample属性を指定しない場合、初期表示で値は出力されないこと</span>
  <field:tel
      title="sample未指定"
      areaName="server.tel-area-empty"
      localName="server.tel-local-empty"
      subscriberName="server.tel-subscriber-empty">
  </field:tel>
  <span class="test-case sample-test">sample属性にブランクを指定した場合、初期表示で値は出力されないこと</span>
  <field:tel
      title="sampleブランク"
      areaName="server.tel-area-empty"
      localName="server.tel-local-empty"
      subscriberName="server.tel-subscriber-empty"
      sample="">
  </field:tel>
  <span class="test-case sample-test">sample属性を指定した場合、クライアントの場合のみ指定した値が初期表示されること</span>
  <field:tel
      title="sample指定"
      areaName="server.tel-area-empty"
      localName="server.tel-local-empty"
      subscriberName="server.tel-subscriber-empty"
      sample="090-1234-1234"
      hint="サーバサイドで実行した場合は、サンプル値が表示されないこと">
  </field:tel>
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

