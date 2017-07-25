package please.change.me.sample.ss11AA;

import nablarch.test.core.http.BasicHttpRequestTestTemplate;

import org.junit.Test;


/**
 * {@link W11AA01Action}のリクエスト単体テストクラス
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AA01ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AA/W11AA01Action/";
    }

    @Test
    public void ログイン画面_レイアウト確認_初期表示() {
        execute(getMethodName());
    }

    @Test
    public void ログイン画面_ログイン成功() {
        execute(getMethodName());
    }
}

