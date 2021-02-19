begin;

alter table STUDENTS add column STUDENT_ID int;
update STUDENTS set STUDENT_ID = ST_ID;
alter table STUDENTS drop column if exists ST_ID;

alter table STUDENTS alter column ST_NAME type varchar(30);
alter table STUDENTS alter column ST_LAST type varchar(30);

commit;
