package please.change.me.form.approval;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import please.change.me.domain.code.BusinessType;
import please.change.me.domain.code.LoanApplicationStatus;

/**
 * 申請結果を保持するフォーム
 *
 * @author nabchan
 */
@Getter
@AllArgsConstructor
public class ApprovalResultForm implements Serializable {
    
    /** serialVersionUID */
    private static final long serialVersionUID = -1L;

    /** 申請ID */
    private String applicationId;

    /** タイプ */
    private String businessType;

    /** 申請日時 */
    private LocalDateTime applicationDate;

    /** 申請者名 */
    private String applicationUserName;

    /** ステータス */
    private String statusCd;

    /**
     * タイプのラベルを返す。
     *
     * @return タイプのラベル
     */
    public String getBusinessTypeLabel() {
        if ("1".equals(businessType)) {
            return BusinessType.LOAN.getLabel();
        } else {
            return BusinessType.TRANSPORTATION.getLabel();
        }
    }

    /**
     * ステータスのラベルを返す。
     *
     * @return ステータスのラベル。
     */
    public String getStatusLabel() {
        if ("1".equals(businessType)) {
            return LoanApplicationStatus.valueOf(statusCd)
                                        .getLabel();
        } else {
            return "";
        }
    }
}
