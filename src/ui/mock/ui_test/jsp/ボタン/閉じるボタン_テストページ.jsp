<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


    <n:form>

      <tab:group name="tab">

      <c:if test="${not serverMode}">
        <tab:content title="クライアント" value="c">
          <span class="test-case">
            クライアントサイドで必須の値を全て指定
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case">
            サーバサイドで設定する値も含めて全ての値を設定
          </span>
          <button:block>
            <button:close
                label="画面を閉じる"
                size="4"
                cssClass="server"
                id="button-id"
                comment="イベント概要">
            </button:close>
          </button:block>
        </tab:content>
      </c:if>

        <tab:content title="サーバ・クライアント共通" value="cs" selected="true">
          <span class="test-case label-test">
            label属性を指定しない場合、ボタンのラベルには「閉じる」と表示されること
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case label-test">
            label属性にブランクを指定した場合、ボタンのラベルには「閉じる」と表示されること
          </span>
          <button:block>
            <button:close
                label="">
            </button:close>
          </button:block>

          <span class="test-case label-test">
            label属性を指定した場合、その値がラベルに表示されること
          </span>
          <button:block>
            <button:close
                label="終了">
            </button:close>
          </button:block>

          <span class="test-case id-test">
            id属性を指定しない場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case id-test">
            id属性にブランクを設定した場合、ボタンのid属性は設定されないこと
          </span>
          <button:block>
            <button:close id="">
            </button:close>
          </button:block>

          <span class="test-case id-test">
            id属性を設定した場合、そのidがボタンに設定されること
          </span>
          <button:block>
            <button:close id="close-id">
            </button:close>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassを設定しない場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassにブランクを設定した場合、ボタンのclass属性は設定されないこと
          </span>
          <button:block>
            <button:close cssClass="">
            </button:close>
          </button:block>

          <span class="test-case cssClass-test">
            cssClassを設定した場合、指定した値がボタンのclass属性に設定されること
          </span>
          <button:block>
            <button:close cssClass="button-white">
            </button:close>
          </button:block>

          <span class="test-case size-test">
            size属性を指定しない場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case size-test">
            size属性にブランクを指定した場合、ボタンのサイズはデフォルト値となること（class属性に指定されない)
          </span>
          <button:block>
            <button:close size="">
            </button:close>
          </button:block>

          <span class="test-case size-test">
            size属性を指定した場合、ボタンの幅が変わること
          </span>
          <button:block>
            <button:close size="6">
            </button:close>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性を指定しない場合、ボタンは使用可能な状態であること（クリックで画面を閉じれること）
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にブランクを指定した場合、ボタンは使用可能な状態であること（クリックで画面を閉じれること）
          </span>
          <button:block>
            <button:close
                disabled="">
            </button:close>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にfalseを指定した場合、ボタンは使用可能な状態であること（クリックで画面を閉じれること）
          </span>
          <button:block>
            <button:close
                disabled="false">
            </button:close>
          </button:block>

          <span class="test-case disabled-test">
            disabled属性にtrueを指定した場合、ボタンは使用不可であること（動作しない）
          </span>
          <button:block>
            <button:close
                disabled="true">
            </button:close>
          </button:block>


          <span class="test-case">
            buttonが閉じるボタンでない場合は閉じない
          </span>
          <button:block>
            <button:close>
            </button:close>
            <button:submit
                uri="./閉じるボタン.jsp"
                label="自画面へ">
            </button:submit>
          </button:block>

        </tab:content>

        <tab:content title="サーバサイド" value="s">
          <span class="test-case default_value-test">
            サーバサイドで必須となる属性を全て指定
          </span>
          <button:block>
            <button:close>
            </button:close>
          </button:block>

        </tab:content>
      </tab:group>

    </n:form>
