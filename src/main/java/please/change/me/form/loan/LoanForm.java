package please.change.me.form.loan;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

import nablarch.core.validation.ee.Domain;
import nablarch.core.validation.ee.Required;

/**
 * ローン申請フォーム
 *
 * @author nabchan
 */
@Getter
@Setter
public class LoanForm implements Serializable {

    /** シリアルバージョンUID */
    private static final long serialVersionUID = -1L;

    /** 勤務先 */
    @Required
    @Domain("会社名")
    private String company;

    /** 年収 */
    @Required
    @Domain("万円")
    private String annualSalary;

    /** ローン申請額 */
    @Required
    @Domain("万円")
    private String loanAmount;

    /** 振込日 */
    @Required
    @Domain("日付")
    private String transferDate;

    /**
     * 年収を設定する。
     * @param annualSalary 年収
     */
    public void setAnnualSalary(final String annualSalary) {
        this.annualSalary = annualSalary == null ? null : annualSalary.replaceAll(",", "");
    }

    /**
     * ローン申請額を設定する。
     * @param loanAmount ローン申請額
     */
    public void setLoanAmount(final String loanAmount) {
        this.loanAmount = loanAmount == null ? null : loanAmount.replaceAll(",", "");
    }

    /**
     * 振込日を設定する。
     * @param transferDate 振込日
     */
    public void setTransferDate(final String transferDate) {
        this.transferDate = transferDate == null ? null : transferDate.replaceAll("/", "");
    }
}
