package please.change.me.sample.ss11AB;

import java.util.HashMap;
import java.util.Map;

import nablarch.common.code.validator.CodeValue;
import nablarch.core.db.support.ListSearchInfo;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.NumberRange;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;

/**
 * 承認一覧フォーム。
 *
 * @author 
 * @since 1.0
 */
public abstract class W11AB01FormBase extends ListSearchInfo {

    //---- プロパティ ----//

    /** 業務種類 */
    private String businessType;

    /** 申請者 */
    private String applicationUserId;

    //---- コンストラクタ ----//

    /** デフォルトコンストラクタ。 */
    public W11AB01FormBase() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AB01FormBase(Map<String, Object> params) {

        businessType = (String) params.get("businessType");
        applicationUserId = (String) params.get("applicationUserId");
        setPageNumber((Integer) params.get("pageNumber"));
        

    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();

        result.put("businessType", businessType);
        result.put("applicationUserId", applicationUserId);
        result.put("pageNumber", getPageNumber());
        
        return result;
    }


    //------ プロパティアクセッサ -----//

    /**
     * 業務種類を取得する。
     *
     * @return 業務種類。
     */
    public String getBusinessType() {
        return this.businessType;
    }

    /**
     * 業務種類を設定する。
     *
     * @param businessType 設定する業務種類。
     *
     */
    @PropertyName("業務種類")
    @CodeValue(codeId = "C1100008")
    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    /**
     * 申請者を取得する。
     *
     * @return 申請者。
     */
    public String getApplicationUserId() {
        return this.applicationUserId;
    }

    /**
     * 申請者を設定する。
     *
     * @param applicationUserId 設定する申請者。
     *
     */
    @PropertyName("申請者")
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setApplicationUserId(String applicationUserId) {
        this.applicationUserId = applicationUserId;
    }

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
    }
}
