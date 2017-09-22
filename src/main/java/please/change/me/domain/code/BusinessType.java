package please.change.me.domain.code;

/**
 * 業務タイプを表す。
 *
 * @author nabchan
 */
public enum BusinessType implements Code {
    
    /** ローン申請 */
    LOAN("ローン申請"),
    /** 交通費申請 */
    TRANSPORTATION("交通費申請");

    /** ラベル */
    private final String label;

    /**
     * コンストラクタ。
     * @param label ラベル。
     */
    BusinessType(final String label) {
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
