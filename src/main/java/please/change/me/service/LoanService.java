package please.change.me.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import please.change.me.domain.code.LoanApplicationApplyStatus;
import please.change.me.domain.code.LoanApplicationResultStatus;
import please.change.me.domain.code.LoanApplicationStatus;
import please.change.me.entity.LoanApplication;
import please.change.me.entity.LoanApplicationHistory;
import please.change.me.entity.Users;

import nablarch.common.dao.UniversalDao;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * ローン申請に関連したサービス。
 *
 * @author nabchan
 */
public class LoanService {

    /** 調査担当者の属するグループID */
    public static final String PROSPECT_GROUP_ID = "1000000001";

    /** 判定グループID */
    public static final String JUDGING_GROUP_ID = "1000000002";

    /** 上位判定グループID */
    public static final String UPPER_LEVEL_JUDGING_GROUP_ID = "1000000003";

    /** 自動審査グループID */
    public static final String AUTO_SCREENING_GROUP_ID = "8888888888";

    /**
     * ローン申請処理を行う。
     * @param entity ローン申請
     */
    public void applyLoan(final LoanApplication entity) {

        final WorkflowInstance instance = WorkflowManager.startInstance("loan");

        // 担当者割り当て
        instance.assignGroup("AUTO_SCREENING", AUTO_SCREENING_GROUP_ID);
        instance.assignUsersToLane("SURVEY_LANE", getSurveyUserList());
        instance.assignGroup("JUDGING", JUDGING_GROUP_ID);
        instance.assignGroup("UPPER_LEVEL_JUDGING", UPPER_LEVEL_JUDGING_GROUP_ID);
        
        // ローン申請登録
        entity.setInsertDateTime(LocalDateTime.now());
        entity.setWfInstanceId(instance.getInstanceId());
        entity.setLoanAppliStatusCd(LoanApplicationStatus.CREATED.name());
        entity.setLoanAppliVersion(instance.getVersion());
        UniversalDao.insert(entity);

        // ローン申請の履歴登録
        final LoanApplicationHistory history = new LoanApplicationHistory();
        history.setLoanAppliId(entity.getLoanAppliId());
        history.setExecutionerId(entity.getInsertUserId());
        history.setLoanAppliActionCd(LoanApplicationApplyStatus.REGISTERED.name());
        history.setLoanAppliResultCd(LoanApplicationResultStatus.OK.name());
        history.setExecutionerId(entity.getInsertUserId());
        history.setExecutionDateTime(entity.getInsertDateTime());
        
        UniversalDao.insert(history);
    }

    /**
     * 調査担当ユーザ一覧を取得する。
     *
     * @return 調査担当ユーザ一覧
     */
    private List<String> getSurveyUserList() {
        return UniversalDao.findAllBySqlFile(Users.class, "USERS_BY_GROUP", new Object[] {PROSPECT_GROUP_ID})
                           .stream()
                           .map(Users::getUserId)
                           .collect(Collectors.toList());
    }
}
