<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form windowScopePrefixes="formdata">
        
    <field:block title="権限情報">
      
      <field:listbuilder
        title="認可単位"
        name="formdata.permissionUnits"
        id="permissionUnit"
        listName="allPermissionUnit"
        elementLabelProperty="permissionUnitName"
        elementValueProperty="permissionUnitId"
        sample="システム管理者|[債権担当]|コールセンター">
      </field:listbuilder>

      <field:listbuilder
        title="所属部署"
        name="formdata.groups"
        id="groups"
        listName="allGroup"
        elementLabelProperty="ugroupName"
        elementValueProperty="ugroupId"
        sample="[人事部]|[融資部]">
      </field:listbuilder>
      
    </field:block>

    <button:block>
      <n:forInputPage>
        <button:check uri="./確認画面.jsp" id="check" dummyUri="確認画面.jsp">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel  uri="./登録画面.jsp"  id="cancel" dummyUri="登録画面.jsp">
        </button:cancel>
      </n:forConfirmationPage>
    </button:block>
    
    </n:form>
