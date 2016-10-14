-------------------------------------------------------------------------------
-- ユーザ一覧取得用
-------------------------------------------------------------------------------
SELECT_USER_GROUPS =
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
    UGROUP_SYSTEM_ACCOUNT.UGROUP_ID = '0000000000'