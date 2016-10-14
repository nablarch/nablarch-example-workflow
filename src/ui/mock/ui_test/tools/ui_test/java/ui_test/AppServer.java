package ui_test;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import nablarch.common.io.FileRecordWriterDisposeHandler;
import nablarch.common.handler.threadcontext.ExecutionIdAttribute;
import nablarch.common.handler.threadcontext.InternalRequestIdAttribute;
import nablarch.common.handler.threadcontext.RequestIdAttribute;
import nablarch.common.handler.threadcontext.ThreadContextAttribute;
import nablarch.common.handler.threadcontext.ThreadContextHandler;
import nablarch.common.handler.threadcontext.TimeZoneAttribute;
import nablarch.common.handler.threadcontext.UserIdAttribute;
import nablarch.common.web.handler.HttpAccessLogHandler;
import nablarch.common.web.handler.NablarchTagHandler;
import nablarch.common.web.handler.threadcontext.LanguageAttributeInHttpCookie;
import nablarch.fw.ExecutionContext;
import nablarch.fw.Handler;
import nablarch.fw.handler.GlobalErrorHandler;
import nablarch.fw.web.handler.SessionConcurrentAccessHandler;
import nablarch.fw.web.HttpMethodBinding;
import nablarch.fw.web.HttpRequest;
import nablarch.fw.web.HttpResponse;
import nablarch.fw.web.HttpServer;
import nablarch.fw.web.handler.ForwardingHandler;
import nablarch.fw.web.handler.HttpCharacterEncodingHandler;
import nablarch.fw.web.handler.HttpErrorHandler;
import nablarch.fw.web.handler.HttpResponseHandler;
import nablarch.fw.web.handler.ResourceMapping;
import nablarch.fw.web.upload.MultipartHandler;
import nablarch.fw.web.upload.PartInfo;

/**
 * JSP用アプリサーバ。
 * 
 * @author nablarch
 * @since 1.3
 */
public class AppServer {

    private static final List<HttpRequest> HTTP_REQUEST_HOLDER = new ArrayList<HttpRequest>();

    private static final List<ExecutionContext> EXECUTION_CONTEXT_HOLDER = new ArrayList<ExecutionContext>();

    /**
     * 現在のHTTPリクエストを返す。
     * @return 現在のHTTPリクエスト
     */
    public static HttpRequest currentRequest() {
        return HTTP_REQUEST_HOLDER.get(0);
    }

    /**
     * 現在の実行コンテキストを返す。
     * @return 現在の実行コンテキスト
     */
    public static ExecutionContext currentExecutionContext() {
        return EXECUTION_CONTEXT_HOLDER.get(0);
    }

    /**
     * メインメソッド。
     * 
     * @param args コマンドライン引数 [サーブレットコンテキストパス(./main/web)] [起動ポート(7777)]
     */
    @SuppressWarnings("rawtypes")
    public static final void main(String[] args) {
        String path = (args.length >= 1) ? args[0] : "./main/web";
        int portNum = (args.length >= 2) ? Integer.valueOf(args[1]) : 7777;
        
        new HttpServer()
            .clearHandlers()
            .setWarBasePath("file://" + path)
            .setPort(portNum)
            .setMethodBinder(new HttpMethodBinding.Binder())
            .addHandler(new GlobalErrorHandler())
            .addHandler(new HttpCharacterEncodingHandler())
            .addHandler(new FileRecordWriterDisposeHandler())
            .addHandler(new SessionConcurrentAccessHandler())
            .addHandler(new HttpResponseHandler())
            .addHandler(new ThreadContextHandler().setAttributes(
                        Arrays.<ThreadContextAttribute>asList(
                        new UserIdAttribute() {{
                            setSessionKey("user.id");
                            setAnonymousId("9999999999");
                        }},
                        new RequestIdAttribute(),
                        new InternalRequestIdAttribute(),
                        new LanguageAttributeInHttpCookie() {{
                            setDefaultLanguage("ja");
                            setSupportedLanguages("ja,en");
                            setCookieMaxAge(7776000); // 90 days
                        }},
                        new ExecutionIdAttribute(),
                        new TimeZoneAttribute() {{
                            setDefaultTimeZone("Asia/Tokyo");
                        }})))
            .addHandler(new HttpAccessLogHandler())
            .addHandler(new ForwardingHandler())
            .addHandler(new HttpErrorHandler())
            .addHandler(new MultipartHandler())
            .addHandler("//*.jsp", new NablarchTagHandler())
            .addHandler("//*.jsp", new Handler<HttpRequest, HttpResponse>() {
                            @Override
                            public HttpResponse handle(HttpRequest req, ExecutionContext ctx) {
                                if (!req.getMultipart().isEmpty()) {
                                    PartInfo part = req.getMultipart().values().iterator().next().get(0);
                                    part.moveTo(new File("./"), part.getFileName());
                                }
                                HTTP_REQUEST_HOLDER.clear();
                                HTTP_REQUEST_HOLDER.add(req);
                                EXECUTION_CONTEXT_HOLDER.clear();
                                EXECUTION_CONTEXT_HOLDER.add(ctx);
                                return new HttpResponse(200, "servlet://" + req.getRequestUri());
                            }
                        })
            .addHandler("//*.*", new ResourceMapping("/", "servlet:///"))
            .start();
    }
}
