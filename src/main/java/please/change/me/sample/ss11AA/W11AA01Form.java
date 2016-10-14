package please.change.me.sample.ss11AA;

import java.util.Map;

import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.web.HttpRequest;

/**
 * ログインフォーム。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AA01Form extends W11AA01FormBase {

    /**
     * コンストラクタ
     *
     * @param params パラメータ
     */
    public W11AA01Form(Map<String, Object> params) {
        super(params);
    }

    /**
     * バリデーションを実施する。
     *
     * @param req 入力パラメータ情報
     * @param validationName 使用するバリデーションの名前
     * @return 入力パラメータを精査後に生成した本フォーム
     */
    public static W11AA01Form validate(HttpRequest req, String validationName) {
        ValidationContext<W11AA01Form> context = ValidationUtil.validateAndConvertRequest(
                W11AA01Form.class, req, validationName);
        context.abortIfInvalid();
        return context.createObject();
    }

    /**
     * ログイン入力情報を精査する。
     *
     * @param context ValidationContext
     */
    @ValidateFor("login")
    public static void validateForLogin(ValidationContext<W11AA01Form> context) {
        ValidationUtil.validate(context, new String[]{"userId"});
    }
}
