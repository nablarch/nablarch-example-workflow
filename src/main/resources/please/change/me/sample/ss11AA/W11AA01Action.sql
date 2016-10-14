-------------------------------------------------------------------------------
-- ユーザ一覧取得用
-------------------------------------------------------------------------------
SELECT_USERS =
SELECT
    USER_ID,
    KANJI_NAME
FROM
    USERS

-------------------------------------------------------------------------------
-- ユーザ検索用
-------------------------------------------------------------------------------
SELECT_USER_INFO =
SELECT
    USERS.USER_ID,
    KANJI_NAME,
    UGROUP_ID
FROM
    USERS
    INNER JOIN UGROUP_SYSTEM_ACCOUNT
    ON UGROUP_SYSTEM_ACCOUNT.USER_ID = USERS.USER_ID
WHERE
    USERS.USER_ID = ?