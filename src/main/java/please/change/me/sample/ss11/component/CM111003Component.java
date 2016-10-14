package please.change.me.sample.ss11.component;

import nablarch.core.db.statement.SqlPStatement;
import nablarch.core.db.statement.SqlResultSet;
import nablarch.core.db.statement.SqlRow;
import nablarch.core.db.support.DbAccessSupport;
import nablarch.core.message.ApplicationException;
import nablarch.core.message.MessageLevel;
import nablarch.core.message.MessageUtil;

/**
 * ユーザー情報アクセス用コンポーネント
 * 
 * @author Ryo Asato
 * @since 1.4.2
 */
public class CM111003Component extends DbAccessSupport {
    
    /**
     * 指定したグループIDに紐付く全ユーザを取得する。
     * 
     * @param ugroupId グループID
     * @return グループIDに紐付く全ユーザ
     */
    public SqlResultSet getUserList(String ugroupId) {
        SqlPStatement statement = getSqlPStatement("SELECT_USERS");
        statement.setString(1, ugroupId);
        return statement.retrieve();
    }
    
    /**
     * 指定したユーザIDに紐付くユーザ情報を取得する。<br/>
     * ユーザ情報が取得出来なかった場合、ApplicationExceptionを投げる。
     * @param userId ユーザID
     * @return ユーザIDに紐付くユーザ情報
     */
    public SqlRow getUser(String userId) {
        SqlPStatement statement = getSqlPStatement("GET_USER");
        statement.setString(1, userId);
        SqlResultSet resultSet = statement.retrieve();
        if (resultSet.isEmpty()) {
            throw new ApplicationException(
                    MessageUtil.createMessage(MessageLevel.ERROR, "MSG00097"));
        }
        return resultSet.get(0);
    }

}
