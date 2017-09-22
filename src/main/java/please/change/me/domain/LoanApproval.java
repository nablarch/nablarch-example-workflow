package please.change.me.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import please.change.me.entity.LoanApplication;

import nablarch.integration.workflow.WorkflowInstance;

/**
 * ローンの申請情報
 *
 * @author nabchan
 */
@Data
@AllArgsConstructor
public class LoanApproval {

    /** ローン申請 */
    private final LoanApplication loanApplication;

    /** ワークフローインスタンス */
    private final WorkflowInstance instance;

    /**
     * 自動審査OKどうかを返す。
     * <p>
     * ローン金額が年収の半分以下の場合は、審査OKとなる。
     *
     * @return OKの場合true
     */
    public boolean isSuccessAutoScreening() {
        return ((loanApplication.getLoanAmount() * 2) <= loanApplication.getAnnualSalary());
    }

    /**
     * ワークフローインスタンスの状態が現在のユーザで処理可能かどうか。
     *
     * @param user ユーザ
     * @return 処理可能な場合は{@code true}
     */
    public boolean isProcessable(final User user) {
        if (isGroupTask()) {
            return instance.hasActiveGroupTask(user.getUgourpId());
        } else {
            return instance.hasActiveUserTask(user.getUserId());
        }
    }

    /**
     * 現在のタスクがグループタスクかどうかを返す。
     *
     * @return グループタスクの場合は{@code true}
     */
    private boolean isGroupTask() {
        return instance.isActive("JUDGING") || instance.isActive("UPPER_LEVEL_JUDGING");
    }

    /**
     * 調査タスクがアクティブかどうかを返す。
     *
     * @return 調査タスクがアクティブな場合{@code true}
     */
    public boolean isSurveyTask() {
        return instance.isActive("SURVEY_TASK");
    }

    /**
     * 判定タスクがアクティブかどうかを返す。
     *
     * @return 判定タスクがアクティブな場合{@code true}
     */
    public boolean isJudgingTask() {
        return instance.isActive("JUDGING");
    }

    /**
     * 上位判定タスクがアクティブかどうかを返す。
     *
     * @return 上位判定タスクがアクティブな場合{@code true}
     */
    public boolean isUpperLevelJudgingTask() {
        return instance.isActive("UPPER_LEVEL_JUDGING");
    }

    /**
     * 実行タスクかどうかを返す。
     * @return 実行タスクの場合{@code true}
     */
    public boolean isExecuteTask() {
        return instance.isActive("EXECUTE");
    }
}
