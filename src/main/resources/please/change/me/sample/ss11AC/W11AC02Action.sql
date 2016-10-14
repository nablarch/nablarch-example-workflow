--------------------------------------------------------------------------------
-- ローン申請履歴を取得する。
--------------------------------------------------------------------------------
SELECT_LOAN_APPLICATION_HISTORY =
SELECT
    LOAN_APPLI_HISTORY_ID,
    LOAN_APPLI_ID,
    EXECUTIONER_ID,
    KANJI_NAME,
    EXECUTION_DATE_TIME,
    LOAN_APPLI_ACTION_CD,
    LOAN_APPLI_RESULT_CD,
    HISTORY_COMMENT
FROM
    LOAN_APPLICATION_HISTORY
    inner join USERS
    ON USER_ID = EXECUTIONER_ID
WHERE
    LOAN_APPLI_ID = ?
ORDER BY EXECUTION_DATE_TIME




