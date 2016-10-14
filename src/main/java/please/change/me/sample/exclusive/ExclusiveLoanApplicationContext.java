package please.change.me.sample.exclusive;

import nablarch.common.exclusivecontrol.ExclusiveControlContext;

/**
 * ローン申請テーブルの排他制御クラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class ExclusiveLoanApplicationContext extends ExclusiveControlContext {

    /**
     * 主キー定義。
     *
     * @author hisaaki sioiri
     * @since 1.4.2
     */
    private enum PK {
        /** ローン申請ID */
        LOAN_APPLI_ID
    }

    /**
     * コンストラクタ。
     *
     * @param loanAppliId ローン申請ID
     */
    public ExclusiveLoanApplicationContext(String loanAppliId) {
        setTableName("LOAN_APPLICATION");
        setVersionColumnName("LOAN_APPLI_VERSION");
        setPrimaryKeyColumnNames(PK.values());
        appendCondition(PK.LOAN_APPLI_ID, loanAppliId);
    }
}

