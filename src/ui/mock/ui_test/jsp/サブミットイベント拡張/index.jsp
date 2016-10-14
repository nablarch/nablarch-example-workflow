<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="サブミットイベント拡張">

  <jsp:attribute name="contentHtml">
  <n:form>

    <field:block title="登録内容">
      <p>
        下記の内容を入力し、内容を確認後、送信ボタンを押して下さい。
      </p>
      <field:text
        title="秘密の質問"
        domain="全角"
        required="true"
        maxlength="100"
        hint="全角100文字以内"
        name="question">
      </field:text>

      <field:text
        title="質問の答え"
        domain="全角"
        required="true"
        maxlength="100"
        hint="全角100文字以内"
        name="answer">
      </field:text>

      <field:base
        title="確認"
        required="true"
        inputField="true">
        <jsp:attribute name="fieldContent">
        <input type="checkbox" id="confirmed" name="confirmed">
        </jsp:attribute>
      </field:base>

    </field:block>

    <button:block>
      <button:submit
        id="submitLink"
        icon="fa fa-bolt"
        label="送信(submitLink)"
        uri="./index.jsp"
        dummyUri="./index.jsp"
        size="5">
      </button:submit>

      <button:popup
        id="popupLink"
        icon="fa fa-external-link"
        label="送信(popupLink)"
        uri="./index.jsp"
        dummyUri="./index.jsp"
        popupWindowName="index_popup"
        size="5">
      </button:popup>

      <button:submit
        id="unittest"
        uri="./テストケース_イベント拡張.jsp"
        dummyUri="./テストケース_イベント拡張.jsp"
        label="自動テスト">
      </button:submit>
    </button:block>

  </n:form>
  </jsp:attribute>

  <jsp:attribute name="localJs">
    $(function() {"use strict";
      $("#submitLink").on("click",   validateInput);
      $(document).on("beforeSubmit", "#content", checkConfirmation)
                 .on("afterSubmit",  "#content", function(){alert("新しいウィンドウが開きました!")});
      // UNIT TEST へのボタンはダイアログ出さない。
      $("#unittest").on("click", function(){
        $('input').prop('checked', true).filter(':text').val('　');
      });

    });

    function validateInput() {"use strict";
      var trim     = $.trim
        , question = trim($("#question").val())
        , answer   = trim($("#answer").val())
        , isBlank  = (question.length == 0 || answer.length == 0);

      if (isBlank) {
        alert("入力されていない項目があります。");
        return false;
      }
    }

    function checkConfirmation() {"use strict";
      var confirmed = $("#confirmed:checked").length;
      if (!confirmed) {
        alert("入力内容を確認して確認欄にチェックを入れて下さい。");
        return false;
      }
    }
  </jsp:attribute>
</t:ui_test_template>
