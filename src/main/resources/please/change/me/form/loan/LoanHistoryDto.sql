FIND_BY_LOAN_ID=
select
  kanji_name,
  execution_date_time,
  loan_appli_action_cd,
  loan_appli_result_cd,
  history_comment
from
  loan_application_history
  inner join users
    on user_id = executioner_id
where
  loan_appli_id = ?
order by execution_date_time
