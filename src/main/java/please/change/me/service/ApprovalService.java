package please.change.me.service;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.Function;

import javax.persistence.OptimisticLockException;

import please.change.me.domain.Approval;
import please.change.me.domain.LoanApproval;
import please.change.me.domain.User;
import please.change.me.domain.code.LoanApplicationApplyStatus;
import please.change.me.domain.code.LoanApplicationResultStatus;
import please.change.me.domain.code.LoanApplicationStatus;
import please.change.me.entity.LoanApplication;
import please.change.me.entity.LoanApplicationHistory;

import nablarch.common.dao.EntityList;
import nablarch.common.dao.NoDataException;
import nablarch.common.dao.UniversalDao;
import nablarch.core.log.Logger;
import nablarch.core.log.LoggerManager;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * 申請関連のサービス。
 *
 * @author nabchan
 */
public class ApprovalService {

    /** ロガー */
    private static final Logger LOGGER = LoggerManager.get(ApprovalService.class);
    
    /**
     * 承認対象の一覧を取得する。
     *
     * @param loginUser ログインユーザID
     * @param loginUserGroup ログインユーザグループID
     * @return 承認対象の申請一覧
     */
    public List<Approval> searchApproval(
            final String loginUser, final String loginUserGroup) {
        final Map<String, Object> condition = new HashMap<>();
        condition.put("loginUserId", loginUser);
        condition.put("ugroupId", loginUserGroup);
        return UniversalDao.findAllBySqlFile(Approval.class, "SEARCH_APPROVAL", condition);
    }

    /**
     * 自動審査を行う。
     *
     * @param user 実行ユーザ
     */
    public void executeAutoScreening(final User user) {
        final EntityList<LoanApplication> data = UniversalDao.findAllBySqlFile(LoanApplication.class,
                "SEARCH_AUTO_SCREENING_DATA");
        LOGGER.logInfo("自動審査対象件数: " + data.size());

        data.stream()
            .map(LoanApplication::getLoanAppliId)
            .map(id -> UniversalDao.findBySqlFile(
                    LoanApplication.class, "GET_LOAN_APPLICATION_WITH_LOCK", new Object[] {id}))
            .forEach(loanApplication -> executeAutoScreening(loanApplication, user));
    }

