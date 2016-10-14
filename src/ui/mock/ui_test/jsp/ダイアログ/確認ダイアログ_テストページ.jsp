<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="n" uri="http://tis.co.jp/nablarch" %>
<%@ taglib prefix="field" tagdir="/WEB-INF/tags/widget/field" %>
<%@ taglib prefix="button" tagdir="/WEB-INF/tags/widget/button" %>
<%@ taglib prefix="tab" tagdir="/WEB-INF/tags/widget/tab" %>
<%@ taglib prefix="event" tagdir="/WEB-INF/tags/widget/event" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/template" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <n:form windowScopePrefixes="formdata">
    <tab:group name="tab">
    <tab:content
      title="クライアント&サーバー"
      selected="true"
      value="tab-baseinfo">
      <span class="test-case require-only">必須条件のみの場合、ダイアログが表示されること。</span>
       <event:listen event="#requiredOnly change" comment="必須条件のみ指定を変更時に警告を表示する。">
        <event:confirm message="条件ない場合は必ず表示されること。"></event:confirm>
      </event:listen>
      <field:text id="requiredOnly"
                  title="必須条件のみ指定"
                  hint="必須のみ指定"
                  name="formdata.required"
                  sample="test01">
      </field:text>
      <span class="test-case conditional">条件が指定された場合、条件に一致する場合のみダイアログが表示されること。<br>(value = nablarch)</span>
      <event:listen event='#conditional change'>
        <event:confirm
           message="条件を指定した場合は一致した場合のみ、ダイアログが表示される。"
           condition=":is-value(nablarch)">
        </event:confirm>
      </event:listen>
      <field:text id="conditional"
                  title="条件指定"
                  hint="条件指定('nablarch'でダイアログ)"
                  name="formdata.conditional"
                  sample="test01">
      </field:text>

      <span class="test-case otherTarget">ダイアログの条件の対象を指定した場合、指定した対象の状態でダイアログが表示されること。</span>
      <event:listen event='#setTarget change'>
        <event:confirm
          message="別の要素を対象に指定する。別要素が空の場合はダイアログが表示される。"
          target='#target'
          condition=":is-blank">
        </event:confirm>
      </event:listen>
      <field:text id="setTarget"
                  title="別要素を条件に指定"
                  name="formdata.setTarget"
                  sample="test01">
      </field:text>
      <field:text id="target"
                  title="別要素"
                  hint="別要素が空の場合、ダイアログ表示"
                  name="formdata.target"
                  sample="test01">
      </field:text>

      <span class="test-case stop">stopを指定しない場合は、ダイアログが表示され、キャンセルされたら後続のアクションは動作しないこと</span>
      <event:listen event='#toggle_stop_select_default change'>
        <event:confirm
          message="stopを指定していないため、キャンセルされた場合、動作確認用のメッセージは表示されない"
          condition=":is-value(総務)">
        </event:confirm>
        <event:confirm message="動作確認用のメッセージです。" revert="false"></event:confirm>
      </event:listen>

      <field:pulldown elementValueProperty="ugroupName"
                      elementLabelProperty="ugroupName"
                      listName="userTypeList"
                      title="stop=none"
                      hint="総務では動作確認用メッセージが表示されない"
                      name="formdata.userDept"
                      sample="総務|経理|営業|人事"
                      withNoneOption="true"
                      id="toggle_stop_select_default">
      </field:pulldown>
      <span class="test-case stop">stopをtrueで指定した場合、ダイアログが表示されたら、キャンセルされたら後続のアクションが動作しないこと</span>
      <event:listen event='#stop_true change'>
        <event:confirm
          message="stopにtrueを指定しているため、このメッセージが表示されれば、表示されない。"
          condition=":is-value(総務)"
          stop="true" />
        <event:confirm message="動作確認用のメッセージです。" revert="false"></event:confirm>
      </event:listen>
      <field:pulldown elementValueProperty="ugroupName"
                      elementLabelProperty="ugroupName"
                      listName="userTypeList"
                      title="stop=true"
                      hint="総務では動作確認用メッセージが表示されない"
                      name="formdata.userDept"
                      sample="総務|経理|営業|人事"
                      withNoneOption="true"
                      id="stop_true">
      </field:pulldown>
      <span class="test-case stop">stopをfalseで指定した場合、ダイアログが表示され、キャンセルされても、後続のアクションが動作すること</span>
      <event:listen event='#stop_false change'>
        <event:confirm
          message="stopにfalseを指定しているため、このメッセージが表示されても、必ず後続のメッセージが表示される"
          condition=":is-value(総務)"
          stop="false">
        </event:confirm>
        <event:confirm message="動作確認用のメッセージです。" revert="false"></event:confirm>
      </event:listen>
      <field:pulldown elementValueProperty="ugroupName"
                      elementLabelProperty="ugroupName"
                      listName="userTypeList"
                      title="stop=false"
                      hint="動作確認用のメッセージが必ず表示"
                      name="formdata.userDept"
                      sample="総務|経理|営業|人事"
                      withNoneOption="true"
                      id="stop_false">
      </field:pulldown>


      <span class="test-case revert">revertを指定しない場合、ダイアログが表示され、キャンセルされたら値が戻ること。OKされたら戻らないこと。</span>
      <event:listen event='#revert_default change'>
        <event:confirm
          message="revertがデフォルトなので、ダイアログ表示後にキャンセルすれば、データが戻る"
          condition=":is-value(nablarch, ssd, password)"/>
      </event:listen>
      <field:text title="revert=default"
                  id="revert_default"
                  name="formdata.revertText"
                  hint="nablarch, ssd, passwordを入れるとダイアログが出る。"
                  sample="nablarch|ssd|password">
      </field:text>

      <span class="test-case revert">revertにtrueを指定した場合、ダイアログが表示され、キャンセルされたら値が戻ること。OKされたら戻らないこと。</span>
      <event:listen event='#revert_true change'>
        <event:confirm
          message="revertがtrueなので、ダイアログ表示後、キャンセルすれば、データが戻る"
          condition=":is-value(nablarch, ssd, password)"
          revert="true"/>
      </event:listen>
      <field:text title="revert=true"
                  id="revert_true"
                  name="formdata.revertText"
                  hint="nablarch, ssd, passwordを入れるとダイアログが出る。"
                  sample="nablarch|ssd|password">
      </field:text>
      <span class="test-case revert">revertにfalseを指定した場合、ダイアログが表示され、キャンセルされても値が戻らないこと。OKされても戻らないこと。</span>
      <event:listen event='#revert_false change'>
        <event:confirm
          message="revertがfalseなので、ダイアログ表示後、キャンセルしてもデータが戻らない"
          condition=":is-value(nablarch, ssd, password)"
          revert="false"/>
      </event:listen>
      <field:text title="revert=false"
                  id="revert_false"
                  name="formdata.revertText"
                  hint="nablarch, ssd, passwordを入れるとダイアログが出る。"
                  sample="nablarch|ssd|password">
      </field:text>
    </tab:content>

    </tab:group>

    <button:block>
        <button:back uri="./index.jsp">
        </button:back>
    </button:block>
  </n:form>
