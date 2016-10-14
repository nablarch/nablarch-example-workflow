package please.change.me.sample.ss11AD;

import nablarch.test.core.http.BasicHttpRequestTestTemplate;

import org.junit.Test;


/**
 * {@link W11AD03Action}のリクエスト単体テストクラス
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD03ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AD/W11AD03Action/";
    }

    @Test
    public void 交通費申請一覧画面_レイアウト確認_初期表示() {
        execute(getMethodName());
    }

    @Test
    public void 交通費申請一覧画面_レイアウト確認_検索処理() {
        execute(getMethodName());
    }

    @Test
    public void 交通費申請一覧画面_レイアウト確認_精査エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請一覧画面_レイアウト確認_検索結果0件() {
        execute(getMethodName());
    }

    @Test
    public void 交通費申請詳細画面_レイアウト確認_初期表示() {
        execute(getMethodName());
    }

    @Test
    public void 交通費申請詳細画面_レイアウト確認_エラー() {
        execute(getMethodName());
    }
}

