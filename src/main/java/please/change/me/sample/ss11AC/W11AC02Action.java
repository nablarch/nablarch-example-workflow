package please.change.me.sample.ss11AC;

import static please.change.me.sample.ss11.component.LoanApplicationConstant.EXECUTE_TASK_ID;
import static please.change.me.sample.ss11.component.LoanApplicationConstant.JUDGING_TASK_ID;
import static please.change.me.sample.ss11.component.LoanApplicationConstant.SURVEY_TASK_ID;
import static please.change.me.sample.ss11.component.LoanApplicationConstant.UPPER_LEVEL_JUDGING_TASK_ID;

import nablarch.common.exclusivecontrol.OptimisticLockException;
import nablarch.common.web.exclusivecontrol.HttpExclusiveControlUtil;
import nablarch.core.ThreadContext;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpErrorResponse;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import nablarch.fw.web.interceptor.OnErrors;

import please.change.me.sample.exclusive.ExclusiveLoanApplicationContext;
import please.change.me.sample.ss11.component.CM111002Component;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * ローン申請のタスク進行アクション。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class W11AC02Action extends DbAccessSupport {

    /**
     * タスク進行用の画面を初期表示する。
     * <p/>
     * タスクを特定するためのローン申請IDが不正な場合には、
     * 不正な遷移をしたものとしユーザエラーページヘと遷移させる。
     * <p/>
     * データが存在しない場合や、自身がアサインされていない場合には、
     * 画面表示中にデータが変更された可能性があるため、データが変更された旨を示す例外を送出し元画面へ遷移する。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class,
            path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    public HttpResponse doRW11AC0201(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = processInputView(req, ctx);
        ctx.setRequestScopedVar("W11AC02", form);
        return new HttpResponse("/ss11AC/W11AC0201.jsp");
    }

    /**
     * タスク進行用の画面を表示する。
     * <p/>
     * 本処理は、精査エラー時にタスク進行用画面を再描画する際に、
     * 内部フォーワードで呼び出すメソッドである。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class,
            path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    public HttpResponse doRW11AC02Z1(HttpRequest req, ExecutionContext ctx) {
        processInputView(req, ctx);
        return new HttpResponse("/ss11AC/W11AC0201.jsp");
    }

    /**
     * タスク進行画面表示処理の共通処理を行う。
     *
     * @param req リクエスト
     * @param ctx 実行コンテキスト
     * @return フォーム
     */
    private W11AC02Form processInputView(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form;
        try {
            form = W11AC02Form.validate("W11AC02", req, "show");
        } catch (ApplicationException e) {
            throw new HttpErrorResponse(400, "/USER_ERROR.jsp", e);
        }

        HttpExclusiveControlUtil.prepareVersion(ctx,
                new ExclusiveLoanApplicationContext(form.getLoanAppliId()));

        CM111002Component component = new CM111002Component();
        SqlRow loanApplication = component.findLoanApplication(form.getLoanAppliId());
        if (loanApplication == null) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00034"));
        }

        WorkflowInstance workflow = WorkflowManager.findInstance(loanApplication.getString("wfInstanceId"));
        if (!hasActiveUserOrGroupTask(workflow, ctx)) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00034"));
        }

        form.setSurveyContent(loanApplication.getString("SURVEY_CONTENT"));

        ctx.setRequestScopedVar("loanApplication", loanApplication);
        ctx.setRequestScopedVar("history", findLoanApplicationHistory(form.getLoanAppliId()));
        ctx.setRequestScopedVar("surveyTask", workflow.isActive(SURVEY_TASK_ID));
        ctx.setRequestScopedVar("judgingTask", workflow.isActive(JUDGING_TASK_ID));
        ctx.setRequestScopedVar("upperLevelJudgingTask", workflow.isActive(UPPER_LEVEL_JUDGING_TASK_ID));
        ctx.setRequestScopedVar("executeTask", workflow.isActive(EXECUTE_TASK_ID));
        return form;
    }

    /**
     * 現在のワークフローインスタンスの状態がログインユーザで利用可能か判定する。
     *
     * アクティブタスクが判定または上位判定の場合には、
     * セッションから取得したグループIDを元に利用可能か判断する。
     * それ以外の場合には、ログインユーザIDを元に判断する。
     *
     * @param workflow ワークフローインスタンス
     * @param context 実行コンテキスト
     * @return 利用可能な場合はtrue
     */
    private static boolean hasActiveUserOrGroupTask(WorkflowInstance workflow, ExecutionContext context) {
        if (workflow.isActive(JUDGING_TASK_ID) || workflow.isActive(UPPER_LEVEL_JUDGING_TASK_ID)) {
            if (!workflow.hasActiveGroupTask((String) context.getSessionScopedVar("user.groupId"))) {
                return false;
            }
        } else {
            if (!workflow.hasActiveUserTask(ThreadContext.getUserId())) {
                return false;
            }
        }
        return true;
    }

    /**
     * 調査から判定への処理の流れを行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0202(HttpRequest req, ExecutionContext ctx) {

        HttpExclusiveControlUtil.updateVersionsWithCheck(req);
        W11AC02Form form = W11AC02Form.validate("W11AC02", req, "survey");

        CM111002Component component = new CM111002Component();
        component.executeSurvey(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity());

        ctx.setRequestScopedVar("surveyTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 調査からの却下処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0101")
    })
    public HttpResponse doRW11AC0203(HttpRequest req, ExecutionContext ctx) {
        HttpExclusiveControlUtil.updateVersionsWithCheck(req);
        W11AC02Form form = W11AC02Form.validate("W11AC02", req, "survey");

        CM111002Component component = new CM111002Component();
        component.rejectLoanApplicationBySurvey(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity());

        ctx.setRequestScopedVar("surveyTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 判定処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0204(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.judgeLoanApplication(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity(),
                (String) ctx.getSessionScopedVar("user.groupId"));

        ctx.setRequestScopedVar("judgingTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 判定タスクからの差し戻し処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0205(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.returnLoanApplication(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity(),
                (String) ctx.getSessionScopedVar("user.groupId"));

        ctx.setRequestScopedVar("judgingTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 判定タスクからの却下処理を行う。
     * <p/>
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0206(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.rejectLoanApplicationByJudge(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity(),
                (String) ctx.getSessionScopedVar("user.groupId"));

        ctx.setRequestScopedVar("judgingTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 上位判定処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0207(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.upperLevelJudgeLoanApplication(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity(),
                (String) ctx.getSessionScopedVar("user.groupId"));

        ctx.setRequestScopedVar("upperLevelJudgingTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 上位判定からの却下処理をおおなう。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0208(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.rejectLoanApplicationByUpperLevelJudge(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity(),
                (String) ctx.getSessionScopedVar("user.groupId"));

        ctx.setRequestScopedVar("upperLevelJudgingTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 実行処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
            @OnError(type = ApplicationException.class,
                    path = "forward:///action/ss11AC/W11AC02Action/RW11AC02Z1"),
            @OnError(type = OptimisticLockException.class,
                    path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    })
    public HttpResponse doRW11AC0209(HttpRequest req, ExecutionContext ctx) {
        W11AC02Form form = validateCommentAndCreateForm(req);

        CM111002Component component = new CM111002Component();
        component.executeLoan(
                form.getLoanApplicationEntity(),
                form.getLoanApplicationHistoryEntity());

        ctx.setRequestScopedVar("executeTask", true);
        return new HttpResponse("/ss11AC/W11AC0202.jsp");
    }

    /**
     * 排他制御（バージョンアップ）コメント欄の精査とフォームの生成を行う。
     *
     * @param req リクエスト
     * @return 生成したフォーム
     */
    private static W11AC02Form validateCommentAndCreateForm(HttpRequest req) {
        HttpExclusiveControlUtil.updateVersionsWithCheck(req);
        return W11AC02Form.validate("W11AC02", req, "comment");
    }

    /**
     * ローン申請IDに紐づくローン申請履歴を取得する。
     *
     * @param loanApplicationId ローン申請ID
     * @return ローン申請データ
     */
    private SqlResultSet findLoanApplicationHistory(String loanApplicationId) {
        SqlPStatement statement = getSqlPStatement("SELECT_LOAN_APPLICATION_HISTORY");
        statement.setString(1, loanApplicationId);
        return statement.retrieve();
    }
}


