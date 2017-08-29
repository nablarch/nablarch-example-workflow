package please.change.me.service;

/**
 * ユーザが存在しないことを示す例外
 *
 * @author nabchan
 */
public class UserNotFoundException extends Exception {

    private static final long serialVersionUID = 1L;

    /**
     * ユーザIDと原因から例外を構築する。
     *
     * @param userId ユーザID
     * @param cause 原因
     */
    public UserNotFoundException(final String userId, final Throwable cause) {
        super(userId + " is not found", cause);
    }
}
