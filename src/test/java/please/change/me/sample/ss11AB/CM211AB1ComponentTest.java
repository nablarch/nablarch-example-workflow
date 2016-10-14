package please.change.me.sample.ss11AB;

import java.util.List;
import java.util.Map;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.message.ApplicationException;
import nablarch.test.Assertion;
import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

/**
 * {@link CM211AB1Component}のテスト
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AB1ComponentTest extends DbAccessTestSupport {
    
    CM211AB1Component target = new CM211AB1Component();
    
    @Test
    public void 進行可能申請一覧検索_アクティブユーザ割当() {
        final String sheetName = "進行可能申請一覧検索_アクティブユーザ割当";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));

            // 実行
            SqlResultSet actual = target.searchActiveApplication(form);

            // 検証
            assertSqlResultSetEquals(message, sheetName, shot.get("expected"), actual);
        }
    }
    
    @Test
    public void 進行可能申請一覧検索_アクティブグループ割当() {
        final String sheetName = "進行可能申請一覧検索_アクティブグループ割当";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));

            // 実行
            SqlResultSet actual = target.searchActiveApplication(form);

            // 検証
            assertSqlResultSetEquals(message, sheetName, shot.get("expected"), actual);
        }
    }
    
    @Test
    public void 進行可能申請一覧検索_割当混在() {
        final String sheetName = "進行可能申請一覧検索_割当混在";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));

            // 実行
            SqlResultSet actual = target.searchActiveApplication(form);

            // 検証
            assertSqlResultSetEquals(message, sheetName, shot.get("expected"), actual);
        }
    }
    
    @Test
    public void 進行可能申請一覧検索_必須でない条件による絞込み() {
        final String sheetName = "進行可能申請一覧検索_必須でない条件による絞込み";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));
            form.setApplicationUserId(shot.get("applicationUserId"));
            form.setBusinessType(shot.get("businessType"));

            // 実行
            SqlResultSet actual = target.searchActiveApplication(form);

            // 検証
            assertSqlResultSetEquals(message, sheetName, shot.get("expected"), actual);
        }
    }

    @Test
    public void 進行可能申請一覧検索_ページング() {
        final String sheetName = "進行可能申請一覧検索_ページング";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));
            form.setApplicationUserId(shot.get("applicationUserId"));
            form.setBusinessType(shot.get("businessType"));
            form.setPageNumber(Integer.valueOf(shot.get("pageNumber")));

            // 実行
            SqlResultSet actual = target.searchActiveApplication(form);

            // 検証
            assertSqlResultSetEquals(message, sheetName, shot.get("expected"), actual);
        }
    }
    
    @Test
    public void 進行可能申請一覧検索_上限件数エラー() {
        final String sheetName = "進行可能申請一覧検索_上限件数エラー";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setThreadContextValues(sheetName, "user");
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AB01Form form = new W11AB01Form();
            form.setLoginUserId(shot.get("loginUserId"));
            form.setUgroupId(shot.get("ugroupId"));
            
            // テストのために、上限件数を変更
            form.setMaxResultCount(1);

            // 実行および検証
            try {
                target.searchActiveApplication(form);
                Assertion.fail(message + "normal end.");
            } catch (ApplicationException e) {
                // test passed.
            }
        }
    }
}
