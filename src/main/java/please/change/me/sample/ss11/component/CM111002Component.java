package please.change.me.sample.ss11.component;

import static please.change.me.sample.ss11.component.LoanApplicationConstant.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nablarch.core.db.statement.ParameterizedSqlPStatement;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;

import please.change.me.sample.ss11.entity.LoanApplicationEntity;
import please.change.me.sample.ss11.entity.LoanApplicationHistoryEntity;
import please.change.me.sample.util.IdGeneratorUtil;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * ローン申請ワークフローの登録及び進行処理を行うコンポーネント。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class CM111002Component extends DbAccessSupport {

    /**
     * ローンの申請処理を行う。
     *
     * @param entity ローン申請エンティティ
     */
    public void applyLoan(LoanApplicationEntity entity) {
        WorkflowInstance workflow = WorkflowManager.startInstance(LOAN_APPLICATION_WORKFLOW_ID);
        String instanceId = workflow.getInstanceId();

        assignAutoScreeningUser(workflow);
        assignProspectUsers(workflow);
        assignJudgingGroup(workflow);
        assignUpperLevelJudgingGroup(workflow);

        entity.setLoanAppliId(IdGeneratorUtil.generateLoanAppliId());
        entity.setLoanAppliStatusCd(WAIT_AUTO_SCREENING);
        entity.setWfInstanceId(instanceId);
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("INSERT_LOAN_APPLICATION");
        statement.executeUpdateByObject(entity);

        LoanApplicationHistoryEntity historyEntity = new LoanApplicationHistoryEntity();
        historyEntity.setLoanAppliId(entity.getLoanAppliId());
        historyEntity.setLoanAppliActionCd(REGISTERED);
        historyEntity.setLoanAppliResultCd(RESULT_OK);
        insertLoanApplicationHistory(historyEntity);
    }

    /**
     * ローン申請の自動審査処理を行う。
     *
     * @param loanApplicationId ローン申請ID
     */
    public void executeAutoScreening(String loanApplicationId) {

        LoanApplicationHistoryEntity loanApplicationHistoryEntity = new LoanApplicationHistoryEntity();

        loanApplicationHistoryEntity.setLoanAppliId(loanApplicationId);
        loanApplicationHistoryEntity.setLoanAppliActionCd(AUTO_SCREENED);

        LoanApplicationEntity loanApplicationEntity = findLoanApplication(loanApplicationId);
        Map<String, LoanApplicationEntity> parameter = new HashMap<String, LoanApplicationEntity>();
        parameter.put("loanApplication", loanApplicationEntity);

        WorkflowInstance workflow = WorkflowManager.findInstance(loanApplicationEntity.getWfInstanceId());
        workflow.completeUserTask(parameter);

        if (workflow.isActive(SURVEY_TASK_ID)) {
            // 自動審査OK → 調査へ
            loanApplicationEntity.setLoanAppliStatusCd(WAIT_INQUIRY_STATUS);
            updateApplicationStatus(loanApplicationEntity);

            loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_OK);
            insertLoanApplicationHistory(loanApplicationHistoryEntity);
        } else {
            // 自動審査NG → 却下へ
            loanApplicationEntity.setLoanAppliStatusCd(REJECTION_STATUS);
            updateApplicationStatus(loanApplicationEntity);

            loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_REJECTION);
            insertLoanApplicationHistory(loanApplicationHistoryEntity);
        }
    }

    /**
     * ローン申請の調査処理を行う。
     *
     * @param applicationEntity ローン申請エンティティ
     * @param historyEntity ローン申請履歴エンティティ
     */
    public void executeSurvey(LoanApplicationEntity applicationEntity, LoanApplicationHistoryEntity historyEntity) {

        Map<String, Integer> param = new HashMap<String, Integer>();
        param.put("condition", CONDITION_OK);
        LoanApplicationEntity entity = findLoanApplication(applicationEntity.getLoanAppliId());
        WorkflowManager.findInstance(entity.getWfInstanceId()).completeUserTask(param);

        applicationEntity.setLoanAppliStatusCd(WAIT_JUDGING);
        updateStatusAndSurveyContent(applicationEntity);

        historyEntity.setLoanAppliActionCd(SURVEYED);
        historyEntity.setLoanAppliResultCd(RESULT_OK);
        insertLoanApplicationHistory(historyEntity);
    }

    /**
     * 調査タスクからのローン申請を却下する。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     */
    public void rejectLoanApplicationBySurvey(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity) {

        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("condition", CONDITION_REJECT);

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());
        WorkflowManager.findInstance(entity.getWfInstanceId()).completeUserTask(parameter);

        loanApplicationEntity.setLoanAppliStatusCd(REJECTION_STATUS);
        updateStatusAndSurveyContent(loanApplicationEntity);

        loanApplicationHistoryEntity.setLoanAppliActionCd(SURVEYED);
        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_REJECTION);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);
    }

    /**
     * ローン申請の判定処理を行う。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    public void judgeLoanApplication(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity,
            String groupId) {

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", CONDITION_OK);
        parameter.put("limit", BigDecimal.valueOf(entity.getLoanAmount()));

        WorkflowInstance workflow = WorkflowManager.findInstance(entity.getWfInstanceId());
        workflow.completeGroupTask(parameter, groupId);

        if (workflow.isActive(UPPER_LEVEL_JUDGING_TASK_ID)) {
            loanApplicationEntity.setLoanAppliStatusCd(WAIT_UPPER_LEVEL_JUDGING);
        } else {
            loanApplicationEntity.setLoanAppliStatusCd(WAIT_COMPLETION);
        }

        updateApplicationStatus(loanApplicationEntity);

        loanApplicationHistoryEntity.setLoanAppliActionCd(JUDGED);
        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_OK);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);
    }

    /**
     * ローン申請の差し戻し処理を行う。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    public void returnLoanApplication(LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity, String groupId) {

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", CONDITION_RETURN);

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());
        WorkflowInstance workflow = WorkflowManager.findInstance(entity.getWfInstanceId());
        workflow.completeGroupTask(parameter, groupId);

        loanApplicationEntity.setLoanAppliStatusCd(WAIT_RE_INQUIRY_STATUS);
        updateApplicationStatus(loanApplicationEntity);

        loanApplicationHistoryEntity.setLoanAppliActionCd(JUDGED);
        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_RETURN);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);
    }

    /**
     * 判定タスクからの却下処理を行う。
     * <p/>
     * ワークフロー却下後には、以下の処理を行う。
     * <p/>
     * <ul>
     * <li>ローン申請のステータスを却下に変更</li>
     * <li>ローン申請履歴の登録（結果コードに却下を設定して登録する。)</li>
     * </ul>
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    public void rejectLoanApplicationByJudge(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity,
            String groupId) {

        loanApplicationHistoryEntity.setLoanAppliActionCd(JUDGED);
        rejectLoanApplication(loanApplicationEntity, loanApplicationHistoryEntity, groupId);
    }

    /**
     * 上位判定処理を行う。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    public void upperLevelJudgeLoanApplication(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity,
            String groupId) {

        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", CONDITION_OK);

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());
        WorkflowInstance workflow = WorkflowManager.findInstance(entity.getWfInstanceId());
        workflow.completeGroupTask(parameter, groupId);

        loanApplicationEntity.setLoanAppliStatusCd(WAIT_COMPLETION);
        updateApplicationStatus(loanApplicationEntity);

        loanApplicationHistoryEntity.setLoanAppliActionCd(UPPER_LEVEL_JUDGED);
        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_OK);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);
    }

    /**
     * 上位判定からの却下処理を行う。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    public void rejectLoanApplicationByUpperLevelJudge(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity,
            String groupId) {

        loanApplicationHistoryEntity.setLoanAppliActionCd(UPPER_LEVEL_JUDGED);
        rejectLoanApplication(loanApplicationEntity, loanApplicationHistoryEntity, groupId);
    }

    /**
     * ローンを実行する。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     */
    public void executeLoan(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity) {

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());
        WorkflowInstance workflow = WorkflowManager.findInstance(entity.getWfInstanceId());
        workflow.completeUserTask();

        if (workflow.isCompleted()) {
            loanApplicationEntity.setLoanAppliStatusCd(COMPLETED);
            updateApplicationStatus(loanApplicationEntity);
        }

        loanApplicationHistoryEntity.setLoanAppliActionCd(EXECUTED);
        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_OK);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);
    }

    /**
     * ローン申請データを取得する。
     *
     * @param loanApplicationId ローン申請ID
     * @return 取得したローン申請データ(データが存在しない場合はnull)
     */
    public LoanApplicationEntity findLoanApplication(String loanApplicationId) {
        SqlPStatement statement = getSqlPStatement("SELECT_LOAN_APPLICATION");
        statement.setString(1, loanApplicationId);
        SqlResultSet resultSet = statement.retrieve();
        if (resultSet.isEmpty()) {
            return null;
        }
        SqlRow loanApplication = resultSet.get(0);
        loanApplication.put("ANNUAL_SALARY", loanApplication.getInteger("ANNUAL_SALARY"));
        loanApplication.put("LOAN_AMOUNT", loanApplication.getInteger("LOAN_AMOUNT"));
        return new LoanApplicationEntity(loanApplication);
    }

    /**
     * 却下処理を行う。
     *  @param loanApplicationEntity ローン申請エンティティ
     * @param loanApplicationHistoryEntity ローン申請履歴エンティティ
     * @param groupId タスク実行グループID
     */
    private void rejectLoanApplication(
            LoanApplicationEntity loanApplicationEntity,
            LoanApplicationHistoryEntity loanApplicationHistoryEntity,
            String groupId) {

        Map<String, Integer> parameter = new HashMap<String, Integer>();
        parameter.put("condition", CONDITION_REJECT);

        LoanApplicationEntity entity = findLoanApplication(loanApplicationEntity.getLoanAppliId());
        WorkflowInstance workflow = WorkflowManager.findInstance(entity.getWfInstanceId());
        workflow.completeGroupTask(parameter, groupId);

        loanApplicationEntity.setLoanAppliStatusCd(REJECTION_STATUS);
        updateApplicationStatus(loanApplicationEntity);

        loanApplicationHistoryEntity.setLoanAppliResultCd(RESULT_REJECTION);
        insertLoanApplicationHistory(loanApplicationHistoryEntity);

    }

    /**
     * 自動審査タスクにユーザを割り当てる。
     *
     * @param workflow ワークフローインスタンス
     */
    private static void assignAutoScreeningUser(WorkflowInstance workflow) {
        workflow.assignUser(
                AUTO_SCREENING_TASK_ID, AUTO_SCREENING_USER_ID);
    }

    /**
     * 調査担当者レーンににユーザを割り当てる。
     *
     * @param workflow ワークフローインスタンス
     */
    private static void assignProspectUsers(WorkflowInstance workflow) {
        CM111003Component component = new CM111003Component();
        SqlResultSet users = component.getUserList(PROSPECT_GROUP_ID);
        List<String> assignUsers = new ArrayList<String>();
        for (SqlRow user : users) {
            assignUsers.add(user.getString("USER_ID"));
        }
        workflow.assignUsersToLane(SURVEY_LANE_ID, assignUsers);
    }

    /**
     * 判定タスクにグループを割り当てる。
     *
     * @param workflow ワークフロー
     */
    private static void assignJudgingGroup(WorkflowInstance workflow) {
        workflow.assignGroup(JUDGING_TASK_ID, JUDGING_GROUP_ID);
    }

    /**
     * 上位判定タスクにグループを割り当てる。
     *
     * @param workflow ワークフロー
     */
    private static void assignUpperLevelJudgingGroup(WorkflowInstance workflow) {
        workflow.assignGroup(
                UPPER_LEVEL_JUDGING_TASK_ID, UPPER_LEVEL_JUDGING_GROUP_ID);
    }

    /**
     * ローン申請の現在のステータスを最新の状態に更新する。
     *
     * @param entity ローン申請エンティティ
     */
    private void updateApplicationStatus(LoanApplicationEntity entity) {
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("UPDATE_STATUS");
        statement.executeUpdateByObject(entity);
    }

    /**
     * ローン申請のステータス及び調査コメントを更新数。
     *
     * @param loanApplicationEntity ローン申請エンティティ
     */
    private void updateStatusAndSurveyContent(LoanApplicationEntity loanApplicationEntity) {
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("UPDATE_STATUS_AND_SURVEY_CONTENT");
        statement.executeUpdateByObject(loanApplicationEntity);
    }

    /**
     * ローン申請履歴を登録する。
     * <p/>
     * ローン申請履歴IDを採番し、パラメータで指定されたデータを登録する。
     *
     * @param entity 登録対象のデータ
     */
    private void insertLoanApplicationHistory(LoanApplicationHistoryEntity entity) {
        String historyId = IdGeneratorUtil.generateLoanAppliHistoryId();
        entity.setLoanAppliHistoryId(historyId);

        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("INSERT_LOAN_APPLICATION_HISTORY");
        statement.executeUpdateByObject(entity);
    }

}

