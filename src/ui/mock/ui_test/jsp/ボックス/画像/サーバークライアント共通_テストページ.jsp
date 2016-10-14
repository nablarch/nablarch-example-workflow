<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="box" tagdir="/WEB-INF/tags/widget/box" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <span class="test-case requireTest">必須属性のテスト<br>
    background-imageで表示されること<br>
    narrow&lt;=&gt;compact, wideで画像が切り替わる<br>
    imageのサイズが適切に変更されること
    </span>

    <box:img id="logo_test" file="test.png"></box:img>

    <span class="test-case cssClassTest">cssClassを指定しない場合、ウィジェットのラッパにクラスが出力されないこと</span>
    <box:img id="html_test_css_default"
             file="test_html.jpg">
    </box:img>
    <span class="test-case cssClassTest">cssClassがブランクの場合、ウィジェットのラッパにクラスが出力されないこと</span>
    <box:img id="html_test_css_blank"
             file="test_html.jpg"
             cssClass="">
    </box:img>
    <span class="test-case cssClassTest">cssClassを指定した場合、ウィジェットのラッパにクラスが出力されること</span>
    <box:img id="html_test_css"
             file="test_html.jpg"
             cssClass="cssBorder">
    </box:img>

    <span class="test-case fileTest">file指定したパスが利用されること。</span>
    <box:img id="owner_test"
             file="test_owner.png">
    </box:img>



