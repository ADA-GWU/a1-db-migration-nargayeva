begin;

alter table STUDENTS add column if not exists ST_ID int;
update STUDENTS set ST_ID = STUDENT_ID;
alter table STUDENTS drop column if exists STUDENT_ID;

alter table STUDENTS alter column ST_NAME type varchar(15);
alter table STUDENTS alter column ST_LAST type varchar(15);

commit;
