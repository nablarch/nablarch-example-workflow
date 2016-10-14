package please.change.me.sample.ss11.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Map;

import nablarch.core.db.statement.autoproperty.CurrentDateTime;
import nablarch.core.db.statement.autoproperty.UserId;

/**
 * 交通費申請テーブルの情報を保持するクラス。
 *
 * TransExpeApplicationEntity クラスは TRANS_EXPE_APPLICATION テーブルにマッピングされるテーブルフィールドを保持する。
 *
 * @author Entity Generator
 * @since 1.0
 */
public class TransExpeApplicationEntity implements Serializable {

    /**
     * serialVersionUID。
     */
    private static final long serialVersionUID = 1L;

    /**
     * 交通費申請ID。
     */
    private String transExpeAppliId;

    /**
     * ワークフローインスタンスID。
     */
    private String wfInstanceId;

    /**
     * 交通費申請ステータス。
     */
    private String transExpeAppliStatusCd;

    /**
     * 移動種類。
     */
    private String transDeviceCd;

    /**
     * 出発地。
     */
    private String departure;

    /**
     * 目的地。
     */
    private String destination;

    /**
     * 交通費。
     */
    private Integer transExpense;

    /**
     * 確認者ID。
     */
    private String confirmUserId;

    /**
     * 承認者ID。
     */
    private String authorizeUserId;

    /**
     * 申請者ID。
     */
    @UserId
    private String insertUserId;

    /**
     * 申請日時。
     */
    @CurrentDateTime
    private Timestamp insertDateTime;

    /**
     * 交通費申請バージョン番号。
     */
    private BigDecimal transExpeAppliVersion;



    /**
     * デフォルトコンストラクタ。
     */
    public TransExpeApplicationEntity() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     * @param params 項目名をキーとし、項目値を値とするMap。
     */
    public TransExpeApplicationEntity(Map<String, Object> params) {
        transExpeAppliId = (String) params.get("transExpeAppliId");
        wfInstanceId = (String) params.get("wfInstanceId");
        transExpeAppliStatusCd = (String) params.get("transExpeAppliStatusCd");
        transDeviceCd = (String) params.get("transDeviceCd");
        departure = (String) params.get("departure");
        destination = (String) params.get("destination");
        transExpense = (Integer) params.get("transExpense");
        confirmUserId = (String) params.get("confirmUserId");
        authorizeUserId = (String) params.get("authorizeUserId");
        insertUserId = (String) params.get("insertUserId");
        insertDateTime = (Timestamp) params.get("insertDateTime");
        transExpeAppliVersion = (BigDecimal) params.get("transExpeAppliVersion");
    }


    /**
     * 交通費申請IDを取得する。
     * @return 交通費申請ID。
     */
    public String getTransExpeAppliId() {
        return transExpeAppliId;
    }

    /**
     * 交通費申請IDを設定する。
     * @param transExpeAppliId 設定する交通費申請ID。
     */
    public void setTransExpeAppliId(String transExpeAppliId) {
        this.transExpeAppliId = transExpeAppliId;
    }

    /**
     * ワークフローインスタンスIDを取得する。
     * @return ワークフローインスタンスID。
     */
    public String getWfInstanceId() {
        return wfInstanceId;
    }

    /**
     * ワークフローインスタンスIDを設定する。
     * @param wfInstanceId 設定するワークフローインスタンスID。
     */
    public void setWfInstanceId(String wfInstanceId) {
        this.wfInstanceId = wfInstanceId;
    }

    /**
     * 交通費申請ステータスを取得する。
     * @return 交通費申請ステータス。
     */
    public String getTransExpeAppliStatusCd() {
        return transExpeAppliStatusCd;
    }

    /**
     * 交通費申請ステータスを設定する。
     * @param transExpeAppliStatusCd 設定する交通費申請ステータス。
     */
    public void setTransExpeAppliStatusCd(String transExpeAppliStatusCd) {
        this.transExpeAppliStatusCd = transExpeAppliStatusCd;
    }

    /**
     * 移動種類を取得する。
     * @return 移動種類。
     */
    public String getTransDeviceCd() {
        return transDeviceCd;
    }

    /**
     * 移動種類を設定する。
     * @param transDeviceCd 設定する移動種類。
     */
    public void setTransDeviceCd(String transDeviceCd) {
        this.transDeviceCd = transDeviceCd;
    }

    /**
     * 出発地を取得する。
     * @return 出発地。
     */
    public String getDeparture() {
        return departure;
    }

    /**
     * 出発地を設定する。
     * @param departure 設定する出発地。
     */
    public void setDeparture(String departure) {
        this.departure = departure;
    }

    /**
     * 目的地を取得する。
     * @return 目的地。
     */
    public String getDestination() {
        return destination;
    }

    /**
     * 目的地を設定する。
     * @param destination 設定する目的地。
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * 交通費を取得する。
     * @return 交通費。
     */
    public Integer getTransExpense() {
        return transExpense;
    }

    /**
     * 交通費を設定する。
     * @param transExpense 設定する交通費。
     */
    public void setTransExpense(Integer transExpense) {
        this.transExpense = transExpense;
    }

    /**
     * 確認者IDを取得する。
     * @return 確認者ID。
     */
    public String getConfirmUserId() {
        return confirmUserId;
    }

    /**
     * 確認者IDを設定する。
     * @param confirmUserId 設定する確認者ID。
     */
    public void setConfirmUserId(String confirmUserId) {
        this.confirmUserId = confirmUserId;
    }

    /**
     * 承認者IDを取得する。
     * @return 承認者ID。
     */
    public String getAuthorizeUserId() {
        return authorizeUserId;
    }

    /**
     * 承認者IDを設定する。
     * @param authorizeUserId 設定する承認者ID。
     */
    public void setAuthorizeUserId(String authorizeUserId) {
        this.authorizeUserId = authorizeUserId;
    }

    /**
     * 申請者IDを取得する。
     * @return 申請者ID。
     */
    public String getInsertUserId() {
        return insertUserId;
    }

    /**
     * 申請者IDを設定する。
     * @param insertUserId 設定する申請者ID。
     */
    public void setInsertUserId(String insertUserId) {
        this.insertUserId = insertUserId;
    }

    /**
     * 申請日時を取得する。
     * @return 申請日時。
     */
    public Timestamp getInsertDateTime() {
        return insertDateTime;
    }

    /**
     * 申請日時を設定する。
     * @param insertDateTime 設定する申請日時。
     */
    public void setInsertDateTime(Timestamp insertDateTime) {
        this.insertDateTime = insertDateTime;
    }

    /**
     * 交通費申請バージョン番号を取得する。
     * @return 交通費申請バージョン番号。
     */
    public BigDecimal getTransExpeAppliVersion() {
        return transExpeAppliVersion;
    }

    /**
     * 交通費申請バージョン番号を設定する。
     * @param transExpeAppliVersion 設定する交通費申請バージョン番号。
     */
    public void setTransExpeAppliVersion(BigDecimal transExpeAppliVersion) {
        this.transExpeAppliVersion = transExpeAppliVersion;
    }

}
