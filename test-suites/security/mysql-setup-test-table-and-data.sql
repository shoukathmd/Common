CREATE TABLE 'mysqltestdb'.'mymycompany' 

( 
'ID' INT NOT NULL , 
'Name' VARCHAR(50) NOT NULL , 
'Age' INT NOT NULL , 
'Address' VARCHAR(50) NULL , 
'Salary' REAL NULL , 
'JoinDate' DATE NULL , 
PRIMARY KEY ('ID')
) 
ENGINE = InnoDB;

INSERT INTO 'mymycompany' ('ID', 'Name', 'Age', 'Address', 'Salary', 'JoinDate') VALUES ('1', 'Paul', '32', 'California', '2000.00', '2001-07-13');
INSERT INTO mycompany (ID,NAME,AGE,ADDRESS,JOINDATE) VALUES (2, 'Allen', 25, 'Texas', '2007-12-13');
INSERT INTO mycompany (ID,NAME,AGE,ADDRESS,SALARY,JOINDATE) VALUES (3, 'Teddy', 23, 'Norway', 20000.00, DEFAULT );
INSERT INTO mycompany (ID,NAME,AGE,ADDRESS,SALARY,JOINDATE) VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00, '2007-12-13' ), (5, 'David', 27, 'Texas', 85000.00, '2007-12-13');

SELECT * FROM mycompany;
