package please.change.me.handler;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import nablarch.common.web.session.SessionUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpRequestHandler;
import nablarch.fw.web.HttpResponse;

/**
 * 認証されていないリクエストを強制的にログイン画面に遷移させるハンドラ。
 *
 * @author nabchan
 */
public class AuthHandler implements HttpRequestHandler {

    /** チェック対象外のパス */
    private static final Set<String> IGNORE_PATH = new HashSet<>(Arrays.asList("/", "/action/auth", "/action/auth/signout"));

    @Override
    public HttpResponse handle(final HttpRequest request, final ExecutionContext context) {
        final String path = request.getRequestPath();
        if (IGNORE_PATH.contains(path)) {
            return context.handleNext(request);
        }

        if (SessionUtil.orNull(context, "user") == null) {
            return new HttpResponse("redirect:///");
        } else {
            return context.handleNext(request);
        }
    }
}
