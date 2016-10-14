package please.change.me.ss{{=gamenId.slice(1, 5)}};

import java.util.HashMap;
import java.util.Map;
import java.math.BigDecimal;

import please.change.me.core.validation.validator.MailAddress;
import nablarch.common.code.validator.CodeValue;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.NumberRange;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;
{{=$jsp.spec_usesListSearchInfo() ? 'import nablarch.core.db.support.ListSearchInfo;' : ''}}

/**
 * {{=jsp('t:page_template').attr('title')}}フォーム。
 *
 * @author {{=jsp('spec:author').text()}}
 * @since 1.0
 */
public abstract class {{=gamenId.first(7)}}FormBase {{=$jsp.spec_usesListSearchInfo() ? 'extends ListSearchInfo ' : ''}}{

    //---- プロパティ ----//
{{@EACH $jsp.spec_formFields()}}
    /** {{=$(item).attr('title')}} */
    private {{=$(item).spec_javaType()}} {{=$(item).attr('name').split('.').last()}};
{{@END}}
    //---- コンストラクタ ----//

    /** デフォルトコンストラクタ。 */
    public {{=gamenId.first(7)}}FormBase() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public {{=gamenId.first(7)}}FormBase(Map<String, Object> params) {
{{@EACH $jsp.spec_formFields()}}
        {{=$(item).spec_attr('name').split('.').last()}} = ({{=$(item).spec_javaType()}}) params.get("{{=
           $(item).spec_attr('name').split('.').last()}}");{{@END}}
        {{=$jsp.spec_usesListSearchInfo() ? 'setPageNumber((Integer) params.get("pageNumber"));' :''}}
        {{=$jsp.find('[sortable="true"]').length ? 'setSortId((String) params.get("sortId"));' : ''}}

    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();
{{@EACH $jsp.spec_formFields()}}
        result.put("{{=
          $(item).spec_attr('name').split('.').last()}}", {{=
          $(item).spec_attr('name').split('.').last()}});{{@END}}
        {{=$jsp.spec_usesListSearchInfo() ? 'result.put("pageNumber", getPageNumber());':''}}
        {{=$jsp.find('[sortable="true"]').length ? 'result.put("sortId", getSortId());' : ''}}
        return result;
    }


    //------ プロパティアクセッサ -----//
{{@EACH $jsp.spec_formFields()}}
    /**
     * {{=$(item).spec_attr('title')}}を取得する。
     *
     * @return {{=$(item).spec_attr('title')}}。
     */
    public {{=$(item).spec_javaType()}} get{{=
      $(item).spec_attr('name').split('.').last().first().toUpperCase()}}{{=
      $(item).spec_attr('name').split('.').last().slice(1)}}() {
        return this.{{=$(item).spec_attr('name').split('.').last()}};
    }

    /**
     * {{=$(item).spec_attr('title')}}を設定する。
     *
     * @param {{=$(item).spec_attr('name').split('.').last()}} 設定する{{=$(item).spec_attr('title')}}。
     *
     */
    {{=$(item).spec_getAnnotationsOnFormProperty()}}
    public void set{{=
      $(item).spec_attr('name').split('.').last().first().toUpperCase()}}{{=
      $(item).spec_attr('name').split('.').last().slice(1)}}({{=$(item).spec_javaType()}} {{=$(item).spec_attr('name').split('.').last()}}) {
        this.{{=$(item).spec_attr('name').split('.').last()}} = {{=$(item).spec_attr('name').split('.').last()}};
    }
{{@END}}{{@IF $jsp.spec_usesListSearchInfo()}}
    /**
     * ページ番号を設定する。
     *
     * @param pageNumber ページ番号
     */
    @PropertyName("開始ページ")
    @Required
    @NumberRange(max = 10, min = 1)
    @Digits(integer = 2)
    public void setPageNumber(Integer pageNumber) {
        super.setPageNumber(pageNumber);
    }{{@END}}{{@IF $jsp.find('[sortable="true"]').length > 0}}

    /**
     * ソートIDを設定する。
     *
     * @param sortId ソートID
     */
    @PropertyName("ソートID")
    @Required
    public void setSortId(String sortId) {
        super.setSortId(sortId);
    }{{@END}}
}
