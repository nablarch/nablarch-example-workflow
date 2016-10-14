package please.change.me.sample.ss11AD;

import java.util.List;
import java.util.Map;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

/**
 * {@link CM211AD1Component}のテスト
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AD1ComponentTest extends DbAccessTestSupport {
    
    private CM211AD1Component target = new CM211AD1Component();
    
    @Test
    public void 交通費申請履歴取得_指定した交通費申請履歴が取得できること() {
        final String sheetName = "交通費申請履歴取得_指定した申請IDの履歴を取得";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        for (Map<String, String> shot : shots) {

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            String appliId = shot.get("appliId");

            // 実行
            SqlResultSet actual = target.getHistory(appliId);

            // 検証
            assertSqlResultSetEquals(message,
                                     sheetName,
                                     shot.get("expected"),
                                     actual);
        }
    }
}
