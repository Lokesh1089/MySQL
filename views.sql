-- VIEWS 

CREATE TABLE student(
student_id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20) DEFAULT 'undecided',
primary key(student_id)
);

INSERT INTO student(name, major) VALUES('saravanan', 'biology');
INSERT INTO student(name, major) VALUES('chiranjeevi', 'computer science');
INSERT INTO student(name, major) VALUES('naveen' , 'history');
INSERT INTO student(name, major) VALUES('manirathnam', 'chemistry');
INSERT INTO student(name, major) VALUES('Thiru', 'physics');

SELECT * FROM student;

CREATE  VIEW v1 AS SELECT * FROM student ;

SELECT * FROM v1;

CREATE VIEW v2 AS 
SELECT student_id , major 
FROM student ;

SELECT * FROM v2 ;

SELECT  major FROM v2 ;

SELECT student_id FROM v2 ;

SELECT name FROM  v1;

CREATE VIEW V3 AS SELECT major FROM student ;

SELECT * FROM v3 ;


DROP VIEW V3 ;

DROP VIEW V2 ;

DROP VIEW v1;



CREATE VIEW v1 AS SELECT * FROM student;

SELECT * FROM v1;

CREATE OR REPLACE VIEW v1 AS SELECT name, major FROM student ;


CREATE OR REPLACE VIEW v1 AS SELECT student_id , major FROM student;

SELECT * FROM v1 ;


CREATE TABLE employees (
eid INT PRIMARY KEY,
ename VARCHAR(25),
dept_id INT,
salary INT , 
commission INT, 
designation VARCHAR(25),
mgrid INT,
gender VARCHAR(2) );

CREATE TABLE department (
dept_id INT PRIMARY KEY,
dname VARCHAR(20),
city VARCHAR(20)
);  

ALTER TABLE employees 
ADD FOREIGN KEY (dept_id) REFERENCES department(dept_id);

ALTER TABLE employees
ADD FOREIGN KEY (mgrid) REFERENCES employees(eid); 

ALTER TABLE employees ADD COLUMN hireddate DATE ;

INSERT INTO department VALUES (10, 'sales', 'mumbai');
INSERT INTO department VALUES (20, 'marketing', 'bangalore');
INSERT INTO department VALUES (30, 'finance', 'chennai');

INSERT INTO employees VALUES (1,'nikhil', 10, 120000,30000, 'manager',NULL, 'm', '2017-08-13');
INSERT INTO employees VALUES (2,'nitin', 10, 80000,15000, 'manager',NULL, 'm', '2015-07-25');
INSERT INTO employees VALUES (3,'neha', 20, 50000,NULL, 'programmer',1, 'f', '2018-01-29');
INSERT INTO employees VALUES (4,'vaibhav', 20, 15000,3000, 'frontdeskoperator',1, 'm', '2016-03-26');
INSERT INTO employees VALUES (5,'salman', 30, 5000,1000, 'assistant',1, 'm', '2019-07-06');
INSERT INTO employees VALUES (6,'jayant', 20, 25000,9000, 'programmer',1, 'm','2020-06-17');
INSERT INTO employees VALUES (7,'sharuk', 30, 4000,500, 'assistant',2, 'm', '2018-01-09');
INSERT INTO employees VALUES (8,'kiran', 20, 10000, 1500, 'analyst',3, 'm',' 2020-09-01');
INSERT INTO employees VALUES (9,'sonali', 20, 40000,3500, 'developer',2, 'f','2018-06-25');
INSERT INTO employees VALUES (10,'surabhi', 20, 35000,3000, 'developer',2, 'f', '2016-06-07');


SELECT * FROM employees;


CREATE OR REPLACE VIEW v1 AS 
    SELECT ename , designation
    FROM employees ;
    
SELECT * FROM v1 ;

CREATE VIEW v2 AS
SELECT ename, dept_id
FROM employees 
WHERE dept_id = 20;    


SELECT * FROM v2 ;


CREATE VIEW v3 AS
SELECT ename , dept_id 
FROM employees 
WHERE dept_id = 10;

SELECT * FROM v3;

SELECT * FROM employees;

-- TO FIND LOCATION OF EVERY EMPLOYEE
-- 1)
SELECT ename, dept_id, CASE (dept_id)
WHEN 10 THEN 'from hydrabad'
WHEN 20 THEN  'from bangalore'
WHEN 30 THEN 'from chennai'
END AS location
FROM employees;

-- 2nd method

CREATE OR REPLACE VIEW v1 AS
SELECT ename as name , city as location  
FROM employees JOIN department 
ON employees.dept_id = department.dept_id ;

SELECT * FROM v1 ;


-- to find the working  location of neha

SELECT * FROM v1 
WHERE name = 'neha'; 

-- to find location of vibhav

SELECT * FROM v1 
WHERE name = 'vaibhav';

-- select employee name with their corresponding manger

SELECT e.ename, m.ename
FROM employees e JOIN employees m 
ON e.mgrid = m.eid ;

CREATE VIEW v4 AS 
SELECT e.ename AS employee , m.ename as manager
FROM employees e JOIN employees m 
ON e.mgrid = m.eid ;

