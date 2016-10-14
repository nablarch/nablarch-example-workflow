package please.change.me.sample.ss11AB;

import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.db.support.TooManyResultException;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;

/**
 * ワークフロー承認一覧機能に関するコンポーネント
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM211AB1Component extends DbAccessSupport {
    
    /**
     * 進行可能申請一覧検索</br>
     * 
     * ログインユーザがアクティブユーザまたはアクティブグループとして割り当てられており、
     * 検索条件（業務種類、申請者）を満たす申請情報の一覧を取得する。</br>
     * 以下のどちらかの場合、割り当てられていると判定する。
     * <ul>
     *   <li>アクティブタスクの担当ユーザとして、ログインユーザが設定されている。</li>
     *   <li>アクティブタスクの担当グループとして、ログインユーザの属するグループが設定されている。</li>
     * </ul>
     * 
     * 検索結果の総件数が上限件数を越えた場合、ApplicationExceptionを返す。
     * 
     * @param form 検索条件
     * @return ワークフローを進行可能で、かつ条件を満たす申請の一覧検索結果
     */
    public SqlResultSet searchActiveApplication(W11AB01Form form) {
        try {
            return search("SELECT_ACTIVE_APPLICATION_BY_CONDITION", form);
        } catch (TooManyResultException e) {
            throw new ApplicationException(MessageUtil.createMessage(MessageLevel.ERROR, "MSG00035", e.getMaxResultCount()));
        }
    }
}
