package please.change.me.service;

import please.change.me.domain.User;
import please.change.me.entity.UgroupSystemAccount;
import please.change.me.entity.Users;

import nablarch.common.dao.NoDataException;
import nablarch.common.dao.UniversalDao;

/**
 * 認証に関するサービス
 *
 * @author nabcharn
 */
public class AuthService {

    /**
     * 認証処理を行う。
     *
     * @param userId ユーザID
     * @throws UserNotFoundException ユーザが存在しないことを示す例外
     * @return ユーザ
     */
    public User auth(final String userId) throws UserNotFoundException {
        try {
            final Users user = UniversalDao.findById(Users.class, userId);
            final UgroupSystemAccount ugroupSystemAccount = UniversalDao.findBySqlFile(
                    UgroupSystemAccount.class, "BY_USER", new Object[] {userId});
            return new User(userId, user.getKanjiName(), ugroupSystemAccount.getUgroupId());
        } catch (NoDataException e) {
            throw new UserNotFoundException(userId, e);
        }
    }

}
