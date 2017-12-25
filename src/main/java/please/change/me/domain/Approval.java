package please.change.me.domain;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

/**
 * 申請情報。
 *
 * @author nabchan
 */
@Data
public class Approval {

    /** 申請ID */
    private String applicationId;

    /** タイプ */
    private String businessType;

    /** 申請日時 */
    @Temporal(value = TemporalType.TIMESTAMP)
    private Date applicationDate;

    /** 申請者名 */
    private String applicationUserName;

    /** ステータス */
    private String statusCd;

}
