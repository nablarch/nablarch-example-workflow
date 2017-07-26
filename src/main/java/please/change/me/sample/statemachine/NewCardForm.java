package please.change.me.sample.statemachine;

import java.io.Serializable;
import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.convertor.Digits;
import nablarch.core.validation.validator.NumberRange;
import nablarch.core.validation.validator.Required;

/**
 * カード申し込みForm。
 *
 * @author siosio
 */
public class NewCardForm implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 名前 */
    private String name;

    /** 年収 */
    private Long annualIncome;

    /**
     * Mapを元にFormを構築する。
     *
     * @param param Map
     */
    public NewCardForm(final Map<String, ?> param) {
        name = (String) param.get("name");
        annualIncome = (Long) param.get("annualIncome");
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
    @Required
    @PropertyName("名前")
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
    @Required
    @PropertyName("年収")
    @Digits(integer = 5)
    @NumberRange(min = 0)
    public void setAnnualIncome(final Long annualIncome) {
        this.annualIncome = annualIncome;
    }

    /**
     * 全てのプロパティに対するバリデーションを行う。
     * @param context コンテキスト
     */
    @ValidateFor("validate")
    public static void validate(final ValidationContext<NewCardForm> context) {
        ValidationUtil.validateAll(context);
    }
}
