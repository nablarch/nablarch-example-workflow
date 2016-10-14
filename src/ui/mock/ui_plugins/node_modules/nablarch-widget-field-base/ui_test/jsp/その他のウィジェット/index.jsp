<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <%/* --> <script src="js/devtool.js"></script><meta charset="utf-8"><body> <!-- */%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>
<%@ taglib prefix="link" tagdir="/WEB-INF/tags/widget/link" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:ui_test_template title="その他のウィジェット">
  <jsp:attribute name="contentHtml">

  <n:form>

    <table style="width: 90%;">
      <tr>
        <th>ウィジェット</th>
        <th>サーバサイド</th>
        <th>サーバ・クライアント共通</th>
        <th>クライアント</th>
      </tr>
      <tr>
        <td>単行テキスト入力</td>
        <td>
          <link:submit uri="./単行テキスト入力/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./単行テキスト入力/サーバ・クライアント共通テストケース.jsp" dummyUri="./単行テキスト入力/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./単行テキスト入力/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>複数行テキスト入力</td>
        <td>
          <link:submit uri="./複数行テキスト入力/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./複数行テキスト入力/サーバ・クライアント共通テストケース.jsp" dummyUri="./複数行テキスト入力/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./複数行テキスト入力/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>パスワード入力</td>
        <td>
          <link:submit uri="./パスワード入力/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./パスワード入力/サーバ・クライアント共通テストケース.jsp" dummyUri="./パスワード入力/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./パスワード入力/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>チェックボックス</td>
        <td>
          <link:submit uri="./チェックボックス/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./チェックボックス/サーバ・クライアント共通テストケース.jsp" dummyUri="./チェックボックス/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./チェックボックス/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>ラジオボタン</td>
        <td>
          <link:submit uri="./ラジオボタン/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./ラジオボタン/サーバ・クライアント共通テストケース.jsp" dummyUri="./ラジオボタン/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./ラジオボタン/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>プルダウン</td>
        <td>
          <link:submit uri="./プルダウン/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./プルダウン/サーバ・クライアント共通テストケース.jsp" dummyUri="./プルダウン/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./プルダウン/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>コード値チェックボックス</td>
        <td>
          <link:submit uri="./コード値チェックボックス/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./コード値チェックボックス/サーバ・クライアント共通テストケース.jsp" dummyUri="./コード値チェックボックス/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./コード値チェックボックス/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>コード値ラジオボタン</td>
        <td>
          <link:submit uri="./コード値ラジオボタン/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./コード値ラジオボタン/サーバ・クライアント共通テストケース.jsp" dummyUri="./コード値ラジオボタン/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./コード値ラジオボタン/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>コード値プルダウン</td>
        <td>
          <link:submit uri="./コード値プルダウン/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./コード値プルダウン/サーバ・クライアント共通テストケース.jsp" dummyUri="./コード値プルダウン/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./コード値プルダウン/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>ラベル表示</td>
        <td>
          <link:submit uri="./ラベル表示/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./ラベル表示/サーバ・クライアント共通テストケース.jsp" dummyUri="./ラベル表示/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./ラベル表示/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>ラベルブロック</td>
        <td>
          -
        </td>
        <td>
          <link:submit uri="./ラベルブロック/サーバ・クライアント共通テストケース.jsp" dummyUri="./ラベルブロック/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          -
        </td>
      </tr>
      <tr>
        <td>コード値ラベル</td>
        <td>
          <link:submit uri="./コード値ラベル/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./コード値ラベル/サーバ・クライアント共通テストケース.jsp" dummyUri="./コード値ラベル/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./コード値ラベル/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>IDとラベル表示</td>
        <td>
          <link:submit uri="./IDとラベル表示/サーバサイドテストケース.jsp" dummyUri="javascript:alert('サーバサイドでテストを行ってください')" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="./IDとラベル表示/サーバ・クライアント共通テストケース.jsp" dummyUri="./IDとラベル表示/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>
          <link:submit uri="javascript:alert('クライアントサイドでテストを行ってください')" dummyUri="./IDとラベル表示/クライアントサイドテストケース.jsp" label="テストページへ" />
        </td>
      </tr>
      <tr>
        <td>単独ヒント</td>
        <td>-</td>
        <td>
          <link:submit uri="./単独ヒント/サーバ・クライアント共通テストケース.jsp" dummyUri="./単独ヒント/サーバ・クライアント共通テストケース.jsp" label="テストページへ" />
        </td>
        <td>-</td>
      </tr>
    </table>

    <box:title>
      その他のテスト(整理されていないもの)
    </box:title>

    <box:content>
      <ul>
        <li><link:submit uri="./ID入力_登録.jsp" dummyUri="./ID入力_登録.jsp" label="ID入力フィールドサンプル" /></li>
      </ul>

      <ul>
        <li><link:submit uri="./フィールドブロック_テストケース.jsp" dummyUri="./フィールドブロック_テストケース.jsp" label="フィールドブロック" /></li>
      </ul>
    </box:content>
  </n:form>
  </jsp:attribute>
</t:ui_test_template>
