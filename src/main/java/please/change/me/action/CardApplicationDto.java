package please.change.me.action;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;

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
