package please.change.me.sample.ss11AD;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.db.support.TooManyResultException;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;

/**
 * 交通費申請一覧検索コンポ
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AD2Component extends DbAccessSupport {
    
    /**
     * 交通費申請一覧検索</br>
     * 
     * ログインユーザが申請した交通費申請情報の一覧を取得する。
     * 以下を検索条件とする。
     * <ul>
     *   <li>承認状況</li>
     *   <li>移動種類</li>
     * </ul>
     * 
     * @param form 検索条件
     * @return ログインユーザが申請した、検索条件を満たす交通費申請の一覧
     */
    public SqlResultSet selectApplicationByCondition(W11AD03Form form) {
        try {
            return search("SELECT_APPLICATION_BY_CONDITION", form);
        } catch (TooManyResultException e) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00035", e.getMaxResultCount()));
        }
    }
}
