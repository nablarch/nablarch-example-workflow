package please.change.me.sample.ss11AC;

import nablarch.common.exclusivecontrol.ExclusiveControlUtil;
import nablarch.core.db.statement.SqlRow;
import nablarch.fw.DataReader;
import nablarch.fw.ExecutionContext;
import nablarch.fw.Result;
import nablarch.fw.action.BatchAction;
import nablarch.fw.reader.DatabaseRecordReader;

import please.change.me.sample.exclusive.ExclusiveLoanApplicationContext;
import please.change.me.sample.ss11.component.CM111002Component;

/**
 * ローン申請の自動審査処理を行うバッチアクションクラス。
 *
 * @author hisaaki sioiri
 * @since 1.4.2
 */
public class B11AC010Action extends BatchAction<SqlRow> {

    /**
     * {@inheritDoc}
     * <p/>
     * 自動審査を行いタスクを進行する。
     */
    @Override
    public Result handle(SqlRow inputData, ExecutionContext ctx) {

        String loanAppliId = inputData.getString("LOAN_APPLI_ID");

        ExclusiveControlUtil.updateVersion(new ExclusiveLoanApplicationContext(loanAppliId));

        CM111002Component component = new CM111002Component();
        component.executeAutoScreening(loanAppliId);

        return new Result.Success();
    }


    /**
     * データリーダを生成する。
     * <p/>
     * 本バッチ処理で処理する自動審査処理対象のローン申請データを取得するリーダを生成する。
     *
     * @param ctx 実行コンテキスト
     * @return 処理対象のローン申請データを読み込むリーダ
     */
    @Override
    public DataReader<SqlRow> createReader(ExecutionContext ctx) {
        DatabaseRecordReader reader = new DatabaseRecordReader();
        reader.setStatement(getSqlPStatement("SELECT_INPUT"));
        return reader;
    }
}

