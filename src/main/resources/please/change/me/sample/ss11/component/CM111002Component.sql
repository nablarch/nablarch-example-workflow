--------------------------------------------------------------------------------
-- ローン申請データ登録
--------------------------------------------------------------------------------
INSERT_LOAN_APPLICATION =
INSERT INTO
    LOAN_APPLICATION
    (
    LOAN_APPLI_ID,
    WF_INSTANCE_ID,
    LOAN_APPLI_STATUS_CD,
    COMPANY,
    ANNUAL_SALARY,
    LOAN_AMOUNT,
    TRANSFER_DATE,
    SURVEY_CONTENT,
    INSERT_USER_ID,
    INSERT_DATE_TIME,
    LOAN_APPLI_VERSION
    ) VALUES (
    :loanAppliId,
    :wfInstanceId,
    :loanAppliStatusCd,
    :company,
    :annualSalary,
    :loanAmount,
    :transferDate,
    :surveyContent,
    :insertUserId,
    :insertDateTime,
    1
    )


-------------------------------------------------------------------------------
-- ローン申請データ取得
-------------------------------------------------------------------------------
SELECT_LOAN_APPLICATION =
SELECT
    LOAN_APPLI_ID,
    COMPANY,
    ANNUAL_SALARY,
    LOAN_AMOUNT,
    TRANSFER_DATE,
    SURVEY_CONTENT,
    WF_INSTANCE_ID
FROM
    LOAN_APPLICATION
WHERE
    LOAN_APPLI_ID = ?

-------------------------------------------------------------------------------
-- ローン申請ステータス更新
-------------------------------------------------------------------------------
UPDATE_STATUS =
UPDATE
    LOAN_APPLICATION
SET
    LOAN_APPLI_STATUS_CD = :loanAppliStatusCd
WHERE
    LOAN_APPLI_ID = :loanAppliId

-------------------------------------------------------------------------------
-- ローン申請ステータスと調査コメント更新
-------------------------------------------------------------------------------
UPDATE_STATUS_AND_SURVEY_CONTENT =
UPDATE
    LOAN_APPLICATION
SET
    LOAN_APPLI_STATUS_CD = :loanAppliStatusCd,
    SURVEY_CONTENT = :surveyContent
WHERE
    LOAN_APPLI_ID = :loanAppliId

-------------------------------------------------------------------------------
-- ローン申請履歴登録
-------------------------------------------------------------------------------
INSERT_LOAN_APPLICATION_HISTORY =
INSERT INTO
    LOAN_APPLICATION_HISTORY
    (
    LOAN_APPLI_HISTORY_ID,
    LOAN_APPLI_ID,
    EXECUTIONER_ID,
    EXECUTION_DATE_TIME,
    LOAN_APPLI_ACTION_CD,
    LOAN_APPLI_RESULT_CD,
    HISTORY_COMMENT
    ) VALUES (
    :loanAppliHistoryId,
    :loanAppliId,
    :executionerId,
    :executionDateTime,
    :loanAppliActionCd,
    :loanAppliResultCd,
    :historyComment
    )


