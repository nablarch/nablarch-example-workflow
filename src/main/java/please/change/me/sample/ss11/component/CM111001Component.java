package please.change.me.sample.ss11.component;

import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.*;

import java.util.HashMap;
import java.util.Map;

import nablarch.core.ThreadContext;
import nablarch.core.db.statement.ParameterizedSqlPStatement;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import please.change.me.sample.ss11.entity.TransExpeAppliHistoryEntity;
import please.change.me.sample.ss11.entity.TransExpeApplicationEntity;
import please.change.me.sample.util.IdGeneratorUtil;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * 交通費申請ワークフローの登録と進行を行うコンポーネント
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM111001Component extends DbAccessSupport {

    /**
     * 交通費を申請する。<br/>
     * 申請IDは自動採番される。
     * 
     * @param entity 登録する交通費申請情報を設定したEntity
     * @param confirmUserId 確認者ユーザID
     * @param authorizeUserId 承認者ユーザID
     * @return 採番した交通費申請ID
     */
    public String applyTransExpense(TransExpeApplicationEntity entity, String confirmUserId, String authorizeUserId) {
        
        // WF 開始
        WorkflowInstance workflow = WorkflowManager.startInstance(TRANS_EXPENSE_APPLICATION_WORKFLOW_ID);
        workflow.assignUser(CONFIRMATION_TASK, confirmUserId);
        workflow.assignUser(AUTHORIZATION_TASK, authorizeUserId);
        workflow.assignUser(REAPPLICATION_TASK, ThreadContext.getUserId());
        
        // 申請登録
        String applicationId = IdGeneratorUtil.generateTransExpeAppliId();
        entity.setTransExpeAppliId(applicationId);
        entity.setWfInstanceId(workflow.getInstanceId());
        entity.setTransExpeAppliStatusCd(REGISTER_COMPLETE);
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("REGISTER_TRANS_EXPENSE_APPLICATION");
        statement.executeUpdateByObject(entity);
        
        // 履歴登録
        TransExpeAppliHistoryEntity historyEntity = new TransExpeAppliHistoryEntity();
        historyEntity.setTransExpeAppliId(applicationId);
        historyEntity.setTransExpeAppliActionCd(REGISTER);
        historyEntity.setTransExpeAppliResultCd(FORWARD_RESULT);
        registerHistory(historyEntity);
        
        return applicationId;
    }
    
    /**
     * 確認タスクを承認タスクへ進める。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void executeConfirmation(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", FORWARD_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(CONFIRM_COMPLETE);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(CONFIRM);
        historyEntity.setTransExpeAppliResultCd(FORWARD_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 確認タスクを却下する。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void rejectConfirmation(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", REJECT_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(REJECT);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(CONFIRM);
        historyEntity.setTransExpeAppliResultCd(REJECT_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 確認タスクを差し戻す。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void returnConfirmation(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", RETURN_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(CONFIRM_RETURN);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(CONFIRM);
        historyEntity.setTransExpeAppliResultCd(RETURN_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 承認タスクを実施し、ワークフローを完了させる。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void executeAuthorization(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", FORWARD_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(AUTHORIZE_COMPLETE);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(AUTHORIZE);
        historyEntity.setTransExpeAppliResultCd(FORWARD_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 承認タスクを却下する。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void rejectAuthorization(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", REJECT_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(REJECT);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(AUTHORIZE);
        historyEntity.setTransExpeAppliResultCd(REJECT_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 承認タスクを差し戻す。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void returnAuthorization(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("condition", RETURN_CONDITION);
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).completeUserTask(parameter);
        
        applicationEntity.setTransExpeAppliStatusCd(AUTHORIZE_RETURN);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(AUTHORIZE);
        historyEntity.setTransExpeAppliResultCd(RETURN_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 再申請タスクを行う。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     * @param confirmUserId 確認者ユーザID
     * @param authorizeUserId 承認者ユーザID
     */
    public void executeReapplication(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity,
            String confirmUserId, String authorizeUserId) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        WorkflowInstance workflow = WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID"));
        workflow.assignUser(CONFIRMATION_TASK, confirmUserId);
        workflow.assignUser(AUTHORIZATION_TASK, authorizeUserId);
        workflow.completeUserTask();
        
        applicationEntity.setTransExpeAppliStatusCd(REGISTER_COMPLETE);
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("UPDATE_TRANS_EXPENSE_APPLICATION");
        statement.executeUpdateByObject(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(REAPPLY);
        historyEntity.setTransExpeAppliResultCd(FORWARD_RESULT);
        registerHistory(historyEntity);
    }
    
    /**
     * 確認タスクを引戻す。
     * 
     * @param applicationEntity 交通費申請情報を保持するEntity
     * @param historyEntity 交通費申請履歴情報を保持するEntity
     */
    public void cancelConfirmation(TransExpeApplicationEntity applicationEntity, TransExpeAppliHistoryEntity historyEntity) {
        
        SqlRow application = getApplication(applicationEntity.getTransExpeAppliId());
        
        WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID")).triggerEvent(CANCEL_TRIGGER);
        
        applicationEntity.setTransExpeAppliStatusCd(CONFIRM_CANCEL);
        updateApplicationStatus(applicationEntity);
        
        historyEntity.setTransExpeAppliActionCd(CANCEL);
        historyEntity.setTransExpeAppliResultCd(FORWARD_RESULT);
        registerHistory(historyEntity);
    }
    
    
    /**
     * 交通費申請承認履歴を登録する。<br/>
     * 履歴IDは自動採番される。
     * 
     * @param entity 登録する交通費申請承認履歴情報を設定したEntity
     */
    private void registerHistory(TransExpeAppliHistoryEntity entity) {
        entity.setTransExpeAppliHistoryId(IdGeneratorUtil.generateTransExpeAppliHistoryId());
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("REGISTER_HISTORY");
        statement.executeUpdateByObject(entity);
    }
    

    /**
     * 交通費申請ステータスを更新する。
     * 
     * @param entity 交通費申請情報を保持するEntity
     */
    private void updateApplicationStatus(TransExpeApplicationEntity entity) {
        ParameterizedSqlPStatement statement = getParameterizedSqlStatement("UPDATE_TRANS_EXPENSE_APPLI_STATUS");
        statement.executeUpdateByObject(entity);
    }
    
    /**
     * 交通費申請IDに紐付く交通費申請を取得する。<br/>
     * 取得できなかった場合、nullを返す。
     * 
     * @param applicationId 交通費申請ID
     * @return 交通費申請IDに紐付く交通費申請
     */
    public SqlRow getApplication(String applicationId) {
        SqlPStatement statement = getSqlPStatement("GET_TRANS_EXPENSE_APPLICATION");
        statement.setString(1, applicationId);
        SqlResultSet sqlResultSet = statement.retrieve();
        
        if (sqlResultSet.isEmpty()) {
            return null;
        }
        return sqlResultSet.get(0);
    }
}
