<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
      <field:block title="テキスト">
        <event:listen event="input change"><event:confirm message="テキストを変更しますか？"></event:confirm></event:listen>
        <field:text name="formdata.text1" title="テキスト1"></field:text>
        <field:text name="formdata.text2" title="テキスト2"></field:text>
        <field:text name="formdata.text3" title="テキスト3"></field:text>
      </field:block>
      <field:block title="テキストエリア">
        <event:listen event="textarea change"><event:confirm message="テキストエリアを変更しますか？"></event:confirm></event:listen>
        <field:textarea name="formdata.textarea1" title="テキストエリア1" rows="2"></field:textarea>
        <field:textarea name="formdata.textarea2" title="テキストエリア2" rows="2"></field:textarea>
        <field:textarea name="formdata.textarea3" title="テキストエリア3" rows="2"></field:textarea>
      </field:block>
      <field:block title="チェックボックス">
        <event:listen event="input change"><event:confirm message="チェックボックスを変更しますか？"></event:confirm></event:listen>
        <field:checkbox name="formdata.checkbox"
                        title="チェックボックス"
                        listName="userTypeList"
                        elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        sample="総務|経理|営業|人事" >
        </field:checkbox>
      </field:block>
      <field:block title="プルダウン">
        <event:listen event="select change"><event:confirm message="チェックボックスを変更しますか？"></event:confirm></event:listen>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="プルダウン1"
                        name="formdata.pulldown1"
                        sample="総務|経理|営業|人事"
                        withNoneOption="true">
        </field:pulldown>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="プルダウン2"
                        name="formdata.pulldown2"
                        sample="総務|経理|営業|人事"
                        withNoneOption="true">
        </field:pulldown>
        <field:pulldown elementValueProperty="ugroupName"
                        elementLabelProperty="ugroupName"
                        listName="userTypeList"
                        title="プルダウン3"
                        name="formdata.pulldown3"
                        sample="総務|経理|営業|人事"
                        withNoneOption="true">
        </field:pulldown>
      </field:block>
      <field:block title="ラジオボタン">
        <event:listen event="input:radio change"><event:confirm message="ラジオボタンを変更しますか？"></event:confirm></event:listen>
        <field:radio title="ラジオボタン1"
                     name="formdata.radio1"
                     listName="userTypeList"
                     elementValueProperty="ugroupName"
                     elementLabelProperty="ugroupName"
                     sample="総務|経理|営業|人事" >
        </field:radio>
        <field:radio title="ラジオボタン2"
                     name="formdata.radio2"
                     listName="userTypeList"
                     elementValueProperty="ugroupName"
                     elementLabelProperty="ugroupName"
                     sample="総務|経理|営業|人事" >
        </field:radio>
        <field:radio title="ラジオボタン3"
                     name="formdata.radio3"
                     listName="userTypeList"
                     elementValueProperty="ugroupName"
                     elementLabelProperty="ugroupName"
                     sample="総務|経理|営業|人事" >
        </field:radio>

      </field:block>


    <button:block>
      <n:forInputPage>
        <button:check uri="./リバート_テストケース_確認.jsp"></button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:back uri="./リバート_テストケース.jsp"></button:back>
      </n:forConfirmationPage>
    </button:block>
  </n:form>
