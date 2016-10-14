package please.change.me.sample.ss11AD;

import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;
import nablarch.fw.web.HttpRequest;
import please.change.me.sample.ss11.entity.TransExpeAppliHistoryEntity;
import please.change.me.sample.ss11.entity.TransExpeApplicationEntity;

/**
 * 交通費申請承認機能で使用するForm
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD02Form extends W11AD02FormBase {
    
    
    /** 交通費申請ID */
    private String applicationId;
    
    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AD02Form(Map<String, Object> params) {
        super(params);
        this.applicationId = (String) params.get("applicationId");
    }
    
    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    public Map<String, Object> toMap() {
        Map<String, Object> map = super.toMap();
        map.put("applicationId", applicationId);
        return map;
    }
    
    /**
     * 交通費申請テーブルの情報を取得する。
     * @return 交通費申請テーブルの情報
     */
    public TransExpeApplicationEntity getApplicationEntity() {
        TransExpeApplicationEntity entity = new TransExpeApplicationEntity(toMap());
        entity.setTransExpeAppliId(applicationId);
        return entity;
    }
    
    /**
     * 交通費申請履歴テーブルの情報を取得する。
     * @return 交通費申請履歴テーブルの情報
     */
    public TransExpeAppliHistoryEntity getHistoryEntity() {
        TransExpeAppliHistoryEntity entity = new TransExpeAppliHistoryEntity();
        entity.setTransExpeAppliId(applicationId);
        entity.setHistoryComment(getHistoryComment());
        return entity;
    }
    
    /**
     * 交通費申請IDを取得する。
     *
     * @return 交通費申請ID。
     */
    public String getApplicationId() {
        return this.applicationId;
    }

    /**
     * 交通費申請IDを設定する。
     *
     * @param applicationId 設定する交通費申請ID。
     *
     */
    @PropertyName("交通費申請ID")
    @Required
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }
    
    /**
     * バリデーションを実施する。
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName バリデーション名
     * @return 入力パラメータを精査後に生成したForm
     */
    public static W11AD02Form validate(String prefix, HttpRequest req, String validationName) {
        ValidationContext<W11AD02Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AD02Form.class, req, validationName);
        context.abortIfInvalid();
        return context.createObject();
    }
    
    /**
     * 承認画面遷移時の精査
     * 
     * @param context validationContext
     */
    @ValidateFor({ "initial", "getKey", "cancel" })
    public static void validateForInitial(ValidationContext<W11AD02Form> context) {
        ValidationUtil.validate(context, new String[] {"applicationId"});
    }
    
    /**
     * 確認タスク完了時の精査
     * 
     * @param context validationContext
     */
    @ValidateFor({ "confirm", "authorize" })
    public static void validateForConfirm(ValidationContext<W11AD02Form> context) {
        ValidationUtil.validate(context, new String[] {"applicationId", "historyComment"});
    }
    
    /**
     * 再申請タスク完了時の精査
     * 
     * @param context validationContext
     */
    @ValidateFor("reapplication")
    public static void validateForReapplication(ValidationContext<W11AD02Form> context) {
        ValidationUtil.validateWithout(context, new String[] {});
    }

}
