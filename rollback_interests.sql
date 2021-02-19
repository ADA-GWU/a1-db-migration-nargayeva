begin;

alter table INTERESTS add column INTEREST text;
insert into INTERESTS(STUDENT_ID, INTEREST) select STUDENT_ID,unnest(INTERESTS)
from INTERESTS;
alter table INTERESTS drop column INTERESTS;
delete from interests where interest is null;

commit;
