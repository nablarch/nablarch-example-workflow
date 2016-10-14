package please.change.me.sample.ss11AD;

import java.util.HashMap;
import java.util.Map;

import nablarch.common.code.validator.CodeValue;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;


/**
 * 交通費申請承認フォーム。
 *
 * @author 
 * @since 1.4.2
 */
public abstract class W11AD02FormBase {

    //---- プロパティ ----//

    /** 移動種類 */
    private String transDeviceCd;

    /** 出発地 */
    private String departure;

    /** 目的地 */
    private String destination;

    /** 交通費 */
    private Integer transExpense;

    /** 確認者 */
    private String confirmUserId;

    /** 承認者 */
    private String authorizeUserId;
    
    /** コメント */
    private String historyComment;

    //---- コンストラクタ ----//

    /** デフォルトコンストラクタ。 */
    public W11AD02FormBase() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AD02FormBase(Map<String, Object> params) {

        transDeviceCd = (String) params.get("transDeviceCd");
        departure = (String) params.get("departure");
        destination = (String) params.get("destination");
        transExpense = (Integer) params.get("transExpense");
        confirmUserId = (String) params.get("confirmUserId");
        authorizeUserId = (String) params.get("authorizeUserId");
        historyComment = (String) params.get("historyComment");
        
        

    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();

        result.put("transDeviceCd", transDeviceCd);
        result.put("departure", departure);
        result.put("destination", destination);
        result.put("transExpense", transExpense);
        result.put("confirmUserId", confirmUserId);
        result.put("authorizeUserId", authorizeUserId);
        result.put("historyComment", historyComment);
        
        
        return result;
    }


    //------ プロパティアクセッサ -----//

    /**
     * 移動種類を取得する。
     *
     * @return 移動種類。
     */
    public String getTransDeviceCd() {
        return this.transDeviceCd;
    }

    /**
     * 移動種類を設定する。
     *
     * @param transDeviceCd 設定する移動種類。
     *
     */
    @PropertyName("移動種類")
    @Required
    @CodeValue(codeId = "C1100001")
    public void setTransDeviceCd(String transDeviceCd) {
        this.transDeviceCd = transDeviceCd;
    }

    /**
     * 出発地を取得する。
     *
     * @return 出発地。
     */
    public String getDeparture() {
        return this.departure;
    }

    /**
     * 出発地を設定する。
     *
     * @param departure 設定する出発地。
     *
     */
    @PropertyName("出発地")
    @Required
    @Length(max = 30)
    @SystemChar(charsetDef = "ZenkakuChar", allowLineSeparator = false)
    public void setDeparture(String departure) {
        this.departure = departure;
    }

    /**
     * 目的地を取得する。
     *
     * @return 目的地。
     */
    public String getDestination() {
        return this.destination;
    }

    /**
     * 目的地を設定する。
     *
     * @param destination 設定する目的地。
     *
     */
    @PropertyName("目的地")
    @Required
    @Length(max = 30)
    @SystemChar(charsetDef = "ZenkakuChar", allowLineSeparator = false)
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * 交通費を取得する。
     *
     * @return 交通費。
     */
    public Integer getTransExpense() {
        return this.transExpense;
    }

    /**
     * 交通費を設定する。
     *
     * @param transExpense 設定する交通費。
     *
     */
    @PropertyName("交通費")
    @Digits(integer = 8)
    @Required
    public void setTransExpense(Integer transExpense) {
        this.transExpense = transExpense;
    }

    /**
     * 確認者を取得する。
     *
     * @return 確認者。
     */
    public String getConfirmUserId() {
        return this.confirmUserId;
    }

    /**
     * 確認者を設定する。
     *
     * @param confirmUserId 設定する確認者。
     *
     */
    @PropertyName("確認者")
    @Required
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setConfirmUserId(String confirmUserId) {
        this.confirmUserId = confirmUserId;
    }

    /**
     * 承認者を取得する。
     *
     * @return 承認者。
     */
    public String getAuthorizeUserId() {
        return this.authorizeUserId;
    }

    /**
     * 承認者を設定する。
     *
     * @param authorizeUserId 設定する承認者。
     *
     */
    @PropertyName("承認者")
    @Required
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setAuthorizeUserId(String authorizeUserId) {
        this.authorizeUserId = authorizeUserId;
    }
    
    /**
     * コメントを取得する。
     *
     * @return コメント。
     */
    public String getHistoryComment() {
        return this.historyComment;
    }

    /**
     * コメントを設定する。
     *
     * @param historyComment 設定するコメント。
     *
     */
    @PropertyName("コメント")
    @Length(max = 100)
    @SystemChar(charsetDef = "AllChar", allowLineSeparator = true)
    public void setHistoryComment(String historyComment) {
        this.historyComment = historyComment;
    }

}
