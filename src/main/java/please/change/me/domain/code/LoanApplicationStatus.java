package please.change.me.domain.code;

/**
 * ローン申請ステータス。
 *
 * @author nabchan
 */
public enum LoanApplicationStatus implements Code {

    /** 申請完了 */
    CREATED("自動審査待ち"),
    /** 調査待ち */
    WAIT_INQUIRY("調査待ち"),
    /** 調査待ち(再調査) */
    RE_WAIT_INQUIRY("調査待ち(再調査)"),
    /** 却下 */
    REJECTION("却下"),
    /** 判定待ち */
    WAIT_JUDGING("判定待ち"),
    /** 上位判定待ち */
    UPPER_LEVEL_JUDGING("上位判定待ち"),
    /** 審査完了待ち */
    WAIT_COMPLETION("審査完了待ち"),
    /** 完了 */
    COMPLETED("完了");
    

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param label ラベル
     */
    LoanApplicationStatus(final String label) {
        this.label = label;
    }

    @Override
    public String getLabel() {
        return label;
    }

    @Override
    public String getValue() {
        return name();
    }
}
