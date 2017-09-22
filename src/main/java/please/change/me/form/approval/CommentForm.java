package please.change.me.form.approval;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

import nablarch.core.validation.ee.Domain;

/**
 * コメントを持つフォーム
 *
 * @author nabchan
 */
@Getter
@Setter
public class CommentForm implements Serializable {

    /** serialVersionUID */
    private static final long serialVersionUID = -1L;

    /** コメント */
    @Domain("コメント")
    private String comment;
}
