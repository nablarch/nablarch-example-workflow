package please.change.me.sample.ss11.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Map;

import nablarch.core.db.statement.autoproperty.CurrentDateTime;
import nablarch.core.db.statement.autoproperty.UserId;

/**
 * ローン申請テーブルの情報を保持するクラス。
 *
 * LoanApplicationEntity クラスは LOAN_APPLICATION テーブルにマッピングされるテーブルフィールドを保持する。
 *
 * @author Entity Generator
 * @since 1.0
 */
public class LoanApplicationEntity implements Serializable {

    /**
     * serialVersionUID。
     */
    private static final long serialVersionUID = 1L;

    /**
     * ローン申請ID。
     */
    private String loanAppliId;

    /**
     * ワークフローインスタンスID。
     */
    private String wfInstanceId;

    /**
     * ローン申請ステータス。
     */
    private String loanAppliStatusCd;

    /**
     * 勤務先。
     */
    private String company;

    /**
     * 年収。
     */
    private Integer annualSalary;

    /**
     * 利用限度額。
     */
    private Integer loanAmount;

    /**
     * 利用開始日。
     */
    private String transferDate;

    /**
     * 調査結果。
     */
    private String surveyContent;

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
     * ローン申請バージョン番号。
     */
    private Long loanAppliVersion;



    /**
     * デフォルトコンストラクタ。
     */
    public LoanApplicationEntity() {
    }

    /**
     * Mapを引数にとるコンストラクタ。
     * @param params 項目名をキーとし、項目値を値とするMap。
     */
    public LoanApplicationEntity(Map<String, Object> params) {
        loanAppliId = (String) params.get("loanAppliId");
        wfInstanceId = (String) params.get("wfInstanceId");
        loanAppliStatusCd = (String) params.get("loanAppliStatusCd");
        company = (String) params.get("company");
        annualSalary = (Integer) params.get("annualSalary");
        loanAmount = (Integer) params.get("loanAmount");
        transferDate = (String) params.get("transferDate");
        surveyContent = (String) params.get("surveyContent");
        insertUserId = (String) params.get("insertUserId");
        insertDateTime = (Timestamp) params.get("insertDateTime");
        loanAppliVersion = (Long) params.get("loanAppliVersion");
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
     * ローン申請ステータスを取得する。
     * @return ローン申請ステータス。
     */
    public String getLoanAppliStatusCd() {
        return loanAppliStatusCd;
    }

    /**
     * ローン申請ステータスを設定する。
     * @param loanAppliStatusCd 設定するローン申請ステータス。
     */
    public void setLoanAppliStatusCd(String loanAppliStatusCd) {
        this.loanAppliStatusCd = loanAppliStatusCd;
    }

    /**
     * 勤務先を取得する。
     * @return 勤務先。
     */
    public String getCompany() {
        return company;
    }

    /**
     * 勤務先を設定する。
     * @param company 設定する勤務先。
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 年収を取得する。
     * @return 年収。
     */
    public Integer getAnnualSalary() {
        return annualSalary;
    }

    /**
     * 年収を設定する。
     * @param annualSalary 設定する年収。
     */
    public void setAnnualSalary(Integer annualSalary) {
        this.annualSalary = annualSalary;
    }

    /**
     * ローン申請金額を取得する。
     * @return ローン申請金額
     */
    public Integer getLoanAmount() {
        return loanAmount;
    }

    /**
     * ローン申請金額を設定する。
     * @param loanAmount ローン申請金額
     */
    public void setLoanAmount(Integer loanAmount) {
        this.loanAmount = loanAmount;
    }

    /**
     * 振込日を取得する。
     * @return 振込日。
     */
    public String getTransferDate() {
        return transferDate;
    }

    /**
     * 振込日を設定する。
     * @param transferDate 振込日
     */
    public void setTransferDate(String transferDate) {
        this.transferDate = transferDate;
    }

    /**
     * 調査結果を取得する。
     * @return 調査結果。
     */
    public String getSurveyContent() {
        return surveyContent;
    }

    /**
     * 調査結果を設定する。
     * @param surveyContent 設定する調査結果。
     */
    public void setSurveyContent(String surveyContent) {
        this.surveyContent = surveyContent;
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
     * ローン申請バージョン番号を取得する。
     * @return ローン申請バージョン番号。
     */
    public Long getLoanAppliVersion() {
        return loanAppliVersion;
    }

    /**
     * ローン申請バージョン番号を設定する。
     * @param loanAppliVersion 設定するローン申請バージョン番号。
     */
    public void setLoanAppliVersion(Long loanAppliVersion) {
        this.loanAppliVersion = loanAppliVersion;
    }

}
