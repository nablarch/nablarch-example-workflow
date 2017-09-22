package please.change.me.handler;

import javax.persistence.OptimisticLockException;

import nablarch.common.dao.NoDataException;
import nablarch.common.web.session.SessionKeyNotFoundException;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpErrorResponse;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpRequestHandler;
import nablarch.fw.web.HttpResponse;

/**
 * 例外処理を行うハンドラ。
 * 
 * 例外に応じたレスポンスを決定する。
 * 
 * @author nabchan
 */
public class ExceptionHandler implements HttpRequestHandler {

    @Override
    public HttpResponse handle(final HttpRequest request, final ExecutionContext context) {
        try {
            return context.handleNext(request);
        } catch (NoDataException e) {
            // データなしは404
            throw new HttpErrorResponse(404, e);
        } catch (SessionKeyNotFoundException | OptimisticLockException e) {
            // もう一度最初から画面へ
            throw new HttpErrorResponse(400, "/WEB-INF/error/RETRY.jsp", e);
        }
    }
}
