<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form>
      <tab:group name="tab">
        <tab:content title="クライアント" value="c">
          <span class="test-case">
            全属性を指定してもクライアントで表示されること
          </span>
          <field:file
              title="全て指定"
              name="全て指定"
              nameAlias="error"
              hint="ヒント部"
              domain="ドメイン"
              disabled="false"
              cssClass="border-blue"
              id="client"
              required="true">
          </field:file>
        </tab:content>
        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case required-test">
            required属性を指定しない場合、必須マークが出力されないこと
          </span>
          <field:file
              title="required未指定"
              name="required未指定">
          </field:file>

          <span class="test-case required-test">
            required属性にブランクを指定した場合、必須マークが出力されないこと
          </span>
          <field:file
              title="requiredブランク"
              name="requiredブランク"
              required="">
          </field:file>

          <span class="test-case required-test">
            required属性にfalseを指定した場合、必須マークが出力されないこと
          </span>
          <field:file
              title="required[false]"
              name="required_false"
              required="false">
          </field:file>

          <span class="test-case required-test">
            required属性にtrueを指定した場合、必須マークが出力されること
          </span>
          <field:file
              title="required[true](必須マークがタイトルの右側につくこと)"
              name="required_true"
              required="true">
          </field:file>

          <span class="test-case disabled-test">
            disabledを指定しない場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabled未指定"
              name="disabled未指定">
          </field:file>

          <span class="test-case disabled-test">
            disabledにブランクを指定した場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabledブランク"
              name="disabledブランク"
              disabled="">
          </field:file>

          <span class="test-case disabled-test">
            disabledにfalseを指定した場合、ファイル選択可能な状態であること
          </span>
          <field:file
              title="disabled[false]"
              name="disabled_false"
              disabled="false">
          </field:file>

          <span class="test-case disabled-test">
            disabledにtrueを設定した場合、ファイル選択が出来ないこと
          </span>
          <field:file
              title="disabled[true]"
              name="disabled_true"
              disabled="true">
          </field:file>

          <span class="test-case id-test">
            id属性を指定しない場合、name属性がid属性に設定されること（ソースで確認）
          </span>
          <field:file
              title="id未指定"
              name="id未指定">
          </field:file>

          <span class="test-case id-test">
            id属性にブランクを指定した場合、name属性がid属性に設定されること（ソースで確認）
          </span>
          <field:file
              title="idブランク"
              name="idブランク"
              id="">
          </field:file>

          <span class="test-case id-test">
            id属性を指定した場合、id属性にその値が設定されること（ソースで確認）
          </span>
          <field:file
              title="id設定"
              name="id設定"
              id="id.hoge">
          </field:file>

          <span class="test-case cssClass-test">
            cssClassを指定しない場合、class属性が設定されないこと（ソースで確認）
          </span>
          <field:file
              title="cssClass未指定"
              name="cssClass未指定">
          </field:file>

          <span class="test-case cssClass-test">
            cssClassにブランクを指定した場合、class属性が設定されないこと（ソースで確認）
          </span>
          <field:file
              title="cssClassブランク"
              name="cssClassブランク"
              cssClass="">
          </field:file>

          <span class="test-case cssClass-test">
            cssClassを指定した場合、その値がclass属性に設定されること
          </span>
          <field:file
              title="cssClass指定"
              name="cssClass指定"
              cssClass="border-blue">
          </field:file>

          <span class="test-case hint-test">
            hintを指定しない場合、ヒントは表示されないこと
          </span>
          <field:file
              title="hint未指定"
              name="hint未指定">
          </field:file>

          <span class="test-case hint-test">
            hintにブランクを指定した場合、ヒントは表示されないこと
          </span>
          <field:file
              title="hintブランク"
              name="hintブランク"
              hint="">
          </field:file>

          <span class="test-case hint-test">
            hintを指定した場合、その値がヒントに表示されること
          </span>
          <field:file
              title="hint指定(titleが折り返される)"
              name="hint指定"
              hint="ひんと">
          </field:file>

          <span class="test-case title-input-size">
            titleSizeとinputSizeが未指定の場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
          </span>
          <field:file
              title="titleSizeとinputSize未指定"
              name="titleInputSize1">
          </field:file>

          <span class="test-case title-input-size">
            titleSizeとinputSizeがブランクの場合、タイトル部と入力部ともにgrid-col関連のクラスが設定されないこと
          </span>
          <field:file
              title="titleSizeとinputSizeブランク"
              name="titleInputSize2"
              titleSize=""
              inputSize="">
          </field:file>

          <span class="test-case title-input-size">
            titleSizeとinputSizeをともに指定<br/>

            タイトル部(label)には、指定したグリッドサイズから「:」部のグリッド数が減算された値が設定されること
            入力部(div.field-contentには、指定したグリッド数がそのまま設定されること
          </span>
          <field:file
              title="titleSizeとinputSize指定"
              name="titleInputSize3"
              titleSize="12"
              inputSize="18">
          </field:file>

        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case">
            必須項目を全て設定
          </span>
          <field:file title="必須全て" name="必須全て">
          </field:file>

          <span class="test-case nameAlias-test">
            nameAliasを指定しない場合、ハイライト表示されないこと
          </span>
          <field:file title="nameAlias未指定" name="nameAlias未指定">
          </field:file>

          <span class="test-case nameAlias-test">
            nameAliasにブランクを指定した場合、ハイライト表示されないこと
          </span>
          <field:file title="nameAliasブランク" name="nameAliasブランク" nameAlias="">
          </field:file>

          <span class="test-case nameAlias-test">
            nameAliasにを指定した場合、ハイライト表示されること
          </span>
          <field:file title="nameAlias指定" name="nameAlias指定" nameAlias="error">
          </field:file>
        </tab:content>
      </tab:group>

      <button:block>
        <button:submit label="送信" uri="./単体テスト_登録.jsp"></button:submit>
      </button:block>
    </n:form>
