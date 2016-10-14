package please.change.me.sample.ss11AD;

import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;

/**
 * 交通費申請履歴テーブルアクセスコンポ
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AD1Component extends DbAccessSupport {

    /**
     * 交通費申請IDに紐付く履歴を実行日時の昇順で取得する。
     * 
     * @param applicationId 交通費申請ID
     * @return 交通費申請IDに紐付く履歴
     */
    public SqlResultSet getHistory(String applicationId) {
        SqlPStatement statement = getSqlPStatement("GET_HISTORY");
        statement.setString(1, applicationId);
        return statement.retrieve();
    }
}
