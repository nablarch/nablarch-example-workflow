package please.change.me.form.loan;

import java.time.LocalDateTime;

import javax.persistence.Entity;

import lombok.Data;
import please.change.me.domain.code.LoanApplicationApplyStatus;
import please.change.me.domain.code.LoanApplicationResultStatus;

/**
 * ローンの承認履歴を保持する。
 *
 * @author nabchan
 */
@Data
public class LoanHistoryDto {

    /** 漢字氏名 */
    private String kanjiName;

    /** 実行日時 */
    private LocalDateTime executionDateTime;

    /** ローン申請処理内容コード */
    private String loanAppliActionCd;

    /** ローン申請処理結果コード */
    private String loanAppliResultCd;

    /** コメント */
    private String historyComment;

    /**
     * 申請の処理内容を返す。
     *
     * @return 処理内容
     */
    public String getLoanAppliActionLabel() {
        return LoanApplicationApplyStatus.valueOf(loanAppliActionCd).getLabel();
    }

    /**
     * 審査の結果内容を返す。
     * @return 審査の結果内容
     */
    public String getLoanAppliResultLabel() {
        return LoanApplicationResultStatus.valueOf(loanAppliResultCd).getLabel();
    }
}
