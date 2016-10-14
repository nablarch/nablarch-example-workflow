package please.change.me.sample.ss11AB;

import nablarch.test.core.http.BasicHttpRequestTestTemplate;

import org.junit.Test;


/**
 * {@link W11AB01Action}のリクエスト単体テストクラス
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AB01ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AB/W11AB01Action/";
    }

    @Test
    public void 承認一覧画面_レイアウト確認_初期表示() {
        execute(getMethodName());
    }
    
    @Test
    public void 承認一覧画面_レイアウト確認_検索() {
        execute(getMethodName());
    }
    
    @Test
    public void 承認一覧画面_精査エラー_検索() {
        execute(getMethodName());
    }
    
    @Test
    public void 承認一覧画面_検索結果0件() {
        execute(getMethodName());
    }
}

