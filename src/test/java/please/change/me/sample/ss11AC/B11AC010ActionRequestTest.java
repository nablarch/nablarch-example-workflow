package please.change.me.sample.ss11AC;

import nablarch.test.core.batch.BatchRequestTestSupport;

import org.junit.Test;

/**
 * 内部自動審査バッチ({@link please.change.me.sample.ss11AC.B11AC010Action})のリクエスト単体テストクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class B11AC010ActionRequestTest extends BatchRequestTestSupport {

    /**
     * 内部自動審査が実行され、タスクが進行すること
     */
    @Test
    public void 内部自動審査が実行されタスクが進行すること() throws Exception {
        execute();
    }
}