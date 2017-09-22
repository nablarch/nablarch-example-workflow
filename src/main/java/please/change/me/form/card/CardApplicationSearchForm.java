package please.change.me.form.card;

import lombok.Data;
import nablarch.core.validation.ee.Digits;
import nablarch.core.validation.ee.Required;

import java.io.Serializable;

/**
 * カード申し込み検索用Form。
 *
 * @author nabchan
 */
@Data
public class CardApplicationSearchForm implements Serializable {

    /** ID **/
    @Required
    @Digits(integer = 10)
    private String id;
}
