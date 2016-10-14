package please.change.me.sample.ss11AB;

import nablarch.common.web.WebUtil;
import nablarch.core.ThreadContext;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

/**
 * ワークフロー承認照会
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AB01Action extends DbAccessSupport {

    /**
     * ワークフロー承認一覧画面の初期表示処理
     * 
     * @param request リクエスト
     * @param context リクエストコンテキスト
     * @return HttpResponse HTTPレスポンス
     */
    public HttpResponse doRW11AB0101(HttpRequest request, ExecutionContext context) {
        
        W11AB01Form form = new W11AB01Form();
        form.setLoginUserId(ThreadContext.getUserId());
        form.setUgroupId((String) context.getSessionScopedVar("user.groupId"));
        context.setRequestScopedVar("applicationUserList", getUserGroupList());
        context.setRequestScopedVar("W11AB01", form);
        
        SqlResultSet resultSet = searchActiveApplication(form);
        if (resultSet.isEmpty()) {
            WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.ERROR, "MSG00036", "承認情報"));
        }
        context.setRequestScopedVar("applicationList", resultSet);
        
        return new HttpResponse("/ss11AB/W11AB0101.jsp");
    }
    
    /**
     * ワークフロー承認一覧画面の検索処理
     * 
     * @param request リクエスト
     * @param context リクエストコンテキスト
     * @return HttpResponse HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "/ss11AB/W11AB0101.jsp")
    public HttpResponse doRW11AB0102(HttpRequest request, ExecutionContext context) {

        W11AB01Form form = W11AB01Form.validate("W11AB01", request, "search");
        form.setLoginUserId(ThreadContext.getUserId());
        form.setUgroupId((String) context.getSessionScopedVar("user.groupId"));
        context.setRequestScopedVar("applicationUserList", getUserGroupList());
        context.setRequestScopedVar("W11AB01", form);
        
        SqlResultSet resultSet = searchActiveApplication(form);
        if (resultSet.isEmpty()) {
            WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.ERROR, "MSG00036", "承認情報"));
        }
        context.setRequestScopedVar("applicationList", resultSet);
        
        return new HttpResponse("/ss11AB/W11AB0101.jsp");
    }

    /**
     * ログインユーザが進行可能な申請の一覧を取得する。
     * @param form 検索条件
     * @return 進行可能な申請の一覧
     */
    private SqlResultSet searchActiveApplication(W11AB01Form form) {
        return new CM211AB1Component().searchActiveApplication(form);
    }
    
    /**
     * ユーザグループに属するユーザの一覧を取得する。
     * @return ユーザ一覧
     */
    private SqlResultSet getUserGroupList() {
        SqlPStatement statement = getSqlPStatement("SELECT_USER_GROUPS");
        return statement.retrieve();
    }

}
