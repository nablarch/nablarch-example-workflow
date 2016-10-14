package please.change.me.sample.ss11AD;

import nablarch.test.core.http.BasicHttpRequestTestTemplate;

import org.junit.Test;


/**
 * {@link W11AD02Action}のリクエスト単体テストクラス
 *
 * @author Ryo Asato
 * @since 1.4.2
 */
public class W11AD02ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AD/W11AD02Action/";
    }

    @Test
    public void 交通費申請承認画面_レイアウト確認_初期表示() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請_レイアウト確認_アクティブタスク割当精査エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請_交通費申請0件エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請確認_レイアウト確認_各処理完了() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請確認_レイアウト確認_各処理エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請承認_レイアウト確認_各処理完了() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請承認_レイアウト確認_各処理エラー() {
        execute(getMethodName());
    }

    @Test
    public void 交通費再申請完了画面_レイアウト確認_再申請完了() {
        execute(getMethodName());
    }

    @Test
    public void 交通費再申請完了画面_レイアウト確認_エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費申請引戻_レイアウト確認_完了() {
        execute(getMethodName());
    }

    @Test
    public void 交通費申請引戻_レイアウト確認_エラー() {
        execute(getMethodName());
    }
    
    @Test
    public void 交通費再申請画面_申請からの遷移_レイアウト確認_初期表示() {
        execute(getMethodName());
    }
    

    @Test
    public void 交通費再申請画面_申請からの遷移_レイアウト確認_エラー() {
        execute(getMethodName());
    }
}

