package please.change.me.action;

import nablarch.common.dao.UniversalDao;
import nablarch.common.web.WebUtil;
import nablarch.common.web.interceptor.InjectForm;
import nablarch.core.beans.BeanUtil;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;
import nablarch.integration.workflow.WorkflowInstance;
import nablarch.integration.workflow.WorkflowManager;
import please.change.me.domain.code.CardApplicationStatus;
import please.change.me.entity.CardApplication;
import please.change.me.form.card.CardApplicationDto;
import please.change.me.form.card.CardApplicationSearchForm;
import please.change.me.form.card.NewCardForm;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * カード申し込みアクション。
 *
 * @author nabchan
 */
public class CardApplicationAction {

    /**
     * カード申し込み画面を表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse list(final HttpRequest request, final ExecutionContext context) {

        List<CardApplicationDto> list =
                UniversalDao.findAllBySqlFile(CardApplication.class,"LIST_CARD_APPLICATION")
                            .stream()
                            .map(cardApp -> new CardApplicationDto(
                                    cardApp.getId(),
                                    cardApp.getName(),
                                    cardApp.getAnnualIncome(),
                                    CardApplicationStatus.valueOf(cardApp.getStatus())))
                            .collect(Collectors.toList());
        context.setRequestScopedVar("list", list);
        return new HttpResponse("/WEB-INF/card/list.jsp");
    }


    /**
     * カード申し込み画面を表示する。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    public HttpResponse newCard(final HttpRequest request, final ExecutionContext context) {
        return new HttpResponse("/WEB-INF/card/new_card.jsp");
    }

    /**
     * カード申し込みを行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(form = NewCardForm.class, prefix = "card")
    @OnError(path = "/WEB-INF/card/new_card.jsp", type = ApplicationException.class)
    public HttpResponse createCard(final HttpRequest request, final ExecutionContext context) {
        NewCardForm form = context.getRequestScopedVar("form");
        CardApplication entity = BeanUtil.createAndCopy(CardApplication.class, form);

        WorkflowInstance wfInstance = WorkflowManager.startInstance("new-card");

        entity.setWfInstanceId(wfInstance.getInstanceId());
        entity.setStatus(CardApplicationStatus.NEW.name());
        
        UniversalDao.insert(entity);

        return new HttpResponse("redirect:///action/card/list");
    }

    /**
     * 自動審査処理を行う。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(form = CardApplicationSearchForm.class)
    @OnError(type = ApplicationException.class, path = "forward:///action/card/list")
    public HttpResponse doAutoSinsa(final HttpRequest request, final ExecutionContext context) {
        CardApplicationSearchForm form = context.getRequestScopedVar("form");
        CardApplication cardApplication = UniversalDao.findById(CardApplication.class, form.getId());

        WorkflowInstance wfInstance = WorkflowManager.findInstance(cardApplication.getWfInstanceId());
        if (!wfInstance.isActive("new")) {
            throw new ApplicationException(
                    MessageUtil.createMessage(MessageLevel.ERROR, "please.change.me.card.notFound"));
        }

        Map<String, Long> parameter = Collections.singletonMap("annualIncome",
                                                               cardApplication.getAnnualIncome());
        wfInstance.triggerEvent("sinsa", parameter);

        CardApplicationStatus status = wfInstance.isActive("manualSinsa") ?
                CardApplicationStatus.CONTINUOUS :
                CardApplicationStatus.NG;
        cardApplication.setStatus(status.name());

        UniversalDao.update(cardApplication);

        WebUtil.notifyMessages(context, MessageUtil.createMessage(MessageLevel.INFO,
                                                                  "please.change.me.card.done"));
        return new HttpResponse("redirect:///action/card/list");
    }



    /**
     * 審査OKへ。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(form = CardApplicationSearchForm.class)
    @OnError(type = ApplicationException.class, path = "forward:///action/card/list")
    public HttpResponse doSinsaOK(final HttpRequest request, final ExecutionContext context) {
        CardApplicationSearchForm form = context.getRequestScopedVar("form");
        executeSinsa(form.getId(), CardApplicationStatus.OK);
        return new HttpResponse("redirect:///action/card/list");
    }

    /**
     * 審査NGへ。
     *
     * @param request リクエスト
     * @param context コンテキスト
     * @return レスポンス
     */
    @InjectForm(form = CardApplicationSearchForm.class)
    @OnError(type = ApplicationException.class, path = "forward:///action/card/list")
    public HttpResponse doSinsaNG(final HttpRequest request, final ExecutionContext context) {
        CardApplicationSearchForm form = context.getRequestScopedVar("form");
        executeSinsa(form.getId(), CardApplicationStatus.NG);
        return new HttpResponse("redirect:///action/card/list");
    }

    /**
     * 審査を実行し指定のステータスに変換する。
     *
     * @param id ID
     * @param newStatus 新しいステータス
     */
    private void executeSinsa(String id, final CardApplicationStatus newStatus) {
        CardApplication cardApplication = UniversalDao.findById(CardApplication.class, id);

        WorkflowInstance wfInstance = WorkflowManager.findInstance(cardApplication.getWfInstanceId());
        if (!wfInstance.isActive("manualSinsa")) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR,
                                                                     "please.change.me.card.notFound"));
        }
        cardApplication.setStatus(newStatus.name());
        UniversalDao.update(cardApplication);
        wfInstance.triggerEvent("manual_sinsa");
    }
}
