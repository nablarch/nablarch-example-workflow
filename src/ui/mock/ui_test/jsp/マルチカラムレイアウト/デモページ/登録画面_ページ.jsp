<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/widget/layout" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="user">
  <n:set var="titleSize" value="10" />
  <n:set var="inputSize" value="10" />
  <tab:group name="userTab">
    <tab:content title="ユーザ情報" value="userInfo" selected="true">
      <layout:row>
        <layout:cell gridSize="20">
          <layout:row>
            <field:text
                title="漢字氏名"
                name="user.kanjiName"
                required="true"
                titleSize="${titleSize}"
                inputSize="${inputSize}">
            </field:text>
          </layout:row>
          <layout:row>
            <field:text
                title="カナ氏名"
                name="user.kanaName"
                required="true"
                titleSize="${titleSize}"
                inputSize="${inputSize}">
            </field:text>
          </layout:row>

        </layout:cell>
        <field:radio
            title="性別"
            name="user.sex"
            required="true"
            listName="sexList"
            listFormat="br"
            elementLabelProperty="name"
            elementValueProperty="cd"
            titleSize="${titleSize}"
            inputSize="${inputSize}" />
      </layout:row>

      <layout:row>
        <field:text
            title="郵便番号"
            required="true"
            name="user.postNo"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
        <layout:cell gridSize="10" />
        <n:forInputPage>
          <button:submit label="住所検索" uri="dummy" size="10" />
        </n:forInputPage>
      </layout:row>

      <layout:row>
        <field:pulldown
            title="都道府県"
            name="user.address1"
            required="true"
            listName="都道府県リスト"
            elementLabelProperty="name"
            elementValueProperty="cd"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:pulldown>
        <field:text
            title="市区郡町村名"
            name="user.address2"
            required="true"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
      </layout:row>

      <layout:row>
        <field:text
            title="住所(丁目以降)"
            name="user.address3"
            required="true"
            titleSize="${titleSize}"
            inputSize="${inputSize}" />
        <field:text
            title="マンション名（部屋番号）"
            name="user.address4"
            titleSize="${titleSize}"
            inputSize="${inputSize}" />
      </layout:row>
      
      <layout:row>
        <field:text
            title="メールアドレス"
            name="user.mail"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
        <field:text
            title="確認用"
            name="user.confirmMail"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
      </layout:row>
    </tab:content>
    <tab:content title="勤務先情報" value="officeInfo">
      <layout:row>
        <field:text
            title="勤務先名"
            name="user.officeName"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
        <field:text
            title="勤務先名(カナ)"
            name="user.officeKanaName"
            titleSize="${titleSize}"
            inputSize="${inputSize}">
        </field:text>
      </layout:row>
    </tab:content>
  </tab:group>

  <layout:row>
    <n:forInputPage>
      <layout:cell gridSize="17">
      </layout:cell>
      <button:check
          size="10"
          uri="./確認画面_ページ.jsp"/>
    </n:forInputPage>
    <n:forConfirmationPage>
      <layout:cell gridSize="10" />
      <button:back uri="./登録画面.jsp" size="10" />
      <layout:cell gridSize="5" />
      <button:confirm uri="dummy" size="10" />
    </n:forConfirmationPage>
  </layout:row>
</n:form>
