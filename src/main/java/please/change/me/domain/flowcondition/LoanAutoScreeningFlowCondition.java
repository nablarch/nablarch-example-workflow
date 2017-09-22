package please.change.me.domain.flowcondition;

import java.util.Map;

import please.change.me.domain.LoanApproval;

import nablarch.integration.workflow.condition.FlowProceedCondition;
import nablarch.integration.workflow.definition.SequenceFlow;

/**
 * 自動審査の遷移先を決める。
 * @author nabchan
 */
public class LoanAutoScreeningFlowCondition implements FlowProceedCondition {

    @Override
    public boolean isMatch(final String instanceId, final Map<String, ?> param, final SequenceFlow flow) {
        final LoanApproval loanApproval = (LoanApproval) param.get("loanApplication");

        if (loanApproval.isSuccessAutoScreening()) {
            // 審査OKの場合、調査タスクが遷移先の場合に進行先とする。
            return flow.getTargetFlowNodeId().equals("SURVEY_TASK");
        } else {
            // 審査NGの場合、調査タスク以外(ワークフロー定義上、却下のみ)が遷移先の場合に進行先とする。
            return !flow.getTargetFlowNodeId().equals("SURVEY_TASK");
        }
    }
}
