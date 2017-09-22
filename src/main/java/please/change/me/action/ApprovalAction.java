package please.change.me.action;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import please.change.me.domain.LoanApproval;
import please.change.me.domain.User;
import please.change.me.domain.code.BusinessType;
import please.change.me.entity.LoanApplication;
import please.change.me.form.approval.ApprovalResultForm;
import please.change.me.form.approval.CommentForm;
import please.change.me.form.approval.SurveyForm;
import please.change.me.form.loan.LoanHistoryDto;
import please.change.me.service.ApprovalService;
import please.change.me.service.NotApprovalDataException;

import nablarch.common.dao.UniversalDao;
import nablarch.common.web.interceptor.InjectForm;
import nablarch.common.web.session.SessionUtil;
import nablarch.core.message.ApplicationException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpErrorResponse;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

/**
 * 承認に関するアクション。
 *
 * @author nabchan
 */
public class ApprovalAction {

    /** サービス */
    private final ApprovalService service;

    /** コンストラクタ */
    public ApprovalAction() {
        this(new ApprovalService());
    }

    /**
     * コンストラクタ
     *
     * @param service 承認サービス
     */
    public ApprovalAction(final ApprovalService service) {
        this.service = service;
    }

    /**
     * 承認対象の一覧を取得する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse list(final HttpRequest request, final ExecutionContext context) {
        SessionUtil.delete(context, "loan");

        final User user = SessionUtil.get(context, "user");

        final List<ApprovalResultForm> result =
                service.searchApproval(user.getUserId(), user.getUgourpId())
                       .stream()
                       .map(approval ->
                               new ApprovalResultForm(
                                       approval.getApplicationId(),
                                       approval.getBusinessType(),
                                       approval.getApplicationDate(),
                                       approval.getApplicationUserName(),
                                       approval.getStatusCd()
                               ))
                       .collect(Collectors.toList());

        context.setRequestScopedVar("approvals", result);
        context.setRequestScopedVar("businessTypes", BusinessType.values());

        return new HttpResponse("/WEB-INF/approval/index.jsp");
    }

    /**
     * 自動審査を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse auto(final HttpRequest request, final ExecutionContext context) {
        final User user = SessionUtil.get(context, "user");
        service.executeAutoScreening(user);
        return new HttpResponse(303, "redirect:///action/approval");
    }

    /**
     * タスクを進める為の詳細ページを表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse show(final HttpRequest request, final ExecutionContext context) {
        final String id = Arrays.stream(request.getParam("id"))
                                .findFirst()
                                .orElseThrow(() -> new HttpErrorResponse(404));

        final User user = SessionUtil.get(context, "user");

        try {
            final LoanApproval loanApproval = service.findLoanApplication(id, user);
            context.setRequestScopedVar("loanApproval", loanApproval);
            SessionUtil.put(context, "loan", loanApproval.getLoanApplication(), "hidden");
        } catch (NotApprovalDataException e) {
            throw new HttpErrorResponse(409, "/WEB-INF/error/RETRY.jsp", e);
        }
        context.setRequestScopedVar("history",
                UniversalDao.findAllBySqlFile(LoanHistoryDto.class, "FIND_BY_LOAN_ID", new Object[] {id}));
        return new HttpResponse("/WEB-INF/approval/show.jsp");
    }

    /**
     * 調査を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = SurveyForm.class, prefix = "form")
    public HttpResponse survey(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final SurveyForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeSurvey(loan, user, form.getSurveyComment(), form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }

    /**
     * 却下を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = SurveyForm.class, prefix = "form")
    public HttpResponse reject(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final SurveyForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeReject(loan, user, form.getSurveyComment(), form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }

    /**
     * 判定を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse judge(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeJudge(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }
    
    /**
     * 判定からの却下を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse rejectFromJudge(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeRejectFromJudge(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }
    
    /**
     * 差し戻しを実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse back(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeBack(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }
    
    /**
     * 上位者判定を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse upperLevelJudge(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeUpperLevelJudge(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }
    
    /**
     * 上位者判定からの却下を実行する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse rejectFromUpperLevelJudge(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeRejectFromUpperLevelJudge(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }

    /**
     * ローンの実行を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://error")
    @InjectForm(form = CommentForm.class, prefix = "form")
    public HttpResponse executeLoan(final HttpRequest request, final ExecutionContext context) {
        final LoanApplication loan = getLoanApplicationFromSession(context, request);
        final CommentForm form = context.getRequestScopedVar("form");
        final User user = SessionUtil.get(context, "user");
        service.executeLoan(loan, user, form.getComment());
        return new HttpResponse(303, "redirect:///action/approval/complete");
    }
    

    /**
     * タスクの完了処理を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse completeTask(final HttpRequest request, final ExecutionContext context) {
        context.setRequestScopedVar("message", "ローン申請の承認処理を行いました。");
        return new HttpResponse("forward:///action/approval");
    }

    /**
     * セッションからローン申請を取得する。
     * <p>
     * もし、リクエストのローン申請IDとセッション上のローン申請が一致していない場合は、クライアントエラー(ステータスコードが400の{@link HttpErrorResponse})を送出する。
     * リクエスト上にローン申請IDが存在しない場合は、not found(ステータスコードが404の{@link HttpErrorResponse})を送出する。
     *
     * @param context コンテキスト
     * @param request リクエスト
     * @return ローン申請
     */
    private static LoanApplication getLoanApplicationFromSession(
            final ExecutionContext context, final HttpRequest request) {
        
        final String id = Arrays.stream(request.getParam("id"))
                                .findFirst()
                                .orElseThrow(() -> new HttpErrorResponse(404));
        
        final LoanApplication loan = SessionUtil.get(context, "loan");
        SessionUtil.delete(context, "loan");
        if (!loan.getLoanAppliId()
                 .toString()
                 .equals(id)) {
            // セッションの申請IDとパスパラメータが異なる場合は不正遷移
            throw new HttpErrorResponse(400);
        }
        return loan;
    }
}
