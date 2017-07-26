package please.change.me.sample.statemachine.entity;

/**
 * カード申し込みエンティティ。
 *
 * @author siosio
 */
public class CardApplication {

    /** ID */
    private Long id;

    /** インスタンスID */
    private String instanceId;

    /** 名前 */
    private String name;

    /** 年収 */
    private Long annualIncome;

    /** ステータス */
    private String status;

    /**
     * IDを返す。
     *
     * @return ID
     */
    public Long getId() {
        return id;
    }

    /**
     * IDを設定する。
     *
     * @param id ID
     */
    public void setId(final Long id) {
        this.id = id;
    }

    /**
     * ワークフローインスタンスIDを返す。
     *
     * @return ワークフローインスタンスID
     */
    public String getInstanceId() {
        return instanceId;
    }

    /**
     * ワークフローインスタンスIDを設定する。
     *
     * @param instanceId ワークフローインスタンスID
     */
    public void setInstanceId(final String instanceId) {
        this.instanceId = instanceId;
    }

    /**
     * 名前を返す。
     *
     * @return 名前
     */
    public String getName() {
        return name;
    }

    /**
     * 名前を設定する。
     *
     * @param name 名前
     */
    public void setName(final String name) {
        this.name = name;
    }

    /**
     * 年収を返す。
     *
     * @return 年収
     */
    public Long getAnnualIncome() {
        return annualIncome;
    }

    /**
     * 年収を設定する。
     *
     * @param annualIncome 年収
     */
    public void setAnnualIncome(final Long annualIncome) {
        this.annualIncome = annualIncome;
    }

    /**
     * ステータスを返す。
     * @return ステータス
     */
    public String getStatus() {
        return status;
    }

    /**
     * ステータスを設定する。
     * @param status ステータス
     */
    public void setStatus(final String status) {
        this.status = status;
    }
}
