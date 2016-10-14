package please.change.me.sample.handler;

import nablarch.core.ThreadContext;
import nablarch.core.util.StringUtil;
import nablarch.fw.ExecutionContext;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpRequestHandler;
import nablarch.fw.web.HttpResponse;

/**
 * 画面表示処理に必要な共通処理を行うハンドラ。
 * @author Ryo Asato
 * @since 1.4.2
 */
public class ViewHandler implements HttpRequestHandler {
    
    /**
     * {@inheritDoc}
     * <p/>
     * 画面表示処理に必要な共通処理を行う。
     * <ul>
     * <li>エラー画面用に問合せ番号をリクエストスコープに設定する。</li>
     * </ul>
     */
    public HttpResponse handle(HttpRequest request, ExecutionContext context) {

        HttpResponse res = context.handleNext(request);

        // エラー画面用に問合せ番号の設定
        context.setRequestScopedVar("trackingNumber", ThreadContext.getExecutionId());

        // サイドバーで選択中メニューを表示するために、取引IDの設定
        context.setRequestScopedVar("tid", getTid());

        return res;
    }

    /**
     * スレッドローカルに保持された内部リクエストIDから取引IDを取得する。
     * <p>
     * 内部リクエストIDの2桁目から8桁目を取引IDとして抜き出す。
     * 
     * @return 取引ID。8桁以上の内部リクエストIDが取得できない場合は空文字
     */
    private String getTid() {
        String internalRequestId = ThreadContext.getInternalRequestId();
        if (StringUtil.isNullOrEmpty(internalRequestId)
                || internalRequestId.length() < 8) {
            return "";
        }
        return internalRequestId.substring(1, 8);
    }
}
