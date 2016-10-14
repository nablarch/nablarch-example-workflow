package please.change.me.sample.ss11.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

import nablarch.core.db.statement.autoproperty.CurrentDateTime;
import nablarch.core.db.statement.autoproperty.UserId;

/**
 * ローン申請処理履歴テーブルの情報を保持するクラス。
 *
 * LoanApplicationHistoryEntity クラスは LOAN_APPLICATION_HISTORY テーブルにマッピングされるテーブルフィールドを保持する。
 *
 * @author Entity Generator
 * @since 1.0
 */
public class LoanApplicationHistoryEntity implements Serializable {

    /**
     * serialVersionUID。
     */
    private static final long serialVersionUID = 1L;

    /**
     * ローン申請処理履歴ID。
     */
    private String loanAppliHistoryId;

    /**
     * ローン申請ID。
     */
    private String loanAppliId;

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
     * ローン申請処理内容コード。
     */
    private String loanAppliActionCd;

    /**
     * ローン申請処理結果コード。
     */
    private String loanAppliResultCd;

    /**
     * コメント。
     */
    private String historyComment;



    /**
     * デフォルトコンストラクタ。
     */
    public LoanApplicationHistoryEntity() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     * @param params 項目名をキーとし、項目値を値とするMap。
     */
    public LoanApplicationHistoryEntity(Map<String, Object> params) {
        loanAppliHistoryId = (String) params.get("loanAppliHistoryId");
        loanAppliId = (String) params.get("loanAppliId");
        executionerId = (String) params.get("executionerId");
        executionDateTime = (Timestamp) params.get("executionDateTime");
        loanAppliActionCd = (String) params.get("loanAppliActionCd");
        loanAppliResultCd = (String) params.get("loanAppliResultCd");
        historyComment = (String) params.get("historyComment");
    }


    /**
     * ローン申請処理履歴IDを取得する。
     * @return ローン申請処理履歴ID。
     */
    public String getLoanAppliHistoryId() {
        return loanAppliHistoryId;
    }

    /**
     * ローン申請処理履歴IDを設定する。
     * @param loanAppliHistoryId 設定するローン申請処理履歴ID。
     */
    public void setLoanAppliHistoryId(String loanAppliHistoryId) {
        this.loanAppliHistoryId = loanAppliHistoryId;
    }

    /**
     * ローン申請IDを取得する。
     * @return ローン申請ID。
     */
    public String getLoanAppliId() {
        return loanAppliId;
    }

    /**
     * ローン申請IDを設定する。
     * @param loanAppliId 設定するローン申請ID。
     */
    public void setLoanAppliId(String loanAppliId) {
        this.loanAppliId = loanAppliId;
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
     * ローン申請処理内容コードを取得する。
     * @return ローン申請処理内容コード。
     */
    public String getLoanAppliActionCd() {
        return loanAppliActionCd;
    }

    /**
     * ローン申請処理内容コードを設定する。
     * @param loanAppliActionCd 設定するローン申請処理内容コード。
     */
    public void setLoanAppliActionCd(String loanAppliActionCd) {
        this.loanAppliActionCd = loanAppliActionCd;
    }

    /**
     * ローン申請処理結果コードを取得する。
     * @return ローン申請処理結果コード。
     */
    public String getLoanAppliResultCd() {
        return loanAppliResultCd;
    }

    /**
     * ローン申請処理結果コードを設定する。
     * @param loanAppliResultCd 設定するローン申請処理結果コード。
     */
    public void setLoanAppliResultCd(String loanAppliResultCd) {
        this.loanAppliResultCd = loanAppliResultCd;
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
