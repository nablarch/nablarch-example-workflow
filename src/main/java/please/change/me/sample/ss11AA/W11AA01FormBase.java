package please.change.me.sample.ss11AA;

import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;

/**
 * ログインフォーム。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public abstract class W11AA01FormBase {

    /** ユーザID */
    private String userId;

    /**
     * コンストラクタ
     *
     * @param params パラメータ
     */
    public W11AA01FormBase(Map<String, Object> params) {
        userId = (String) params.get("userId");
    }

    /**
     * ユーザIDを取得する。
     *
     * @return ユーザID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * ユーザIDを設定する。
     *
     * @param userId ユーザID
     */
    @PropertyName(messageId = "S0010002")
    @Required
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setUserId(String userId) {
        this.userId = userId;
    }
}
