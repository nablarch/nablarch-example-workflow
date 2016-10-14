<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form>

  <n:forInputPage>
    <input type="hidden" name="input" value="1" />
  </n:forInputPage>

  <field:block title="必須属性(必須の属性はここで纏めてテスト)">
    <span class="test-case required">サーバサイドで必須の値を設定</span>
    <field:tel
        title="必須属性のテスト"
        areaName="server.tel-area"
        localName="server.tel-local"
        subscriberName="server.tel-subscriber">
    </field:tel>
  </field:block>

  <field:block title="nameAlias属性">
    <span class="test-case nameAlias-nothing">nameAlias属性を指定しない場合、各属性のメッセージが出力されること。</span>
    <field:tel
        title="nameAlias未指定"
        areaName="server.tel-area-error"
        localName="server.tel-local-error"
        subscriberName="server.tel-subscriber-error"
        hint="各属性に対応したエラーメッセージが出力される">
    </field:tel>
    <span class="test-case nameAlias-blank">nameAlias属性にブランクを指定した場合、各属性のメッセージが出力されること。</span>
    <field:tel
        title="nameAliasブランク"
        areaName="server.tel-area-error"
        localName="server.tel-local-error"
        subscriberName="server.tel-subscriber-error"
        nameAlias=""
        hint="各属性に対応したエラーメッセージが出力される">
    </field:tel>
    <span class="test-case nameAlias">nameAlias属性を指定した場合、nameAlias属性に対応したメッセージが出力される</span>
    <field:tel
        title="nameAlias指定"
        areaName="server.tel-area-1"
        localName="server.tel-local-1"
        subscriberName="server.tel-subscriber-1"
        nameAlias="tel">
    </field:tel>
    <span class="test-case viewonly">ラベルが改行されてもエラー項目が正しく表示されること。</span>
    <field:tel
        title="目的はエラー項目の位置までタイトルを表示することなので長いタイトル属性を設定する。"
        areaName="server.tel-area-error"
        localName="server.tel-local-error"
        subscriberName="server.tel-subscriber-error"
        nameAlias="">
    </field:tel>
  </field:block>

  <field:block title="編集仕様">
    <span class="test-case format-all">全ての要素が入力されている場合、確認画面には「-」区切りでフォーマットされて表示されること</span>
    <field:tel
        title="全ての要素を入力"
        areaName="server.tel-area-format"
        localName="server.tel-local-format"
        subscriberName="server.tel-subscriber-format">
    </field:tel>
    <span class="test-case format-all-blank">全ての要素が未入力の場合、確認画面には何も表示されないこと</span>
    <field:tel
        title="全ての要素を未入力"
        areaName="server.tel-area-empty"
        localName="server.tel-local-empty"
        subscriberName="server.tel-subscriber-empty">
    </field:tel>
    <span class="test-case format-area">市外局番のみ入力されている場合、確認画面には何も表示されないこと</span>
    <field:tel
        title="市外局番のみ入力"
        areaName="server.tel-area-only"
        localName="server.tel-local-empty"
        subscriberName="server.tel-subscriber-empty">
    </field:tel>
    <span class="test-case format-local">市内局番のみ入力されている場合、確認画面には何も表示されないこと</span>
    <field:tel
        title="市外局番のみ入力"
        areaName="server.tel-area-empty"
        localName="server.tel-local-only"
        subscriberName="server.tel-subscriber-empty">
    </field:tel>
    <span class="test-case">加入者番号のみ入力されている場合、確認画面には何も表示されないこと</span>
    <field:tel
        title="加入者番号のみ入力"
        areaName="server.tel-area-empty"
        localName="server.tel-local-empty"
        subscriberName="server.tel-subscriber-only">
    </field:tel>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check
          uri="./サーバサイドテストページ(確認).jsp"
          dummyUri="サーバサイドテストページ(確認).jsp">
      </button:check>
    </n:forInputPage>
    <n:forConfirmationPage>
      <button:back
          uri="./サーバサイドテストケース.jsp"
          dummyUri="サーバサイドテストページ(登録).jsp">
      </button:back>
    </n:forConfirmationPage>
  </button:block>
</n:form>
