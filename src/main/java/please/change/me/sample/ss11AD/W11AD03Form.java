package please.change.me.sample.ss11AD;

import java.util.Map;

import nablarch.core.validation.PropertyName;
import nablarch.core.validation.ValidateFor;
import nablarch.core.validation.ValidationContext;
import nablarch.core.validation.ValidationUtil;
import nablarch.core.validation.validator.Length;
import nablarch.core.validation.validator.Required;
import nablarch.core.validation.validator.unicode.SystemChar;
import nablarch.fw.web.HttpRequest;

/**
 * 申請一覧照会で使用するForm
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD03Form extends W11AD03FormBase {

    /** デフォルトシリアルバージョンID */
    private static final long serialVersionUID = 1L;
    
    /** ログインユーザID */
    private String loginUserId;
    
    /** 交通費申請ID */
    private String applicationId;

    /**
     * デフォルトコンストラクタ
     */
    public W11AD03Form() {
        // nothing.
    }
    
    /**
     * Mapを引数にとるコンストラクタ。
     *
     * @param params 項目名をキーとし、項目値を値とするMap
     */
    public W11AD03Form(Map<String, Object> params) {
        super(params);
        loginUserId = (String) params.get("loginUserId");
        applicationId = (String) params.get("applicationId");
    }
    
    
    /** 検索条件 */
    private static final String[] SEARCH_CONDITION_PROPS = new String[] {"statusCd", "deviceCd", "pageNumber"};
    
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
     * 交通費申請IDを取得する。
     *
     * @return 交通費申請ID。
     */
    public String getApplicationId() {
        return this.applicationId;
    }

    /**
     * 交通費申請IDを設定する。
     *
     * @param applicationId 設定する交通費申請ID。
     *
     */
    @PropertyName("交通費申請ID")
    @Required
    @SystemChar(charsetDef = "NumberChar")
    @Length(min = 10, max = 10)
    public void setApplicationId(String applicationId) {
        this.applicationId = applicationId;
    }
    
    /**
     * バリデーションを実施する。
     *
     * @param prefix プレフィックス
     * @param req 入力パラメータ情報
     * @param validationName 使用するバリデーションの名前
     * @return 入力パラメータを精査後に生成した本フォーム
     */
    public static W11AD03Form validate(String prefix, HttpRequest req, String validationName) {
        ValidationContext<W11AD03Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AD03Form.class, req, validationName);
            context.abortIfInvalid();
            return context.createObject();
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
    public static W11AD03Form validateForListSearch(String prefix, HttpRequest req, String validationName) {
        ValidationContext<W11AD03Form> context =
                ValidationUtil.validateAndConvertRequest(prefix, W11AD03Form.class, req, validationName);
        if (context.isInvalid("pageNumber")) {
            return new W11AD03Form();
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
    public static void validateForSearch(ValidationContext<W11AD03Form> context) {
        ValidationUtil.validate(context, SEARCH_CONDITION_PROPS);
    }
    

    /**
     * 詳細画面遷移時の精査
     * @param context validationContext
     */
    @ValidateFor("detail")
    public static void validateForDetail(ValidationContext<W11AD03Form> context) {
        ValidationUtil.validate(context, new String[] {"applicationId"});
    }
}
