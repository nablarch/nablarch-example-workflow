package please.change.me.sample.ss11AA;

import nablarch.core.date.BusinessDateUtil;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

/**
 * ログイン画面のアクションクラス。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AA01Action extends DbAccessSupport {

    /**
     * ログイン画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AA0101(HttpRequest request,
            ExecutionContext context) {
        // ログアウト処理と共用しているため、セッション初期化
        context.invalidateSession();
        context.setRequestScopedVar("userList", getUserList());
        return new HttpResponse("/ss11AA/W11AA0101.jsp");
    }

    /**
     * ログイン画面の「ログイン」イベントの処理を行う
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class,
            path = "/ss11AA/W11AA0101.jsp") // セッションの破棄は行わないため、ログイン画面初期表示のリクエストにはフォワードしない。
    public HttpResponse doRW11AA0102(HttpRequest request,
            ExecutionContext context) {

        W11AA01Form form = W11AA01Form.validate(request, "login");

        SqlResultSet result = selectSystemAccount(form.getUserId());
        SqlRow user = result.get(0);
        String userId = user.getString("USER_ID");

        // ヘッダに表示する情報を設定した後、メニュー画面に遷移する。
        context.invalidateSession();
        context.setSessionScopedVar("user.id", userId);
        context.setSessionScopedVar("commonHeaderLoginUserName",
                user.getString("KANJI_NAME"));
        context.setSessionScopedVar("commonHeaderLoginDate", BusinessDateUtil.getDate());
        context.setSessionScopedVar("user.groupId", user.getString("UGROUP_ID"));
        return new HttpResponse("redirect:///action/ss11AB/W11AB01Action/RW11AB0101");
    }
    
    /**
     * ユーザの検索を実行する。<br>
     *
     * @param userId 検索条件
     * @return 検索結果。
     */
    private SqlResultSet selectSystemAccount(String userId) {
        SqlPStatement statement = getSqlPStatement("SELECT_USER_INFO");
        statement.setString(1, userId);
        return statement.retrieve();
    }
    
    /**
     * ユーザの一覧を取得する。
     * @return ユーザ一覧
     */
    private SqlResultSet getUserList() {
        SqlPStatement statement = getSqlPStatement("SELECT_USERS");
        return statement.retrieve();
    }
}
