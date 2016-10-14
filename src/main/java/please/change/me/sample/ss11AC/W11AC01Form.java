package please.change.me.sample.ss11AC;

import java.util.Map;

import nablarch.core.validation.Validatable;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;

import please.change.me.sample.ss11.entity.LoanApplicationEntity;

/**
 * ローン申請登録フォームクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class W11AC01Form extends W11AC01FormBase {

    /**
     * ローン申請登録フォームを生成する。
     */
    public W11AC01Form() {
    }

    /**
     * パラメータを元にローン申請登録フォームを生成する。
     *
     * @param param パラメータ
     */
    public W11AC01Form(Map<String, ?> param) {
        super(param);
    }

    /**
     * 入力パラメータの精査処理を実施しローン申請登録フォームを生成する。
     *
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName バリデーション名
     * @return 入力パラメータを精査後に生成したForm
     */
    public static W11AC01Form validate(String prefix, Validatable req, String validationName) {
        ValidationContext<W11AC01Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AC01Form.class, req, validationName);
        context.abortIfInvalid();
        return context.createObject();
    }

    /**
     * 確認/完了画面遷移時の精査
     *
     * @param validationContext validationContext
     */
    @ValidateFor("confirm")
    public static void validateForConfirm(ValidationContext<W11AC01FormBase> validationContext) {
        ValidationUtil.validateWithout(validationContext, new String[]{});
    }

    /**
     * ローン申請エンティティを生成する。
     * @return ローン申請エンティティ
     */
    public LoanApplicationEntity getLoanApplicationEntity() {
        return new LoanApplicationEntity(toMap());
    }
}

