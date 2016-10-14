package please.change.me.sample.ss11AC;

import java.util.Map;

import nablarch.fw.ExecutionContext;

import nablarch.test.core.http.BasicAdvice;
import nablarch.test.core.http.BasicHttpRequestTestTemplate;
import nablarch.test.core.http.TestCaseInfo;

import org.junit.Test;

/**
 * {@link W11AC02Action}のテストクラス。
 */
public class W11AC02ActionRequestTest extends BasicHttpRequestTestTemplate {

    @Override
    protected String getBaseUri() {
        return "/action/ss11AC/W11AC02Action/";
    }

    @Test
    public void RW11AC0201_タスク進行画面が初期表示されること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                Map<String, String> sessions = getListMap(testName.getMethodName(),
                        "session_" + testCaseInfo.getTestCaseNo()).get(0);
                context.setSessionScopedVar("user.groupId", sessions.get("GROUP_ID"));
            }
        });
    }

    @Test
    public void RW11AC0201_引き継ぎ情報不正の場合ユーザエラーへ() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0201_タスクが存在しない場合一覧画面に戻ること() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0201_対象ユーザではない場合一覧画面に戻ること() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0201_対象グループではない場合一覧画面に戻る() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                Map<String, String> sessions = getListMap(testName.getMethodName(),
                        "session_" + testCaseInfo.getTestCaseNo()).get(0);
                context.setSessionScopedVar("user.groupId", sessions.get("GROUP_ID"));
            }
        });
    }

    @Test
    public void RW11AC0202_調査_判定タスクへ遷移すること() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0202_調査_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0203_調査_却下_却下されること() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0203_調査_却下_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0204_判定_次タスクへ遷移すること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0204_判定_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0205_判定_差戻_調査タスクへ遷移すること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0205_判定_差戻_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0206_判定_却下_却下されること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0206_判定_却下_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000002");
            }
        });
    }

    @Test
    public void RW11AC0207_上位判定_実行タスクへ遷移すること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000003");
            }
        });
    }

    @Test
    public void RW11AC0207_上位判定_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000003");
            }
        });
    }

    @Test
    public void RW11AC0208_上位判定_却下_却下されること() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000003");
            }
        });
    }

    @Test
    public void RW11AC0208_上位判定_却下_エラー時はタスク進行画面() throws Exception {
        execute(getMethodName(), new BasicAdvice() {
            @Override
            public void beforeExecute(TestCaseInfo testCaseInfo, ExecutionContext context) {
                context.setSessionScopedVar("user.groupId", "1000000003");
            }
        });
    }

    @Test
    public void RW11AC0209_実行_タスクが進行する() throws Exception {
        execute(getMethodName());
    }

    @Test
    public void RW11AC0209_実行_エラー時はタスク進行画面へ() throws Exception {
        execute(getMethodName());
    }
}

