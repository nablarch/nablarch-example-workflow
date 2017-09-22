package please.change.me.domain.code;

/**
 * ローン申請処理コード。
 *
 * @author nabchan
 */
public enum LoanApplicationApplyStatus implements Code {
    /** 登録 */
    REGISTERED("登録"),
    /** 自動審査 */
    AUTO_SCREENING("自動審査"),
    /** 調査 */
    SURVEY("調査"),
    /** 判定 */
    JUDGING("判定"),
    /** 上位者判定 */
    UPPER_LEVEL_JUDGING("上位者判定"),
    /** 実行 */
    EXECUTE("実行");

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param label ラベル
     */
    LoanApplicationApplyStatus(final String label) {
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
