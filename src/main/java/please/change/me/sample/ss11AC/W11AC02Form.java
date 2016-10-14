package please.change.me.sample.ss11AC;

import java.util.Map;

import nablarch.core.validation.Validatable;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;

import please.change.me.sample.ss11.entity.LoanApplicationEntity;
import please.change.me.sample.ss11.entity.LoanApplicationHistoryEntity;

/**
 * ローン申請のタスク進行フォームクラスを生成する。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class W11AC02Form extends W11AC02FormBase {

    /**
     * ローンタスク申請フォームを生成する。
     */
    public W11AC02Form() {
    }

    /**
     * ローンタスク進行フォームを生成する。
     *
     * @param param パラメータ
     */
    public W11AC02Form(Map<String, ?> param) {
        super(param);
    }

    /**
     * 入力パラメータの精査処理を実施しローン申請タスク進行フォームを生成する。
     *
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName バリデーション名
     * @return 入力パラメータを精査後に生成したForm
     */
    public static W11AC02Form validate(String prefix, Validatable req, String validationName) {
        ValidationContext<W11AC02Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AC02Form.class, req, validationName);
        context.abortIfInvalid();
        return context.createObject();
    }

    /**
     * 初期表示時の精査。
     *
     * @param validationContext validationContext
     */
    @ValidateFor("show")
    public static void validateForShow(ValidationContext<W11AC01FormBase> validationContext) {
        ValidationUtil.validate(validationContext, new String[]{"loanAppliId"});
    }

    /**
     * 調査時の精査
     *
     * @param validationContext validationContext
     */
    @ValidateFor("survey")
    public static void validateForSurvey(ValidationContext<W11AC01FormBase> validationContext) {
        ValidationUtil.validate(validationContext, new String[]{"loanAppliId", "surveyContent", "historyComment"});
    }

    /**
     * 履歴コメントの精査
     *
     * @param validationContext validationContext
     */
    @ValidateFor("comment")
    public static void validateForComment(ValidationContext<W11AC01FormBase> validationContext) {
        ValidationUtil.validate(validationContext, new String[]{"loanAppliId", "historyComment"});
    }

    /**
     * ローン申請エンティティを生成する。
     *
     * @return ローン申請エンティティ
     */
    public LoanApplicationEntity getLoanApplicationEntity() {
        return new LoanApplicationEntity(toMap());
    }

    /**
     * ローン申請履歴エンティティを生成する。
     *
     * @return ローン申請履歴エンティティ
     */
    public LoanApplicationHistoryEntity getLoanApplicationHistoryEntity() {
        return new LoanApplicationHistoryEntity(toMap());
    }
}

