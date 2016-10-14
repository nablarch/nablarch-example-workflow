package please.change.me.sample.ss11AD;

import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.CONFIRMATION_TASK;
import static please.change.me.sample.ss11.component.TransExpenseApplicationConstant.REAPPLICATION_TASK;
import nablarch.common.web.WebUtil;
import nablarch.common.web.exclusivecontrol.HttpExclusiveControlUtil;
import nablarch.core.ThreadContext;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import please.change.me.sample.exclusive.ExclusiveCtrlTransExpeApplicationContext;
import please.change.me.sample.ss11.component.CM111001Component;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * 交通費申請一覧のアクションクラス。
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD03Action extends DbAccessSupport {
    
    /**
     * 交通費申請一覧画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AD0301(HttpRequest request, ExecutionContext context) {
        W11AD03Form form = new W11AD03Form();
        context.setRequestScopedVar("W11AD03", form);
        
        SqlResultSet resultSet = search(form);
        if (resultSet.isEmpty()) {
            WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.ERROR, "MSG00036", "交通費申請情報"));
        }
        context.setRequestScopedVar("applicationList", resultSet);
        return new HttpResponse("/ss11AD/W11AD0301.jsp");
    }
    
    /**
     * 交通費申請一覧を検索する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "/ss11AD/W11AD0301.jsp")
    public HttpResponse doRW11AD0302(HttpRequest request, ExecutionContext context) {
        W11AD03Form form = W11AD03Form.validateForListSearch("W11AD03", request, "search");
        context.setRequestScopedVar("W11AD03", form);
        
        SqlResultSet resultSet = search(form);
        if (resultSet.isEmpty()) {
            WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.ERROR, "MSG00036", "交通費申請情報"));
        }
        context.setRequestScopedVar("applicationList", resultSet);
        
        return new HttpResponse("/ss11AD/W11AD0301.jsp");
    }
    
    /**
     * 交通費申請詳細を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward:///action/ss11AD/W11AD03Action/RW11AD0302")
    public HttpResponse doRW11AD0303(HttpRequest request, ExecutionContext context) {
        W11AD03Form form = W11AD03Form.validate("W11AD03", request, "detail");
        String applicationId = form.getApplicationId();
        
        // 引戻せる場合があるため、排他制御開始
        HttpExclusiveControlUtil.prepareVersion(context,
                new ExclusiveCtrlTransExpeApplicationContext(applicationId));
        
        SqlRow application = getApplication(applicationId);
        context.setRequestScopedVar("detail", application);
        CM211AD1Component historyComp = new CM211AD1Component();
        context.setRequestScopedVar("historyList", historyComp.getHistory(applicationId));
        
        WorkflowInstance workflow = WorkflowManager.findInstance(application.getString("WF_INSTANCE_ID"));
        context.setRequestScopedVar("confirmTask", workflow.isActive(CONFIRMATION_TASK));
        context.setRequestScopedVar("reapplicationTask", workflow.isActive(REAPPLICATION_TASK));
        
        return new HttpResponse("/ss11AD/W11AD0302.jsp");
    }

    /**
     * 交通費申請一覧を検索する。<br/>
     * 検索時に、ログインユーザのユーザIDを検索条件に追加する。
     * @param form 検索条件
     * @return 交通費申請一覧の検索結果
     */
    private SqlResultSet search(W11AD03Form form) {
        CM211AD2Component component = new CM211AD2Component();
        form.setLoginUserId(ThreadContext.getUserId());
        return component.selectApplicationByCondition(form);
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
}
