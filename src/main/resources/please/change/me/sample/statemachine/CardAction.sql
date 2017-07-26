insert_card_application =
insert into card_application (
  ID,
  WF_INSTANCE_ID,
  NAME,
  ANNUAL_INCOME,
  STATUS
) values (
  :id,
  :instanceId,
  :name,
  :annualIncome,
  :status
)


list_card_application =
select 
  ID,
  NAME,
  ANNUAL_INCOME,
  STATUS
from CARD_APPLICATION
order by ID

find_card_application = 
select
  WF_INSTANCE_ID,
  ANNUAL_INCOME
from CARD_APPLICATION
where id = ?
  for update 
  

update_status = 
update
  card_application
set
  status = ?
where id = ?

