package please.change.me.sample.ss11.component;

/**
 * 交通費申請に関する定数を定義するインタフェース
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public final class TransExpenseApplicationConstant {
    
    /**
     * 隠蔽コンストラクタ。
     */
    private TransExpenseApplicationConstant() {
        // nop
    }
    
    /** 交通費申請ワークフローID */
    public static final String TRANS_EXPENSE_APPLICATION_WORKFLOW_ID = "WF1101";
    
    //--------------------------------- 境界イベントトリガーID
    /** 確認タスク引戻し時の境界イベントトリガーID */
    public static final String CANCEL_TRIGGER = "BT01";
    
    //--------------------------------- タスクID
    /** 確認タスクID */
    public static final String CONFIRMATION_TASK = "T001";
    /** 承認タスクID */
    public static final String AUTHORIZATION_TASK = "T002";
    /** 再申請タスクID */
    public static final String REAPPLICATION_TASK = "T003";
    
    //--------------------------------- シーケンスフローの条件に使用する値
    /** タスクを進める */
    public static final String FORWARD_CONDITION = "0";
    /** タスクを却下する */
    public static final String REJECT_CONDITION = "1";
    /** タスクを差し戻す */
    public static final String RETURN_CONDITION = "2";
    
    //--------------------------------- ステータス
    /** ステータス:登録完了 */
    public static final String REGISTER_COMPLETE = "00";
    /** ステータス:承認差戻し */
    public static final String AUTHORIZE_RETURN = "01";
    /** ステータス:確認完了 */
    public static final String CONFIRM_COMPLETE = "10";
    /** ステータス:承認完了 */
    public static final String AUTHORIZE_COMPLETE = "20";
    /** ステータス:確認差戻 */
    public static final String CONFIRM_RETURN = "80";
    /** ステータス:確認引戻 */
    public static final String CONFIRM_CANCEL = "81";
    /** ステータス:却下 */
    public static final String REJECT = "90";
    
    //--------------------------------- 処理内容
    /** 処理内容:登録 */
    public static final String REGISTER = "0";
    /** 処理内容:確認 */
    public static final String CONFIRM = "1";
    /** 処理内容:承認 */
    public static final String AUTHORIZE = "2";
    /** 処理内容:引戻し */
    public static final String CANCEL = "3";
    /** 処理内容:再申請 */
    public static final String REAPPLY = "4";
    
    //--------------------------------- 処理結果
    /** 処理結果:タスクを進める */
    public static final String FORWARD_RESULT = "0";
    /** 処理結果:タスクを却下する */
    public static final String REJECT_RESULT = "1";
    /** 処理結果:タスクを差し戻す */
    public static final String RETURN_RESULT = "2";
    
    //--------------------------------- タスクに割り当てるユーザやグループの情報
    /** 承認者グループのグループID */
    public static final String AUTHORIZATION_GROUP = "0000000002";
    /** 確認者グループのグループID */
    public static final String CONFIRMATION_GROUP = "0000000001";

}
