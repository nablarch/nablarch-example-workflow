package please.change.me.sample.ss11AC;

import nablarch.core.message.ApplicationException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.interceptor.OnError;

import please.change.me.sample.ss11.component.CM111002Component;

/**
 * ローン申請登録取引のアクションクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class W11AC01Action {

    /**
     * ローン申請登録画面を表示する。
     * <p/>
     * 処理は特に無し
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AC0101(HttpRequest req, ExecutionContext ctx) {
        return new HttpResponse("/ss11AC/W11AC0101.jsp");
    }

    /**
     * ローン申請登録確認画面を表示する。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "/ss11AC/W11AC0101.jsp")
    public HttpResponse doRW11AC0102(HttpRequest req, ExecutionContext ctx) {
        W11AC01FormBase form = W11AC01Form.validate("W11AC01", req, "confirm");

        ctx.setRequestScopedVar("W11AC01", form);
        return new HttpResponse("/ss11AC/W11AC0102.jsp");
    }

    /**
     * ローン申請登録確認画面から入力画面へ戻る。
     * <p/>
     * 処理は特に無し
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    public HttpResponse doRW11AC0103(HttpRequest req, ExecutionContext ctx) {
        return new HttpResponse("/ss11AC/W11AC0101.jsp");
    }

    /**
     * ローン申請登録処理を行う。
     *
     * @param req リクエストコンテキスト
     * @param ctx HTTPリクエストの処理に関連するサーバ側の情報
     * @return HTTPレスポンス
     */
    @OnError(type = ApplicationException.class, path = "/ss11AC/W11AC0101.jsp")
    public HttpResponse doRW11AC0104(HttpRequest req, ExecutionContext ctx) {
        W11AC01Form form = W11AC01Form.validate("W11AC01", req, "confirm");

        CM111002Component component = new CM111002Component();
        component.applyLoan(form.getLoanApplicationEntity());

        return new HttpResponse("/ss11AC/W11AC0103.jsp");
    }
}

