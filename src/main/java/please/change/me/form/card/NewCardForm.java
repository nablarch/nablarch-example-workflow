package please.change.me.form.card;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import nablarch.core.validation.ee.Domain;
import nablarch.core.validation.ee.Required;

import java.io.Serializable;

/**
 * カード申し込みForm。
 *
 * @author nabchan
 */
@Getter
@Setter
public class NewCardForm implements Serializable {

    private static final long serialVersionUID = -1L;

    /** 名前 */
    @Required
    @Domain("名前")
    private String name;

    /** 年収 */
    @Required
    @Domain("万円")
    private String annualIncome;

}

