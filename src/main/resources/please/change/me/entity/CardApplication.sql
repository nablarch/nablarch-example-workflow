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