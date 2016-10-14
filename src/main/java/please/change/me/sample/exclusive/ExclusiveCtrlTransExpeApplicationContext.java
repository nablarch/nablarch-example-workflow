package please.change.me.sample.exclusive;

import nablarch.common.exclusivecontrol.ExclusiveControlContext;

/**
 * 交通費申請排他制御の制御クラス。
 * @author Ryo Asato
 * @since 1.4.2
 */
public class ExclusiveCtrlTransExpeApplicationContext extends ExclusiveControlContext {

    /**
     * 主キー定義。
     * @author Ryo Asato
     * @since 1.4.2
     */
    private enum PK {
        /** 交通費申請ID */
        TRANS_EXPE_APPLI_ID
    }
    
    /**
     * コンストラクタ。
     * @param transExpeAppliId 交通費申請ID
     */
    public ExclusiveCtrlTransExpeApplicationContext(String transExpeAppliId) {
        setTableName("TRANS_EXPE_APPLICATION");
        setVersionColumnName("TRANS_EXPE_APPLI_VERSION");
        setPrimaryKeyColumnNames(PK.values());
        appendCondition(PK.TRANS_EXPE_APPLI_ID, transExpeAppliId);
    }
}
