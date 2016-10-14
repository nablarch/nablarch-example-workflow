package please.change.me.sample.ss11.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

import nablarch.core.db.statement.autoproperty.CurrentDateTime;
import nablarch.core.db.statement.autoproperty.UserId;

/**
 * 交通費申請処理履歴テーブルの情報を保持するクラス。
 *
 * TransExpeAppliHistoryEntity クラスは TRANS_EXPE_APPLI_HISTORY テーブルにマッピングされるテーブルフィールドを保持する。
 *
 * @author Entity Generator
 * @since 1.0
 */
public class TransExpeAppliHistoryEntity implements Serializable {

    /**
     * serialVersionUID。
     */
    private static final long serialVersionUID = 1L;

    /**
     * 交通費申請処理履歴ID。
     */
    private String transExpeAppliHistoryId;

    /**
     * 交通費申請ID。
     */
    private String transExpeAppliId;

    /**
     * 実行ユーザーID。
     */
    @UserId
    private String executionerId;

    /**
     * 実行日時。
     */
    @CurrentDateTime
    private Timestamp executionDateTime;

    /**
     * 交通費申請処理内容コード。
     */
    private String transExpeAppliActionCd;

    /**
     * 交通費申請処理結果コード。
     */
    private String transExpeAppliResultCd;

    /**
     * コメント。
     */
    private String historyComment;



    /**
     * デフォルトコンストラクタ。
     */
    public TransExpeAppliHistoryEntity() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     * @param params 項目名をキーとし、項目値を値とするMap。
     */
    public TransExpeAppliHistoryEntity(Map<String, Object> params) {
        transExpeAppliHistoryId = (String) params.get("transExpeAppliHistoryId");
        transExpeAppliId = (String) params.get("transExpeAppliId");
        executionerId = (String) params.get("executionerId");
        executionDateTime = (Timestamp) params.get("executionDateTime");
        transExpeAppliActionCd = (String) params.get("transExpeAppliActionCd");
        transExpeAppliResultCd = (String) params.get("transExpeAppliResultCd");
        historyComment = (String) params.get("historyComment");
    }


    /**
     * 交通費申請処理履歴IDを取得する。
     * @return 交通費申請処理履歴ID。
     */
    public String getTransExpeAppliHistoryId() {
        return transExpeAppliHistoryId;
    }

    /**
     * 交通費申請処理履歴IDを設定する。
     * @param transExpeAppliHistoryId 設定する交通費申請処理履歴ID。
     */
    public void setTransExpeAppliHistoryId(String transExpeAppliHistoryId) {
        this.transExpeAppliHistoryId = transExpeAppliHistoryId;
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
     * 実行ユーザーIDを取得する。
     * @return 実行ユーザーID。
     */
    public String getExecutionerId() {
        return executionerId;
    }

    /**
     * 実行ユーザーIDを設定する。
     * @param executionerId 設定する実行ユーザーID。
     */
    public void setExecutionerId(String executionerId) {
        this.executionerId = executionerId;
    }

    /**
     * 実行日時を取得する。
     * @return 実行日時。
     */
    public Timestamp getExecutionDateTime() {
        return executionDateTime;
    }

    /**
     * 実行日時を設定する。
     * @param executionDateTime 設定する実行日時。
     */
    public void setExecutionDateTime(Timestamp executionDateTime) {
        this.executionDateTime = executionDateTime;
    }

    /**
     * 交通費申請処理内容コードを取得する。
     * @return 交通費申請処理内容コード。
     */
    public String getTransExpeAppliActionCd() {
        return transExpeAppliActionCd;
    }

    /**
     * 交通費申請処理内容コードを設定する。
     * @param transExpeAppliActionCd 設定する交通費申請処理内容コード。
     */
    public void setTransExpeAppliActionCd(String transExpeAppliActionCd) {
        this.transExpeAppliActionCd = transExpeAppliActionCd;
    }

    /**
     * 交通費申請処理結果コードを取得する。
     * @return 交通費申請処理結果コード。
     */
    public String getTransExpeAppliResultCd() {
        return transExpeAppliResultCd;
    }

    /**
     * 交通費申請処理結果コードを設定する。
     * @param transExpeAppliResultCd 設定する交通費申請処理結果コード。
     */
    public void setTransExpeAppliResultCd(String transExpeAppliResultCd) {
        this.transExpeAppliResultCd = transExpeAppliResultCd;
    }

    /**
     * コメントを取得する。
     * @return コメント。
     */
    public String getHistoryComment() {
        return historyComment;
    }

    /**
     * コメントを設定する。
     * @param historyComment 設定するコメント。
     */
    public void setHistoryComment(String historyComment) {
        this.historyComment = historyComment;
    }

}
