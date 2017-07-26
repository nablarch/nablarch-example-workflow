package please.change.me.sample.statemachine;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import please.change.me.sample.statemachine.entity.CardApplication;

import nablarch.common.web.WebUtil;
import nablarch.common.web.interceptor.InjectForm;
import nablarch.core.beans.BeanUtil;
import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.core.util.StringUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;

/**
 * カード申し込みアクション
 *
 * @author siosio
 */
public class CardAction extends DbAccessSupport {

    /**
     * カード申し込み画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doListCard(final HttpRequest request, final ExecutionContext context) {

        final List<CardApplicationForm> list =
                getSqlPStatement("list_card_application")
                        .retrieve()
                        .stream()
                        .map(row ->
                                new CardApplicationForm(
                                        row.getLong("id"),
                                        row.getString("name"),
                                        row.getLong("annualIncome"),
                                        CardApplicationStatus.valueOf(row.getString("status"))
                                ))
                        .collect(Collectors.toList());

        context.setRequestScopedVar("list", list);
        return new HttpResponse("/statemachine/list.jsp");
    }


    /**
     * カード申し込み画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doNewCard(final HttpRequest request, final ExecutionContext context) {
        return new HttpResponse("/statemachine/new_card.jsp");
    }

    /**
     * カード申し込み確認画面を表示する。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @InjectForm(form = NewCardForm.class, validate = "validate", prefix = "card")
    @OnError(path = "/statemachine/new_card.jsp", type = ApplicationException.class)
    public HttpResponse doSaveNewCard(final HttpRequest request, final ExecutionContext context) {
        final NewCardForm form = context.getRequestScopedVar("form");

        final CardApplication entity = BeanUtil.createAndCopy(CardApplication.class, form);

        // --------------------------- start statemachine
        final WorkflowInstance instance = WorkflowManager.startInstance("new-card");
        entity.setInstanceId(instance.getInstanceId());
        entity.setStatus(CardApplicationStatus.NEW.name());

        // --------------------------- save application data
        getParameterizedSqlStatement("insert_card_application")
                .executeUpdateByObject(entity);

        return new HttpResponse("redirect://listCard");
    }

    /**
     * 自動審査処理を行う。
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://listCard")
    public HttpResponse doAutoSinsa(final HttpRequest request, final ExecutionContext context) {
        final SqlRow row = findCardApplication(request.getParam("id"));
        final String instanceId = row.getString("WF_INSTANCE_ID");
        final Long annualIncome = row.getLong("ANNUAL_INCOME");

        final WorkflowInstance workflowInstance = WorkflowManager.findInstance(instanceId);
        if (!workflowInstance.isActive("new")) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00100"));
        }

        workflowInstance.triggerEvent("sinsa", Collections.singletonMap("annualIncome", annualIncome));

        final CardApplicationStatus status;
        if (workflowInstance.isActive("manualSinsa")) {
            status = CardApplicationStatus.CONTINUOUS;
        } else {
            status = CardApplicationStatus.NG;
        }

        final SqlPStatement updateStatus = getSqlPStatement("update_status");
        updateStatus.setString(1, status.name());
        updateStatus.setObject(2, request.getParam("id")[0]);
        updateStatus.executeUpdate();

        WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.INFO, "MSG00110"));
        return new HttpResponse("redirect://listCard");
    }

    /**
     * IDに対応するカード申請を取得する。
     *
     * @param id ID
     * @return カード申請情報
     */
    private SqlRow findCardApplication(final String[] id) {
        if (id == null || StringUtil.isNullOrEmpty(id[0])) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00100"));
        }

        final SqlPStatement statement = getSqlPStatement("find_card_application");
        statement.setObject(1, id[0]);
        final SqlResultSet cardApplication = statement.retrieve();
        if (cardApplication.isEmpty()) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00100"));
        }

        return cardApplication.get(0);
    }

    /**
     * 審査OKへ
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://listCard")
    public HttpResponse doSinsaOk(final HttpRequest request, final ExecutionContext context) {
        executeSinsa(request, CardApplicationStatus.OK);
        return new HttpResponse("redirect://listCard");
    }

    /**
     * 審査NGへ
     *
     * @param request リクエストコンテキスト
     * @param context HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "forward://listCard")
    public HttpResponse doSinsaNG(final HttpRequest request, final ExecutionContext context) {
        executeSinsa(request, CardApplicationStatus.NG);
        return new HttpResponse("redirect://listCard");
    }

    /**
     * 審査を実行し指定のステータスに変換する。
     *
     * @param request リクエスト
     * @param newStatus 新しいステータス
     */
    private void executeSinsa(final HttpRequest request, final CardApplicationStatus newStatus) {
        final SqlRow row = findCardApplication(request.getParam("id"));
        final String instanceId = row.getString("WF_INSTANCE_ID");

        final WorkflowInstance workflowInstance = WorkflowManager.findInstance(instanceId);
        if (!workflowInstance.isActive("manualSinsa")) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00100"));
        }

        final SqlPStatement updateStatus = getSqlPStatement("update_status");
        updateStatus.setString(1, newStatus.name());
        updateStatus.setObject(2, request.getParam("id")[0]);
        updateStatus.executeUpdate();

        workflowInstance.triggerEvent("manual_sinsa");

    }

    /**
     * アプリケーションフォーム
     */
    public static class CardApplicationForm {

        /** ID */
        private final Long id;

        /** 名前 */
        private final String name;

        /** 年収 */
        private final Long annualIncome;

        /** ステータス */
        private final CardApplicationStatus status;

        /**
         * インスタンスを生成する。
         *
         * @param id ID
         * @param annualIncome 年収
         * @param status ステータス
         */
        public CardApplicationForm(
                final Long id,
                final String name,
                final Long annualIncome,
                final CardApplicationStatus status) {
            this.id = id;
            this.name = name;
            this.annualIncome = annualIncome;
            this.status = status;
        }

        /**
         * IDを返す。
         *
         * @return ID
         */
        public Long getId() {
            return id;
        }

        /**
         * 名前を返す。
         *
         * @return 名前
         */
        public String getName() {
            return name;
        }

        /**
         * 年収を返す。
         *
         * @return 年収
         */
        public Long getAnnualIncome() {
            return annualIncome;
        }

        /**
         * ステータスを返す。
         *
         * @return ステータス
         */
        public CardApplicationStatus getStatus() {
            return status;
        }

        /**
         * ステータスのラベルを返す。
         *
         * @return ステータスのラベル
         */
        public String getStatusLabel() {
            return status.getLabel();
        }
    }
}
