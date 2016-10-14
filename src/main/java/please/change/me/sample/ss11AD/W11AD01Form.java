package please.change.me.sample.ss11AD;

import java.util.Map;

import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.web.HttpRequest;
import please.change.me.sample.ss11.entity.TransExpeApplicationEntity;

/**
 * 交通費申請登録機能で使用するForm
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD01Form extends W11AD01FormBase {
    
    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AD01Form(Map<String, Object> params) {
        super(params);
    }
    
    /**
     * 交通費申請テーブルの情報を取得する。
     * @return 交通費申請テーブルの情報
     */
    public TransExpeApplicationEntity getApplicationEntity() {
        return new TransExpeApplicationEntity(toMap());
    }
    
    /**
     * バリデーションを実施する。
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName バリデーション名
     * @return 入力パラメータを精査後に生成したForm
     */
    public static W11AD01Form validate(String prefix, HttpRequest req, String validationName) {
        ValidationContext<W11AD01Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AD01Form.class, req, validationName);
        context.abortIfInvalid();
        return context.createObject();
    }
    
    /**
     * 確認/完了画面遷移時の精査
     * 
     * @param context validationContext
     */
    @ValidateFor("confirm")
    public static void validateForConfirm(ValidationContext<W11AD01Form> context) {
        ValidationUtil.validateWithout(context, new String[] {});
    }

}
