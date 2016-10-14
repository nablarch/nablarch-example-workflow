<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <n:form windowScopePrefixes="formdata">
      <span class="test-case requireOnly">メッセージのBodyが出力されること。</span>
      <box:content>
        記載した内容がメッセージが出力されること。
      </box:content>

      <span class="test-case css-test">cssClass属性を指定しない場合のテスト</span>
      <box:content>
        classが出力されていないこと。(下線がないこと)
      </box:content>

      <span class="test-case css-test">cssClass属性がブランクの場合のテスト</span>
      <box:content cssClass="">
        classが出力されていないこと。(下線がないこと)
      </box:content>

      <span class="test-case css-test">cssClass属性がブランクの場合のテスト</span>
      <box:content cssClass="cssUnderline">
        classが出力されること。(下線があること)
      </box:content>

      <span class="test-case">field:blockと併用した場合のレイアウトの確認</span>
      <field:block title="適切な位置で改行されること。">
          <box:content>改行位置を確かめるのための文章です。ワイド表示の場合、コンパクト表示の場合、コンテンツ領域からはみ出してしまわないことを確認してください。ナロー表示の場合には、領域を小さくした場合にテキストが見切れないことを確認してください。</box:content>
      </field:block>
    </n:form>
