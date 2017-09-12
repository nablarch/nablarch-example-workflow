SEARCH_AUTO_SCREENING_DATA=
select loan_appli_id
from
  wf_active_flow_node
  inner join loan_application
    on instance_id = wf_instance_id
where flow_node_id = 'AUTO_SCREENING'

GET_LOAN_APPLICATION_WITH_LOCK =
select *
from loan_application
where loan_appli_id = ?
for update 

LOCK =
select *
from loan_application
where loan_appli_id = :loanAppliId
and version = :version
for update 


