package please.change.me.action;

/**
 * カード申し込み状態。
 *
 * @author nabchan
 */
public enum CardApplicationStatus {

    /** 新規 */
    NEW("新規申し込み"),
    /** 審査NG */
    NG("審査NG"),
    /** 審査OK */
    OK("審査OK"),
    /** 継続審査 */
    CONTINUOUS("継続審査");

    /** ラベル文言 */
    private final String label;

    /**
     * ラベル文言を元にオブジェクトを構築する。
     * @param label ラベル文言
     */
    CardApplicationStatus(final String label) {
        this.label = label;
    }

    /**
     * ラベル文言を返す。
     * @return ラベル文言
     */
    String getLabel() {
        return label;
    }
}
