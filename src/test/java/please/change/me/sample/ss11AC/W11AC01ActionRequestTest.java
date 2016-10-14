package please.change.me.sample.ss11AC;

import nablarch.test.core.http.BasicHttpRequestTestTemplate;

import org.junit.Test;

/**
 * ローン申請登録({@link W11AC01Action})のテストクラス
 */
public class W11AC01ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AC/W11AC01Action/";
    }

    @Test
    public void ローン申請登録画面初期表示_レイアウト確認() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void ローン申請登録確認画面_エラー無しレイアウト確認() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void ローン申請登録確認画面_エラー有りレイアウト確認() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void ローン申請登録処理_エラー無しで登録できること() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void ローン申請登録処理_エラー有りで入力画面に戻ること() throws Exception {
        execute(getMethodName());
    }
}