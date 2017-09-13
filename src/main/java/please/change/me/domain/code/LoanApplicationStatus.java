package please.change.me.domain.code;

/**
 * ローン申請ステータス。
 *
 * @author nabchan
 */
public enum LoanApplicationStatus implements Code {

    /** 申請完了 */
    CREATED("created", "自動審査待ち");

    /** 値 */
    private final String value;

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param value 値
     * @param label ラベル
     */
    LoanApplicationStatus(final String value, final String label) {
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
