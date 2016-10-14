<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">
  <field:block title="プレースホルダーサンプル">
  
    <field:text
      title="テキスト1"
      id="text1"
      name="formdata.text1"
      maxlength="10"
      example="10文字まで入力できます。">
    </field:text>     
    
    <field:text
      title="テキスト2"
      id="text2"
      name="formdata.text2"
      maxlength="20"
      example="20文字まで入力できます。">
    </field:text>
    
    <field:text
      title="テキスト3"
      id="text3"
      name="formdata.text3"
      maxlength="256">
    </field:text>
    
    <field:textarea
      title="テキストエリア1"
      id="textarea1"
      name="formdata.textarea1"
      maxlength="30"
      example="30文字まで入力できます。">
    </field:textarea>
    
    <field:textarea
      title="テキストエリア2"
      id="textarea2"
      name="formdata.textarea2"
      example="40文字まで入力できます。"      
      maxlength="40">
    </field:textarea>
    
    <field:textarea
      title="テキストエリア3"
      id="textarea3"
      name="formdata.textarea3"
      maxlength="512">
    </field:textarea>
  </field:block>

  <button:block>
    <n:forInputPage>
      <button:check  id="check" uri="./確認画面.jsp">
      </button:check>
    </n:forInputPage>
      
    <n:forConfirmationPage>
      <button:cancel id="cancel" uri="./登録画面.jsp">
      </button:cancel>
    </n:forConfirmationPage>
  </button:block>
  
</n:form>