SELECT * FROM v4;

-- find manager name of sonali

SELECT * 
FROM v4
WHERE employee = 'sonali';

SELECT e.ename ,  m.ename 
FROM employees e JOIN employees m
ON e.mgrid = m.eid
WHERE e.ename = 'sonali';

-- employees able to view only a data from their  respective department only not other department data

CREATE VIEW v10 AS 
SELECT * 
FROM employees
WHERE dept_id = 10;

SELECT * FROM V10;

CREATE VIEW v20 AS
SELECT *
FROM employees 
WHERE dept_id = 20;

SELECT * FROM v20;

CREATE VIEW V30 AS
SELECT *
FROM employees
WHERE dept_id = 30;

SELECT * FROM v30 ;


CREATE VIEW v5 AS
SELECT eid , ename, dept_id, designation, mgrid, gender
FROM employees;

SELECT * FROM V5;


  -- DEPARTMENT SUMAMRY 
  
SELECT d.dname , MAX(salary) AS maxsal , MIN(salary) minsal, AVG(salary) avgsal
FROM employees e JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dname ;

SELECT * FROM department ;

CREATE VIEW departsummary AS
SELECT d.dname , MAX(salary) AS maxsal , MIN(salary) minsal, AVG(salary) avgsal
FROM employees e JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dname ;

select *  from departsummary ;
-- which department getting maximum salary

SELECT dname, MAX(maxsal) FROM departsummary ;

SELECT * FROM departsummary
WHERE dname = 'finance';

SELECT * FROM departsummary
WHERE dname = 'marketing';


SELECT * FROM departsummary
WHERE dname = 'sales';

-- maximum avg salary 

SELECT dname ,  MAX(avgsal) FROM departsummary ;

-- without using  view to find which department getting  max average salry


SELECT d.dname, AVG(salary) as avgsalary
FROM employees e JOIN department d 
ON e.dept_id = d.dept_id 
GROUP BY d.dept_id 
ORDER BY avgsalary DESC
LIMIT 1;



-- UPDATABLE VIEWS 

DESC information_schema.views;

SELECT table_name , is_updatable, check_option
FROM information_schema.views
WHERE table_schema = 'jarvis';

CREATE TABLE park( 
pname VARCHAR(20),
age INT ,
location VARCHAR(25)
);

CREATE VIEW v1 AS
SELECT * FROM park ;

SELECT * FROM park ;

INSERT INTO park VALUES ('mukund', '25', 'karaikkal');

INSERT INTO v1 VALUES ('arun', 35, 'chennai ');
INSERT INTO v1 VALUES ('varun', 25, 'vandalur');
INSERT INTO v1 VALUES ('aravind', 18, 'ramnad');
INSERT INTO v1 VALUES ('pughal', 17, 'poonamalle');
INSERT INTO v1 VALUES ('deva', 35, 'theni');

SELECT * FROM v1 ;

CREATE VIEW v2 AS 
SELECT location , pname , age 
FROM park
WHERE age>25
GROUP BY location 
ORDER BY age ;



SELECT *  FROM v2;


-- not updatetable views 

UPDATE V2 SET pname = 'arun' 
WHERE age = 35;  

UPDATE V2 SET pname = 'vinay '
WHERE age = 35;  

-- updatetable views

UPDATE v1 SET pname = 'govindan'
WHERE location = 'chennai ';

SELECT COUNT(*) as totalperson
FROM V1;

CREATE VIEW V3 AS
SELECT COUNT(*) as totalperson
FROM V1;

SELECT * FROM V3;

-- WITH CHECK OPTION

CREATE VIEW v5 AS 
SELECT * FROM park WHERE age >25;

SELECT * FROM V5;

SELECT * FROM park ;

-- age related check option 


CREATE VIEW v6 AS 
SELECT * FROM park WHERE age > 18 WITH CHECK OPTION ;

INSERT INTO V6 VALUES  ( 'kannan', 14, 'ramnad' );  -- check option failed   
INSERT INTO V6 VALUES  ( 'jaddu', 17, 'ranchi' ); -- check opton failed 


INSERT INTO v6 VALUES ('kumaran', 22, 'krishangiri');
INSERT INTO V6 VALUES  ( 'selvan', 36, 'ambur' );

SELECT * FROM v6 ;

SELECT *  FROM park ;


-- CHECKING CORRECT MOB NUMBER FORMAT 

ALTER TABLE park ADD COLUMN mobno VARCHAR(20);

CREATE VIEW v11 AS
SELECT * FROM park WHERE mobno LIKE '91__________' WITH CHECK OPTION;

INSERT INTO V11 VALUES ('bhuvanesh', 25, 'covai', 919655090915);
INSERT INTO V11 VALUES ('ramya', 27, 'puduchery', 918953090915);
INSERT INTO V11 VALUES ('ragu', 21, 'covai', 129655090915); -- check option failed 
INSERT INTO V11 VALUES ('vidhya', 23, 'madurai', 123485754); -- check opton failed

SELECT * FROM V11;
SELECT * FROM park;

DESC information_schema.views;

SELECT table_name , is_updatable, check_option
FROM information_schema.views
WHERE table_schema = 'jarvis';