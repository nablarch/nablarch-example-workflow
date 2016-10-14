package please.change.me.sample.ss11.component;

import static please.change.me.sample.ss11.component.LoanApplicationConstant.SURVEY_TASK_ID;

import java.util.Map;

import please.change.me.sample.ss11.entity.LoanApplicationEntity;
import nablarch.integration.workflow.condition.FlowProceedCondition;
import nablarch.integration.workflow.definition.SequenceFlow;

/**
 * ローン申請の自動審査の進行先を制御するクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class CM111004Component implements FlowProceedCondition {

    /**
     * {@inheritDoc}
     *
     * パラメータから{@link LoanApplicationEntity}を取得(キー:loanApplication)し、
     * 年収及びローン申請額を元に進行先を決定する。
     *
     * 進行先を特定するための条件
     * <pre>
     * パラメータの{@link SequenceFlow}の進行先が却下の場合
     * 申請額が年収の半分より大きい場合、trueを返す。(却下へと進む)
     *
     * パラメータの{@link SequenceFlow}の進行先が調査の場合
     * 申請額が年収の半分以下の場合、trueを返す。(調査へと進む)
     * </pre>
     */
    @Override
    public boolean isMatch(String instanceId, Map<String, ?> param, SequenceFlow sequenceFlow) {
        LoanApplicationEntity loanApplication = (LoanApplicationEntity) param.get("loanApplication");

        int annualSalary = loanApplication.getAnnualSalary().intValue();
        int loanAmount = loanApplication.getLoanAmount().intValue();

        if ((loanAmount * 2) <= annualSalary) {
            // 審査OKの場合、調査タスクが遷移先の場合に進行先とする。
            return sequenceFlow.getTargetFlowNodeId().equals(SURVEY_TASK_ID);
        } else {
            // 審査NGの場合、調査タスク以外(ワークフロー定義上、却下のみ)が遷移先の場合に進行先とする。
            return !sequenceFlow.getTargetFlowNodeId().equals(SURVEY_TASK_ID);
        }
    }
}

