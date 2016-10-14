package please.change.me.sample.ss11.component;

/**
 * ローン申請に関する定数を定義するインタフェース
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public final class LoanApplicationConstant {

    /**
     * 隠蔽コンストラクタ。
     */
    private LoanApplicationConstant() {
    }

    /** ローン申請のワークフローID */
    public static final String LOAN_APPLICATION_WORKFLOW_ID = "WF1102";

    //--------------------------------- レーンID

    /** 調査レーンID */
    public static final String SURVEY_LANE_ID = "L4";

    //--------------------------------- タスクID

    /** 自動審査タスクID */
    public static final String AUTO_SCREENING_TASK_ID = "T001";

    /** 調査タスクID */
    public static final String SURVEY_TASK_ID = "T002";

    /** 判定タスクID */
    public static final String JUDGING_TASK_ID = "T003";

    /** 上位判定タスクID */
    public static final String UPPER_LEVEL_JUDGING_TASK_ID = "T004";

    /** 実行タスクID */
    public static final String EXECUTE_TASK_ID = "T005";

    //--------------------------------- シーケンスフローの条件に使用する値

    /** 次タスクへ遷移する場合の条件 */
    public static final int CONDITION_OK = 0;

    /** 却下へ遷移する場合の条件 */
    public static final int CONDITION_REJECT = 1;

    /** 差し戻しへ遷移する場合の条件 */
    public static final int CONDITION_RETURN = 2;

    //--------------------------------- ステータス

    /** ステータス:自動審査待ち */
    public static final String WAIT_AUTO_SCREENING = "00";

    /** ステータス:調査待ち */
    public static final String WAIT_INQUIRY_STATUS = "10";

    /** ステータス:再調査 */
    public static final String WAIT_RE_INQUIRY_STATUS = "11";

    /** ステータス:判定待ち */
    public static final String WAIT_JUDGING = "20";

    /** ステータス:上位判定待ち */
    public static final String WAIT_UPPER_LEVEL_JUDGING = "30";

    /** ステータス:審査完了待ち */
    public static final String WAIT_COMPLETION = "40";

    /** ステータス:完了 */
    public static final String COMPLETED = "50";

    /** ステータス:却下 */
    public static final String REJECTION_STATUS = "60";

    //--------------------------------- 処理内容

    /** 処理内容:登録 */
    public static final String REGISTERED = "0";

    /** 処理内容:自動審査 */
    public static final String AUTO_SCREENED = "1";

    /** 処理内容:調査 */
    public static final String SURVEYED = "2";

    /** 処理内容:判定 */
    public static final String JUDGED = "3";

    /** 処理内容:乗員判定 */
    public static final String UPPER_LEVEL_JUDGED = "4";

    /** 処理内容:実行 */
    public static final String EXECUTED = "5";

    //--------------------------------- 処理結果

    /** 処理結果:完了 */
    public static final String RESULT_OK = "0";

    /** 処理結果:却下 */
    public static final String RESULT_REJECTION = "1";

    /** 処理結果:差し戻し */
    public static final String RESULT_RETURN = "2";

    //--------------------------------- タスクに割り当てるユーザやグループの情報

    /** 調査担当者の属するグループID */
    public static final String PROSPECT_GROUP_ID = "1000000001";

    /** 自動審査を行うバッチユーザID */
    public static final String AUTO_SCREENING_USER_ID = "1000000001";

    /** 判定グループID */
    public static final String JUDGING_GROUP_ID = "1000000002";

    /** 上位判定グループID */
    public static final String UPPER_LEVEL_JUDGING_GROUP_ID = "1000000003";
}
