package please.change.me.domain.code;

/**
 * ローン申請処理コード。
 *
 * @author nabchan
 */
public enum LoanApplicationApplyStatus implements Code {
    /** 登録 */
    REGISTERED("registered", "登録"), ;

    /** 値 */
    private final String value;

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param value 値
     * @param label ラベル
     */
    LoanApplicationApplyStatus(final String value, final String label) {
        this.value = value;
        this.label = label;
    }

    @Override
    public String getLabel() {
        return label;
    }

    @Override
    public String getValue() {
        return value;
    }
}
