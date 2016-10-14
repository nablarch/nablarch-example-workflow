package please.change.me.sample.ss11.component;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.message.ApplicationException;
import nablarch.test.Assertion;
import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

/**
 * {@link CM111003Component}のテスト
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM111003ComponentTest extends DbAccessTestSupport {
    
    private CM111003Component target = new CM111003Component();
    
    
    @Test
    public void ユーザ情報取得_ユーザグループに紐付くユーザ情報を取得() {
        final String sheetName = "ユーザ情報取得_ユーザグループに紐付くユーザ情報を取得";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        for (Map<String, String> shot : shots) {

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            String ugroupId = shot.get("ugroupId");

            // 実行
            SqlResultSet actual = target.getUserList(ugroupId);

            // 検証
            assertSqlResultSetEquals(message,
                                     sheetName,
                                     shot.get("expected"),
                                     actual);
        }
    }
    
    @Test
    public void ユーザ情報取得_ユーザIDに紐付くユーザ情報が取得できること() {
        final String sheetName = "ユーザ情報取得_ユーザIDに紐付くユーザ情報を取得";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        for (Map<String, String> shot : shots) {

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            String userId = shot.get("userId");

            // 実行
            SqlRow actual = target.getUser(userId);

            // 検証
            assertSqlRowEquals(message,
                                     sheetName,
                                     shot.get("expected"),
                                     actual);
        }
    }
    
    @Test
    public void ユーザ情報取得_ユーザIDに紐付くユーザ情報が取得できない() {
        final String sheetName = "ユーザ情報取得_ユーザIDに紐付くユーザ情報が取得できない";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        for (Map<String, String> shot : shots) {

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            String userId = shot.get("userId");

            // 実行および検証
            try {
                target.getUser(userId);
                Assertion.fail("normal end.");
            } catch (ApplicationException e) {
                assertEquals(message, shot.get("expectedMessage"), e.getMessages().get(0).getMessageId());
            }
        }
    }

}
