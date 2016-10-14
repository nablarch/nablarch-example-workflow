package please.change.me.sample.ss11AD;

import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.*;
import nablarch.common.exclusivecontrol.OptimisticLockException;
import nablarch.common.web.exclusivecontrol.HttpExclusiveControlUtil;
import nablarch.core.ThreadContext;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import nablarch.fw.web.interceptor.OnErrors;
import please.change.me.sample.exclusive.ExclusiveCtrlTransExpeApplicationContext;
import please.change.me.sample.ss11.component.CM111001Component;
import please.change.me.sample.ss11.component.CM111003Component;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * 交通費申請承認のアクションクラス。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD02Action extends DbAccessSupport {

    /**
     * 交通費申請承認画面を表示する。<br/>
     * （交通費承認一覧画面からの遷移）
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102")
    public HttpResponse doRW11AD0201(HttpRequest request, ExecutionContext context) {
       
        // ワークアイテムのキーを取得
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "initial");
        String applicationId = form.getApplicationId();
        
        // 排他制御開始
        HttpExclusiveControlUtil.prepareVersion(context,
                new ExclusiveCtrlTransExpeApplicationContext(applicationId));
        
        // ワークアイテム取得
        SqlRow applicationInfo = getApplication(applicationId);
        WorkflowInstance workflow = WorkflowManager.findInstance(applicationInfo.getString("WF_INSTANCE_ID"));
        
        // アクティブタスク割当精査
        if (!workflow.hasActiveUserTask(ThreadContext.getUserId())) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00034"));
        }
        
        // 表示データ設定
        setupHistoryList(context, applicationId);
        if (workflow.isActive(REAPPLICATION_TASK)) {
            setupAssignUserList(context);
            applicationInfo.put("returnUri", "/action/ss11AB/W11AB01Action/RW11AB0102");
            context.setRequestScopedVar("W11AD02", applicationInfo);
            return new HttpResponse("/ss11AD/W11AD0203.jsp");
        } else {
            context.setRequestScopedVar("detail", applicationInfo);
            context.setRequestScopedVar("confirmTask", workflow.isActive(CONFIRMATION_TASK));
            context.setRequestScopedVar("authorizeTask", workflow.isActive(AUTHORIZATION_TASK));
            return new HttpResponse("/ss11AD/W11AD0201.jsp");
        }
    }
    
    /**
     * 交通費申請の確認タスクを承認タスクへ進行させる。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0202(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "confirm");
        
        CM111001Component component = new CM111001Component();
        component.executeConfirmation(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00091");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }
    
    /**
     * 交通費申請の確認タスクを却下する。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0203(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "confirm");
        
        CM111001Component component = new CM111001Component();
        component.rejectConfirmation(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00093");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }
    

    /**
     * 交通費申請の確認タスクを差し戻す。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0204(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "confirm");
        
        CM111001Component component = new CM111001Component();
        component.returnConfirmation(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00094");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }

    /**
     * 交通費申請の承認タスクを完了する。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0205(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "authorize");
        
        CM111001Component component = new CM111001Component();
        component.executeAuthorization(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00092");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }
    
    /**
     * 交通費申請の承認タスクを却下する。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0206(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "authorize");

        CM111001Component component = new CM111001Component();
        component.rejectAuthorization(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00092");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }
    
    /**
     * 交通費申請の承認タスクを差し戻す。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0207(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "authorize");

        CM111001Component component = new CM111001Component();
        component.returnAuthorization(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00094");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }

    /**
     * 交通費申請の再申請タスクを完了する。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AB/W11AB01Action/RW11AB0102"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD02Action/RW11AD0210")
    })
    public HttpResponse doRW11AD0208(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "reapplication");

        CM111001Component component = new CM111001Component();
        component.executeReapplication(form.getApplicationEntity(), form.getHistoryEntity(),
                form.getConfirmUserId(), form.getAuthorizeUserId());
        
        context.setRequestScopedVar("completedMessage", "MSG00095");
        
        return new HttpResponse("/ss11AD/W11AD0202.jsp");
    }
    
    /**
     * 交通費申請の確認タスクを引戻す。
     * 
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnErrors({
        @OnError(type = OptimisticLockException.class,
                 path = "forward:///action/ss11AD/W11AD03Action/RW11AD0303"),
        @OnError(type = ApplicationException.class,
                 path = "forward:///action/ss11AD/W11AD03Action/RW11AD0303")
    })
    public HttpResponse doRW11AD0209(HttpRequest request, ExecutionContext context) {
        
        // 排他制御
        HttpExclusiveControlUtil.updateVersionsWithCheck(request);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "cancel");

        CM111001Component component = new CM111001Component();
        component.cancelConfirmation(form.getApplicationEntity(), form.getHistoryEntity());
        
        context.setRequestScopedVar("completedMessage", "MSG00095");
        
        return new HttpResponse("forward:///action/ss11AD/W11AD02Action/RW11AD0211");
    }
    
    /**
     * 交通費申請承認処理で精査エラーが発生した際の処理を行う。
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AD0210(HttpRequest request, ExecutionContext context) {
        
        // バージョン番号の設定
        HttpExclusiveControlUtil.checkVersions(request, context);
        
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "getKey");
        String applicationId = form.getApplicationId();
        SqlRow application = getApplication(applicationId);
        
        // 表示データを設定
        setupHistoryList(context, applicationId);
        WorkflowInstance workflow = WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID"));
        if (workflow.isActive(REAPPLICATION_TASK)) {
            // 再アサインを行うのでユーザリストを設定。
            // また、入力値の上書きを防ぐため、DBの申請情報は設定しない。
            setupAssignUserList(context);
            return new HttpResponse("/ss11AD/W11AD0203.jsp");
        } else {
            application.put("historyComment", form.getHistoryComment());
            context.setRequestScopedVar("W11AD02", application);
            context.setRequestScopedVar("confirmTask", workflow.isActive(CONFIRMATION_TASK));
            context.setRequestScopedVar("authorizeTask", workflow.isActive(AUTHORIZATION_TASK));
            return new HttpResponse("/ss11AD/W11AD0201.jsp");
        }
    }
    
    /**
     * 交通費申請承認画面を表示する。<br/>
     * （交通費申請詳細画面からの遷移）
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward:///action/ss11AD/W11AD03Action/RW11AD0303")
    public HttpResponse doRW11AD0211(HttpRequest request, ExecutionContext context) {
       
        // ワークアイテムのキーを取得
        W11AD02Form form = W11AD02Form.validate("W11AD02", request, "initial");
        String applicationId = form.getApplicationId();
        
        // 排他制御開始
        HttpExclusiveControlUtil.prepareVersion(context,
                new ExclusiveCtrlTransExpeApplicationContext(applicationId));
        
        // ワークアイテム取得
        SqlRow applicationInfo = getApplication(applicationId);
        WorkflowInstance workflow = WorkflowManager.findInstance(applicationInfo.getString("WF_INSTANCE_ID"));
        
        // アクティブタスク割当精査
        if (!workflow.hasActiveUserTask(ThreadContext.getUserId())) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00034"));
        }
        
        // 表示データ設定
        applicationInfo.put("returnUri", "/action/ss11AD/W11AD03Action/RW11AD0303");
        context.setRequestScopedVar("W11AD02", applicationInfo);
        setupHistoryList(context, applicationId);
        setupAssignUserList(context);
        
        return new HttpResponse("/ss11AD/W11AD0203.jsp");
    }


    /**
     * 指定した申請IDに紐付く履歴情報を設定する。
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @param applicationId 交通費申請ID
     */
    private void setupHistoryList(ExecutionContext context, String applicationId) {
        CM211AD1Component historyComp = new CM211AD1Component();
        context.setRequestScopedVar("historyList", historyComp.getHistory(applicationId));
    }
    
    /**
     * 交通費申請情報を取得する。
     * @param applicationId 交通費申請ID
     * @return 交通費申請IDに紐付く申請情報
     */
    private SqlRow getApplication(String applicationId) {
        CM111001Component component = new CM111001Component();
        SqlRow application = component.getApplication(applicationId);
        if (application == null) {
            throw new ApplicationException(
                    MessageUtil.createMessage(MessageLevel.ERROR, "MSG00096"));
        }
        return application;
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
