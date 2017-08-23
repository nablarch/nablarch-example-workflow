package please.change.me.action;

import please.change.me.domain.User;
import please.change.me.entity.Users;
import please.change.me.form.auth.AuthForm;
import please.change.me.service.AuthService;
import please.change.me.service.UserNotFoundException;

import nablarch.common.dao.UniversalDao;
import nablarch.common.web.interceptor.InjectForm;
import nablarch.common.web.session.SessionUtil;
import nablarch.core.message.ApplicationException;
import nablarch.core.validation.ValidationUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

/**
 * 認証アクション。
 *
 * @author nabchan
 */
public class AuthAction {

    /**
     * 認証サービス
     */
    private final AuthService service;

    /**
     * コンストラクタ
     */
    public AuthAction() {
        this(new AuthService());
    }

    /**
     * コンストラクタ
     * @param service 認証サービス
     */
    public AuthAction(final AuthService service) {
        this.service = service;
    }


    /**
     * ログイン画面を表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse index(final HttpRequest request, final ExecutionContext context) {
        context.invalidateSession();
        context.setRequestScopedVar("userList", UniversalDao.findAll(Users.class));
        return new HttpResponse("/WEB-INF/auth/login.jsp");
    }

    /**
     * ログイン画面を表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(form = AuthForm.class)
    @OnError(path = "forward:///", type = ApplicationException.class)
    public HttpResponse login(final HttpRequest request, final ExecutionContext context) {
        context.invalidateSession();

        final User user;
        try {
            final AuthForm form = context.getRequestScopedVar("form");
            user = service.auth(form.getUserId());
        } catch (UserNotFoundException ignored) {
            throw new ApplicationException(ValidationUtil.createMessageForProperty("userId", "user.not-found"));
        }
        context.setRequestScopedVar("user", UniversalDao.findAll(Users.class));
        SessionUtil.put(context, "user", user, "httpSession");
        return new HttpResponse("redirect:///action/approval");
    }
}
