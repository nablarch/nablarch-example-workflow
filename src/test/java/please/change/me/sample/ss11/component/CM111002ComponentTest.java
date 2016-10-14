package please.change.me.sample.ss11.component;

import java.util.List;
import java.util.Map;

import please.change.me.sample.ss11.entity.LoanApplicationEntity;
import please.change.me.sample.ss11.entity.LoanApplicationHistoryEntity;

import nablarch.test.core.db.DbAccessTestSupport;

import org.junit.Test;

/**
 * {@link CM111002Component}のテストクラス。
 */
public class CM111002ComponentTest extends DbAccessTestSupport {

    /** テスト対象 */
    private CM111002Component sut = new CM111002Component();

    /**
     * ローン申請処理のテストを行う。
     */
    @Test
    public void ローン申請処理のテスト() throws Exception {
        String sheetName = "ローン申請登録";

        setThreadContextValues(sheetName, "user");

        List<Map<String, String>> shots = getListMap(sheetName, "testShots");
        for (Map<String, String> shot : shots) {
            setUpDb("setUpDb");
            setUpDb(sheetName, shot.get("setupTable"));

            Map<String, String> param = getListMap(sheetName, shot.get("param")).get(0);
            LoanApplicationEntity entity = createLoanApplicationEntity(param);
            sut.applyLoan(entity);

            commitTransactions();

            assertTableEquals("テストケース:" + shot.get("no"), sheetName, shot.get("expectedTable"));
        }
    }

    /**
     * 自動審査処理のテストを行う。
     */
    @Test
    public void ローン申請の自動審査処理のテスト() throws Exception {

        String sheetName = "自動審査";
        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        setThreadContextValues(sheetName, "user");

        for (Map<String, String> shot : shots) {
            setUpDb(sheetName);
            setUpDb("setUpDb");

            String loanAppliId = shot.get("loanAppliId");
            sut.executeAutoScreening(loanAppliId);
            commitTransactions();

            assertTableEquals("テストケース:" + shot.get("no"), sheetName, shot.get("expectedTable"));
        }
    }

    /**
     * 調査処理のテストを行う。
     */
    @Test
    public void ローン申請の調査処理のテスト() throws Exception {
        String sheetName = "調査処理";

        List<Map<String, String>> shots = getListMap(sheetName, "testShots");

        setThreadContextValues(sheetName, "user");

        for (Map<String, String> shot : shots) {
            setUpDb(sheetName);
            setUpDb("setUpDb");

            Map<String, String> param = getListMap(sheetName, shot.get("param")).get(0);
            LoanApplicationEntity loanApplicationEntity = createLoanApplicationEntity(param);
            LoanApplicationHistoryEntity historyEntity = createLoanApplicationHistoryEntity(param);

            sut.executeSurvey(loanApplicationEntity, historyEntity);

            commitTransactions();

            assertTableEquals("テストケース:" + shot.get("no"), sheetName, shot.get("expectedTable"));
        }

    }

    /**
     * 入力パラメータの{@link Map}を元に{@link LoanApplicationEntity}生成する。
     *
     * @param input パラメータ
     * @return ローン申請エンティティ
     */
    private LoanApplicationEntity createLoanApplicationEntity(Map<String, String> input) {
        LoanApplicationEntity entity = new LoanApplicationEntity();
        entity.setCompany(input.get("company"));
        entity.setTransferDate(input.get("transferDate"));
        entity.setLoanAmount((input.get("loanAmount") == null) ? null : Integer.valueOf(input.get("loanAmount")));
        entity.setAnnualSalary((input.get("annualSalary") == null) ? null : Integer.valueOf(input.get("annualSalary")));
        entity.setLoanAppliId(input.get("loanApplicationId"));
        entity.setSurveyContent(input.get("surveyContent"));
        entity.setWfInstanceId(input.get("wfInstanceId"));
        return entity;
    }

    /**
     * 入力パラメータの{@link Map}を元に{@link LoanApplicationHistoryEntity}を生成する。
     *
     * @param input パラメータ
     * @return ローン申請履歴エンティティ
     */
    private LoanApplicationHistoryEntity createLoanApplicationHistoryEntity(Map<String, String> input) {
        LoanApplicationHistoryEntity entity = new LoanApplicationHistoryEntity();
        entity.setHistoryComment(input.get("historyComment"));
        entity.setLoanAppliId(input.get("loanApplicationId"));
        return entity;
    }
}
