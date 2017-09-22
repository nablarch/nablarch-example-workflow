package please.change.me.form.approval;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

import nablarch.core.validation.ee.Domain;
import nablarch.core.validation.ee.Required;

/**
 * 調査タスク用フォーム。
 *
 * @author nabchan
 */
@Getter
@Setter
public class SurveyForm implements Serializable {

    /** serialVersionUID */
    private static final long serialVersionUID = -1L;

    /** 調査コメント */
    @Required
    @Domain("コメント")
    private String surveyComment;

    /** コメント */
    @Domain("コメント")
    private String comment;
}
