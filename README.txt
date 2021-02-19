# About the general process

For this assignment, I used Docker software. I created a Postgres container, and I have all my files and database in that container. I can easily observe my containers running and stopping in the Docker dashboard, and the process was pretty smooth. The commands that I have used:

docker run --name mypostgres -e POSTGRES_PASSWORD=mypostgres -d -p 5432 postgres:latest -> creating a container
docker exec -it mypostgres bash 
psql -U postgres 
\c, \dt, \l -> for looking up tables, databases, etc.
psql -U postgres -d db -f migration.sql -> running my files


# migration_students.sql

In the migration_students.sql file, I simply tried to rename the column ST_ID to STUDENT_ID. For that, I firstly added a new column called STUDENT_ID, then set that column to ST_ID to transfer ST_ID's values to the new column, and then after getting done with ST_ID, I dropped it with the case "if exists." It does seem erroneous to get this done by using rename because there is a possibility that somewhere some other resource use that column, so that's why I just did it using add, set, and drop.

The second part of the code is the type size change of ST_NAME and ST_LAST as requested. I simply used alter the query to change the varchar(15) to varchar(15). To save changes in the database, you need to commit; changes as well.


# migration_interests.sql

In this file, you can observe renaming the type of INTEREST column and changing its type to string array. I did this again using the strategy of adding the column and dropping the previous one; I, firstly, added a new column called INTERESTS with the type text[] as requested, then I insert values into that new column, and for that, I used array_agg function to transfer values of the column INTEREST to INTERESTS (this function some set of values and return array). I grouped them by STUDENT_ID because, in the end, we need to collect all interests of one student in one column - INTERESTS, not separately. 

In the end, I got results correctly, but there was some minor difference with what I was asked to get. As a result, I corrected them by removing null cells and dropping the old column INTEREST.


# rollback_students.sql

As we need to get back to the initial version of the two tables in the rollback, I do what I have done in vice versa. I created the ST_ID column and set that column to STUDENT_ID, then dropped the column STUDENT_ID. Because as a result, we have to get the initial column (ST_ID) back. 

The second part was also straightforward: I just altered both ST_NAME and ST_LAST to change their type size back to 15.


# rollback_interests.sql

In rollback_interests.sql, I simply added the column INTEREST with the type text, then inserted values into that column by concerting my array values into text. The function (unnest) that I used converts an array to a list of rows. After all, we need to drop the column INTERESTS as well; it's already useless. I got everything back as in the beginning, but with minor changes, I corrected those changes by just dropping the removing null rows from the table. 