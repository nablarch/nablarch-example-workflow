package please.change.me.sample.ss11AC;

import java.util.HashMap;
import java.util.Map;

import nablarch.common.date.YYYYMMDD;
import nablarch.core.validation.PropertyName;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;

/**
 * ローン申請登録フォームベースクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public abstract class W11AC01FormBase {

    /** 勤務先 */
    private String company;

    /** 年収 */
    private Integer annualSalary;

    /** ローン申請額 */
    private Integer loanAmount;

    /** 振込日 */
    private String transferDate;

    /**
     * ローン申請登録フォームを生成する。
     */
    public W11AC01FormBase() {
    }

    /**
     * パラメータを元にローン申請登録フォームを生成する。
     *
     * @param param パラメータ
     */
    public W11AC01FormBase(Map<String, ?> param) {
        company = (String) param.get("company");
        annualSalary = (Integer) param.get("annualSalary");
        loanAmount = (Integer) param.get("loanAmount");
        transferDate = (String) param.get("transferDate");
    }

    /**
     * プロパティの情報をMapに変換する。
     *
     * @return 変換後のMap
     */
    protected Map<String, Object> toMap() {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("company", company);
        result.put("annualSalary", annualSalary);
        result.put("loanAmount", loanAmount);
        result.put("transferDate", transferDate);
        return result;
    }

    /**
     * 勤務先を取得する。
     *
     * @return 勤務先
     */
    public String getCompany() {
        return company;
    }

    /**
     * 勤務先を設定する。
     *
     * @param company 勤務先
     */
    @Length(max = 100)
    @SystemChar(charsetDef = "ZenkakuChar")
    @PropertyName("勤務先")
    @Required
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 年収を取得する。
     * @return 年収
     */
    public Integer getAnnualSalary() {
        return annualSalary;
    }

    /**
     * 年収を設定する。
     * @param annualSalary 年収
     */
    @PropertyName("年収")
    @Digits(integer = 7)
    @Required
    public void setAnnualSalary(Integer annualSalary) {
        this.annualSalary = annualSalary;
    }

    /**
     * ローン申請額を取得する。
     * @return ローン申請額
     */
    public Integer getLoanAmount() {
        return loanAmount;
    }

    /**
     * ローン申請額を設定する。
     * @param loanAmount ローン申請額
     */
    @PropertyName("ローン申請額")
    @Digits(integer = 5)
    @Required
    public void setLoanAmount(Integer loanAmount) {
        this.loanAmount = loanAmount;
    }

    /**
     * 振込日を取得する。
     * @return 振込日
     */
    public String getTransferDate() {
        return transferDate;
    }

    /**
     * 振込日を設定する。
     * @param transferDate 振込日
     */
    @PropertyName("振込日")
    @YYYYMMDD(allowFormat = "yyyy/MM/dd")
    @Required
    public void setTransferDate(String transferDate) {
        this.transferDate = transferDate;
    }
}


