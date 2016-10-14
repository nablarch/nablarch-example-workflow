package please.change.me.sample.ss11AD;

import java.util.List;
import java.util.Map;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.message.ApplicationException;
import nablarch.test.Assertion;
import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

/**
 * {@link CM211AD2Component}のテスト
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AD2ComponentTest extends DbAccessTestSupport {
    
    private CM211AD2Component target = new CM211AD2Component();
    
    @Test
    public void 交通費申請一覧取得_検索条件の確認() {
        final String sheetName = "交通費申請一覧取得_検索条件の確認";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        List<Map<String, String>> params = getListMap(sheetName, "params");

        for (int i = 0; i < shots.size(); i++) {
            Map<String, String> shot = shots.get(i);
            Map<String, String> param = params.get(i);

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AD03Form condition = getSearchCondition(param);

            // 実行
            SqlResultSet actual = target.selectApplicationByCondition(condition);

            // 検証
            assertSqlResultSetEquals(message,
                                     sheetName,
                                     shot.get("expected"),
                                     actual);
        }
    }
    
    @Test
    public void 交通費申請一覧取得_ページングの確認() {
        final String sheetName = "交通費申請一覧取得_ページングの確認";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        List<Map<String, String>> params = getListMap(sheetName, "params");

        for (int i = 0; i < shots.size(); i++) {
            Map<String, String> shot = shots.get(i);
            Map<String, String> param = params.get(i);

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AD03Form condition = getSearchCondition(param);

            // 実行
            SqlResultSet actual = target.selectApplicationByCondition(condition);

            // 検証
            assertSqlResultSetEquals(message,
                                     sheetName,
                                     shot.get("expected"),
                                     actual);
        }
    }

    @Test
    public void 交通費申請一覧取得_上限件数エラー() {
        final String sheetName = "交通費申請一覧取得_上限件数エラー";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        List<Map<String, String>> params = getListMap(sheetName, "params");

        for (int i = 0; i < shots.size(); i++) {
            Map<String, String> shot = shots.get(i);
            Map<String, String> param = params.get(i);

            String message = sheetName + "：shot[" + shot.get("no") + "] " + shot.get("case") + "\n";

            // 事前条件
            setUpDb(sheetName, shot.get("setUpTable"));

            // 入力パラメータ準備
            W11AD03Form condition = getSearchCondition(param);
            
            // テストのために、上限件数を変更
            condition.setMaxResultCount(1);

            // 実行および検証
            try {
                target.selectApplicationByCondition(condition);
                Assertion.fail(message + "normal end.");
            } catch (ApplicationException e) {
                // test passed.
            }
        }
    }
    
    /**
     * テストデータを設定した申請一覧検索用Formを取得する。。
     * @param parameter テストデータ
     * @return テストデータを設定したEntity
     */
    private W11AD03Form getSearchCondition(Map<String, String> parameter) {
        W11AD03Form form = new W11AD03Form();
        form.setLoginUserId(parameter.get("loginUserId"));
        form.setDeviceCd(parameter.get("deviceCd"));
        form.setStatusCd(parameter.get("statusCd"));
        form.setPageNumber(Integer.parseInt(parameter.get("pageNumber")));
        return form;
    }
}
