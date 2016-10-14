<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="table" tagdir="/WEB-INF/tags/widget/table" %>
<%@ taglib prefix="column" tagdir="/WEB-INF/tags/widget/column" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="listSearchResult" tagdir="/WEB-INF/tags/listSearchResult" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<n:form windowScopePrefixes="formdata">

  <box:content>
    <n:forInputPage>
      閉局するリクエストを選択してください。
    </n:forInputPage>
    <n:forConfirmationPage>
      以下の機能を閉局します。よろしいですか？
    </n:forConfirmationPage>
  </box:content>

    <table:treelist
      title="リクエストID一覧【先頭からの指定文字数で区切って階層化した場合】"
      name="formdata.blockOpenStatus"
      key="id"
      hierarchy="chars:6|2|2"
      resultSetName="searchResult"
      sampleResults="5">
    
      <column:label
        title="リクエストID"
        key="id"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA|RW11AA0101|RW11AA0102|RW11AB|RW11AB0101">
      </column:label>
      
      <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン機能|ログイン画面初期表示処理|ログイン処理|メニュー|メニュー表示処理">
      </column:label>

      <column:checkbox
        title="閉局中"
        name="formdata.availableRequestIds"
        key="id">
      </column:checkbox>

    </table:treelist>
    
    
    <table:treelist
      title="リクエストID一覧2【区切り文字によって階層構造を指定した場合】"
      name="formdata.blockOpenStatus2"
      key="id"
      hierarchy="separator:_"
      resultSetName="searchResult2"
      sampleResults="5">

      <column:label
        title="リクエストID"
        key="id"
        tree_indent="true"
        tree_toggler="true"
        sample="RW11AA_1_1|RW11AA_1_2|RW11AB_1_1|RW11AA|RW11AB">
      </column:label>
      
      <column:label
        title="リクエスト名"
        key="name"
        tree_indent="true"
        sample="ログイン画面初期表示処理|ログイン処理|メニュー表示処理|ログイン機能|メニュー">
      </column:label>

      <column:checkbox
        title="閉局中"
        key="id"
        name="formdata.availableRequestIds">
      </column:checkbox>

    </table:treelist>    


    <button:block>
      <n:forInputPage>
        <button:check uri="./確認画面.jsp" id="check">
        </button:check>
      </n:forInputPage>
      <n:forConfirmationPage>
        <button:cancel uri="./登録画面.jsp" id="cancel">
        </button:cancel>
      </n:forConfirmationPage>
    </button:block>
    
</n:form>
