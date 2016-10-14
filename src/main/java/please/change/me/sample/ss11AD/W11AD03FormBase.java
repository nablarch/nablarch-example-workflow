package please.change.me.sample.ss11AD;

import java.util.HashMap;
import java.util.Map;

import nablarch.common.code.validator.CodeValue;
import nablarch.core.db.support.ListSearchInfo;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.NumberRange;
import nablarch.core.validation.validator.Required;

/**
 * 申請一覧フォーム。
 *
 * @author 
 * @since 1.0
 */
public abstract class W11AD03FormBase extends ListSearchInfo {

    //---- プロパティ ----//

    /** ステータスコード */
    private String statusCd;

    /** 移動種類コード */
    private String deviceCd;

    //---- コンストラクタ ----//

    /** デフォルトコンストラクタ。 */
    public W11AD03FormBase() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AD03FormBase(Map<String, Object> params) {

        statusCd = (String) params.get("statusCd");
        deviceCd = (String) params.get("deviceCd");
        setPageNumber((Integer) params.get("pageNumber"));
        

    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();

        result.put("statusCd", statusCd);
        result.put("deviceCd", deviceCd);
        result.put("pageNumber", getPageNumber());
        
        return result;
    }


    //------ プロパティアクセッサ -----//

    /**
     * ステータスコードを取得する。
     *
     * @return ステータスコード。
     */
    public String getStatusCd() {
        return this.statusCd;
    }

    /**
     * ステータスコードを設定する。
     *
     * @param statusCd 設定するステータスコード。
     *
     */
    @PropertyName("ステータスコード")
    @CodeValue(codeId = "C1100002")
    public void setStatusCd(String statusCd) {
        this.statusCd = statusCd;
    }
    
    /**
     * 移動種類コードを取得する。
     *
     * @return 移動種類コード。
     */
    public String getDeviceCd() {
        return this.deviceCd;
    }

    /**
     * 移動種類コードを設定する。
     *
     * @param deviceCd 設定する移動種類コード。
     *
     */
    @PropertyName("移動種類コード")
    @CodeValue(codeId = "C1100001")
    public void setDeviceCd(String deviceCd) {
        this.deviceCd = deviceCd;
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
