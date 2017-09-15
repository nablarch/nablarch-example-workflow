package please.change.me.action;

import java.time.LocalDateTime;

import please.change.me.domain.User;
import please.change.me.entity.LoanApplication;
import please.change.me.form.loan.LoanForm;
import please.change.me.service.LoanService;

import nablarch.common.web.interceptor.InjectForm;
import nablarch.common.web.session.SessionUtil;
import nablarch.core.beans.BeanUtil;
import nablarch.core.message.ApplicationException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

/**
 * ローン申請に関連するアクション。
 *
 * @author nabchan
 */
public class LoanApplicationAction {

    /**
     * ローン申請画面を表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse newLoan(final HttpRequest request, final ExecutionContext context) {
        SessionUtil.delete(context, "loan");
        return new HttpResponse("/WEB-INF/loan/new.jsp");
    }

    /**
     * ローン申請の確認画面を表示する処理を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(prefix = "form", form = LoanForm.class)
    @OnError(type = ApplicationException.class, path = "/WEB-INF/loan/new.jsp")
    public HttpResponse confirmLoan(final HttpRequest request, final ExecutionContext context) {
        final LoanForm form = context.getRequestScopedVar("form");
        final LoanApplication entity = BeanUtil.createAndCopy(LoanApplication.class, form);

        SessionUtil.put(context, "loan", entity, "hidden");
        return new HttpResponse("/WEB-INF/loan/new_confirm.jsp");
    }
    
    /**
     * ローン申請の修正処理へ。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse editNewLoan(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication entity = SessionUtil.get(context, "loan");
        context.setRequestScopedVar("form", entity);
        return new HttpResponse("/WEB-INF/loan/new.jsp");
    }
    
    /**
     * ローン申請を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse createLoan(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication entity = SessionUtil.get(context, "loan");
        SessionUtil.delete(context, "loan");
        
        final User user = SessionUtil.get(context, "user");
        entity.setInsertUserId(user.getUserId());
        entity.setInsertDateTime(LocalDateTime.now());

        final LoanService service = new LoanService();
        service.applyLoan(entity);
        return new HttpResponse(303, "redirect:///action/loan/new/complete");
    }
    
    /**
     * ローン申請を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse completeLoan(final HttpRequest request, final ExecutionContext context) {
        context.setRequestScopedVar("message", "ローン申請処理を行いました。");
        return new HttpResponse("/WEB-INF/approval/index.jsp");
    }
    
}
