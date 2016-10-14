-------------------------------------------------------------------------------
-- ユーザ一覧取得用
-------------------------------------------------------------------------------
SELECT_USERS =
SELECT
    USERS.USER_ID,
    USERS.KANJI_NAME
FROM
    USERS
INNER JOIN
    UGROUP_SYSTEM_ACCOUNT
ON
    USERS.USER_ID = UGROUP_SYSTEM_ACCOUNT.USER_ID
WHERE
    UGROUP_SYSTEM_ACCOUNT.UGROUP_ID = ?
ORDER BY
    USERS.USER_ID
    
-------------------------------------------------------------------------------
-- ユーザ情報取得用
-------------------------------------------------------------------------------
GET_USER =
SELECT
    USER_ID,
    KANJI_NAME
FROM
    USERS
WHERE
    USER_ID = ?