    /**
     * 指定されたローン申請の自動審査を行う。
     *
     * @param loanApplication ローン申請
     * @param user 実行ユーザ
     */
    public void executeAutoScreening(final LoanApplication loanApplication, final User user) {
        final WorkflowInstance instance = WorkflowManager.findInstance(loanApplication.getWfInstanceId());

        final Map<String, LoanApproval> parameter = Collections.singletonMap(
                "loanApplication", new LoanApproval(loanApplication, instance));

        instance.completeGroupTask(parameter, user.getUgourpId());

        final LoanApplicationHistory history = new LoanApplicationHistory();
        history.setLoanAppliId(loanApplication.getLoanAppliId());
        history.setLoanAppliActionCd(LoanApplicationApplyStatus.AUTO_SCREENING.getValue());
        history.setExecutionerId(user.getUserId());
        history.setExecutionDateTime(LocalDateTime.now());

        if (instance.isActive("SURVEY_TASK")) {
            // 調査タスクへ遷移した場合
            loanApplication.setLoanAppliStatusCd(LoanApplicationStatus.WAIT_INQUIRY.getValue());
            history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.getValue());
        } else {
            // 却下に遷移した場合
            loanApplication.setLoanAppliStatusCd(LoanApplicationStatus.REJECTION.getValue());
            history.setLoanAppliResultCd(LoanApplicationResultStatus.REJECTION.getValue());
        }
        UniversalDao.update(loanApplication);
        UniversalDao.insert(history);
    }

    /**
     * ローン申請を取得する。
     *
     * @param id 取得対象のID
     * @param user ユーザ
     * @return ローン申請
     * @throws NotApprovalDataException 承認可能な申請データが存在しない場合
     */
    public LoanApproval findLoanApplication(final String id, final User user) throws NotApprovalDataException {

        final LoanApplication loanApplication = UniversalDao.findBySqlFile(
                LoanApplication.class, "GET_LOAN_APPLICATION_WITH_LOCK", new Object[] {id});
        final WorkflowInstance instance = WorkflowManager.findInstance(loanApplication.getWfInstanceId());

        final LoanApproval loanApproval = new LoanApproval(loanApplication, instance);

        if (!loanApproval.isProcessable(user)) {
            throw new NotApprovalDataException();
        }
        return loanApproval;
    }

    /**
     * 調査を実行する。
     * @param loan ローン申請
     * @param user タスク実行ユーザ
     * @param surveyComment 調査コメント
     * @param comment コメント
     */
    public void executeSurvey(
            final LoanApplication loan, final User user, final String surveyComment, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.WAIT_JUDGING.getValue());
        loan.setSurveyContent(surveyComment);
        
        executeApproval(
                loan, 
                user, 
                comment, 
                instance -> 
                        instance.completeUserTask(Collections.singletonMap("condition", "ok"), user.getUserId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.SURVEY.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.getValue());
                    return history;
                }
        );
    }

    /**
     * 却下を実行する。
     *
     * @param loan ローン申請
     * @param user タスク実行ユーザ
     * @param surveyComment 調査コメント
     * @param comment コメント
     */
    public void executeReject(
            final LoanApplication loan, final User user, final String surveyComment, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.REJECTION.getValue());
        loan.setSurveyContent(surveyComment);
        executeApproval(
                loan, 
                user, 
                comment, 
                instance ->
                        instance.completeUserTask(Collections.singletonMap("condition", "ng"), user.getUserId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.SURVEY.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.REJECTION.getValue());
                    return history;
                }
        );
    }

    /**
     * 判定を実行する。
     *
     * @param loan ローン申請
     * @param user タスク実行ユーザ
     * @param comment コメント
     */
    public void executeJudge(final LoanApplication loan, final User user, final String comment) {

        executeApproval(
                loan, 
                user, 
                comment, 
                instance -> {
                    final Map<String, Object> param = new HashMap<>();
                    param.put("condition", "ok");
                    param.put("limit", loan.getLoanAmount());
                    instance.completeGroupTask(param, user.getUgourpId());
                    if (instance.isActive("EXECUTE")) {
                        loan.setLoanAppliStatusCd(LoanApplicationStatus.WAIT_COMPLETION.getValue());
                    } else {
                        loan.setLoanAppliStatusCd(LoanApplicationStatus.UPPER_LEVEL_JUDGING.getValue());
                    }
                },
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.JUDGING.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.getValue());
                    return history;
                }
        );
    }

    /**
     * 判定からの却下処理を実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     */
    public void executeRejectFromJudge(
            final LoanApplication loan, final User user, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.REJECTION.getValue());
        
        executeApproval(
                loan, 
                user, 
                comment, 
                instance ->
                        instance.completeGroupTask(Collections.singletonMap("condition", "ng"), user.getUgourpId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.JUDGING.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.REJECTION.getValue());
                    return history;
                }
        );
    }

    /**
     * 差し戻し処理を実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     */
    public void executeBack(final LoanApplication loan, final User user, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.RE_WAIT_INQUIRY.getValue());
        executeApproval(
                loan,
                user,
                comment,
                instance ->
                        instance.completeGroupTask(Collections.singletonMap("condition", "re"), user.getUgourpId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.JUDGING.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.BACK.getValue());
                    return history;
                }
        );
    }

    /**
     * 上位者判定処理を実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     */
    public void executeUpperLevelJudge(final LoanApplication loan, final User user, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.WAIT_COMPLETION.getValue());
        executeApproval(
                loan,
                user,
                comment,
                instance ->
                        instance.completeGroupTask(Collections.singletonMap("condition", "ok"), user.getUgourpId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.UPPER_LEVEL_JUDGING.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.getValue());
                    return history;
                }
        );
    }

    /**
     * 上位判定者の却下処理を実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     */
    public void executeRejectFromUpperLevelJudge(final LoanApplication loan, final User user, final String comment) {

        loan.setLoanAppliStatusCd(LoanApplicationStatus.REJECTION.getValue());
        executeApproval(loan,
                user,
                comment,
                instance ->
                        instance.completeGroupTask(Collections.singletonMap("condition", "ng"), user.getUgourpId()),
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.UPPER_LEVEL_JUDGING.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.REJECTION.getValue());
                    return history;
                });
    }

    /**
     * ローンを実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     */
    public void executeLoan(final LoanApplication loan, final User user, final String comment) {
        executeApproval(
                loan,
                user,
                comment,
                instance -> {
                    instance.completeUserTask(user.getUserId());
                    if (instance.isCompleted()) {
                        loan.setLoanAppliStatusCd(LoanApplicationStatus.COMPLETED.getValue());
                    }
                },
                history -> {
                    history.setLoanAppliActionCd(LoanApplicationApplyStatus.EXECUTE.getValue());
                    history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.getValue());
                    return history;
                });
    }


    /**
     * 承認処理を実行する。
     *
     * @param loan ローン申請
     * @param user 実行ユーザ
     * @param comment コメント
     * @param completeTask タスクの完了処理
     * @param changeHistory 承認履歴の個別変更処理
     */
    private void executeApproval(
            final LoanApplication loan,
            final User user,
            final String comment,
            final Consumer<WorkflowInstance> completeTask,
            final Function<LoanApplicationHistory, LoanApplicationHistory> changeHistory) {
        
        // lock
        try {
            UniversalDao.findBySqlFile(LoanApplication.class, "LOCK", loan);
        } catch (NoDataException ignored) {
            throw new OptimisticLockException();
        }

        final WorkflowInstance instance = WorkflowManager.findInstance(loan.getWfInstanceId());
        completeTask.accept(instance);

        UniversalDao.update(loan);

        final LoanApplicationHistory history = new LoanApplicationHistory();
        history.setLoanAppliId(loan.getLoanAppliId());
        history.setExecutionerId(user.getUserId());
        history.setExecutionDateTime(LocalDateTime.now());
        history.setHistoryComment(comment);
        UniversalDao.insert(changeHistory.apply(history));
    }
}
