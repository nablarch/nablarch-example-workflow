package please.change.me.sample.ss11AB;

import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.unicode.SystemChar;
import nablarch.fw.web.HttpRequest;

/**
 * 承認一覧照会で使用するForm
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AB01Form extends W11AB01FormBase {

    /** デフォルトシリアルバージョンID */
    private static final long serialVersionUID = 1L;
    
    /** ログインユーザID */
    private String loginUserId;
    
    /** ログインユーザの属するグループID */
    private String ugroupId;

    /**
     * デフォルトコンストラクタ
     */
    public W11AB01Form() {
        // nothing.
    }
    
    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AB01Form(Map<String, Object> params) {
        super(params);
        loginUserId = (String) params.get("loginUserId");
        ugroupId = (String) params.get("ugroupId");
    }
    
    
    /** 検索条件 */
    private static final String[] SEARCH_CONDITION_PROPS = new String[] {"businessType", "applicationUserId", "pageNumber"};
    
    @Override
    public String[] getSearchConditionProps() {
        return SEARCH_CONDITION_PROPS;
    }

    /**
     * ログインユーザIDを取得する。
     * @return ログインユーザID
     */
    public String getLoginUserId() {
        return loginUserId;
    }

    /**
     * ログインユーザIDを設定する。
     * @param loginUserId ログインユーザID
     */
    @PropertyName("ログインユーザ")
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setLoginUserId(String loginUserId) {
        this.loginUserId = loginUserId;
    }
    
    /**
     * ログインユーザの属するグループIDを取得する。
     * @return ログインユーザの属するグループID
     */
    public String getUgroupId() {
        return this.ugroupId;
    }
    
    /**
     * ログインユーザの属するグループIDを設定する。
     * @param ugroupId ログインユーザの属するグループID
     */
    public void setUgroupId(String ugroupId) {
        this.ugroupId = ugroupId;
    }
    
    /**
     * バリデーションを実施する。<br/>
     * ページ番号はユーザが入力する項目ではないため、
     * 当該項目が精査エラーの場合は検索条件を引き継いでいないと判断し、空のFormを返す。
     *
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName 使用するバリデーションの名前
     * @return 入力パラメータを精査後に生成した本フォーム
     */
    public static W11AB01Form validate(String prefix, HttpRequest req, String validationName) {
        ValidationContext<W11AB01Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AB01Form.class, req, validationName);
        if (context.isInvalid("pageNumber")) {
            return new W11AB01Form();
        } else {
            context.abortIfInvalid();
            return context.createObject();
        }
    }
    
    /**
     * 検索時の精査
     * @param context validationContext
     */
    @ValidateFor("search")
    public static void validateForSearch(ValidationContext<W11AB01Form> context) {
        ValidationUtil.validate(context, SEARCH_CONDITION_PROPS);
    }
}
