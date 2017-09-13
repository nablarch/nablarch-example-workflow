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
    
    @SuppressWarnings("JavaDoc")
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
     * 振込日を返す。
     * @return 振込日
     */
    public String getTransferDate() {
        return transferDate.replaceAll("/", "");
    }
}
