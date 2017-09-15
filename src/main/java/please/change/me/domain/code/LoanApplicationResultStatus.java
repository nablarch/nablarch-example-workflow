package please.change.me.domain.code;

/**
 * ローン申請の処理結果ステータス。
 *
 * @author nabchan
 */
public enum LoanApplicationResultStatus implements Code {

    /** 申請完了 */
    OK("ok", "完了");

    /** 値 */
    private final String value;

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param value 値
     * @param label ラベル
     */
    LoanApplicationResultStatus(final String value, final String label) {
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
