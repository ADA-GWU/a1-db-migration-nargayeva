begin;

alter table INTERESTS add column INTERESTS text[];
insert into INTERESTS(STUDENT_ID, INTERESTS) select STUDENT_ID, array_agg(INTEREST) from INTERESTS group by STUDENT_ID;
delete from interests where interests is null;
alter table INTERESTS drop column INTEREST;

commit;
