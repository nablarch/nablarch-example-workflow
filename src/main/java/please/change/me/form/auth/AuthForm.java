package please.change.me.form.auth;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

import nablarch.core.validation.ee.Required;


/**
 * 認証用のフォーム
 *
 * @author nabchan
 */
@Getter
@Setter
public class AuthForm implements Serializable {

    /** serialVersionUID */
    private static final long serialVersionUID = -1L;

    /**
     * ユーザID
     */
    @Required(message = "選択してください。")
    private String userId;

}
