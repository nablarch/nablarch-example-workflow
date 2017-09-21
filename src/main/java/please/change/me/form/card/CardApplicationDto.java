package please.change.me.form.card;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import please.change.me.domain.code.CardApplicationStatus;

/**
 * カード申し込みDTO。
 *
 * @author nabchan
 */
@Getter
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class CardApplicationDto {

    /** ID */
    private Integer id;

    /** 名前 */
    private String name;

    /** 年収 */
    private Long annualIncome;

    /** ステータス */
    private CardApplicationStatus status;

    /**
     * ステータスのラベルを返す。
     *
     * @return ステータスのラベル
     */
    public String getStatusLabel() {
        return status.getLabel();
    }
}
