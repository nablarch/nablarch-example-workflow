--------------------------------------------------------------------------------
-- 処理対象のローン申請IDを取得するSQL
--------------------------------------------------------------------------------
SELECT_INPUT =
SELECT LOAN_APPLI_ID
FROM
    WF_ACTIVE_FLOW_NODE
    INNER JOIN LOAN_APPLICATION
        ON INSTANCE_ID = WF_INSTANCE_ID
WHERE FLOW_NODE_ID = 'T001'

