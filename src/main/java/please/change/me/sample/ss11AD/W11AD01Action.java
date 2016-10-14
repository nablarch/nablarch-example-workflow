package please.change.me.sample.ss11AD;

import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.AUTHORIZATION_GROUP;
import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.CONFIRMATION_GROUP;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import please.change.me.sample.ss11.component.CM111001Component;
import please.change.me.sample.ss11.component.CM111003Component;

/**
 * 交通費申請登録画面のアクションクラス。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD01Action extends DbAccessSupport {

    /**
     * 交通費申請登録画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AD0101(HttpRequest request, ExecutionContext context) {
        setupAssignUserList(context);
        return new HttpResponse("/ss11AD/W11AD0101.jsp");
    }
    
    /**
     * 交通費申請登録確認画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward:///action/ss11AD/W11AD01Action/RW11AD0101")
    public HttpResponse doRW11AD0102(HttpRequest request, ExecutionContext context) {
        W11AD01Form.validate("W11AD01", request, "confirm");
        setupAssignUserList(context);
        return new HttpResponse("/ss11AD/W11AD0102.jsp");
    }
    
    /**
     * 交通費申請登録完了画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward:///action/ss11AD/W11AD01Action/RW11AD0101")
    public HttpResponse doRW11AD0103(HttpRequest request, ExecutionContext context) {
        W11AD01Form form = W11AD01Form.validate("W11AD01", request, "confirm");
        
        CM111001Component component = new CM111001Component();
        component.applyTransExpense(form.getApplicationEntity(),
                form.getConfirmUserId(), form.getAuthorizeUserId());
        
        return new HttpResponse("/ss11AD/W11AD0103.jsp");
    }
    
    /**
     * 交通費申請登録画面に戻る。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AD0104(HttpRequest request, ExecutionContext context) {
        setupAssignUserList(context);
        return new HttpResponse("/ss11AD/W11AD0101.jsp");
    }

    /**
     * アサイン対象ユーザのリストを設定する。
     * 
     * @param context 実行時コンテキスト
     */
    private void setupAssignUserList(ExecutionContext context) {
        CM111003Component userCompo = new CM111003Component();
        context.setRequestScopedVar("confirmUserList",
                userCompo.getUserList(CONFIRMATION_GROUP));
        context.setRequestScopedVar("authorizeUserList",
                userCompo.getUserList(AUTHORIZATION_GROUP));
    }
}
