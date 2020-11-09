
-- DATE FUNCTION


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

ALTER TABLE employees ADD COLUMN hireddate DATE 
INSERT INTO department VALUES (10, 'sales', 'mumbai');
INSERT INTO department VALUES (20, 'marketing', 'bangalore');
INSERT INTO department VALUES (30, 'finance', 'chennai');

SELECT current_date();

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



SELECT TIMESTAMPDIFF(month, '2019-08-24', '2020-07-14');

SELECT timestampdiff(YEAR , '2013-09-01', '2016-07-06');

SELECT timestampdiff(DAY, '2019-05-09', '2020-09-06');

-- write a query to empute salary of all employees which is 10% of current salary
  --  if the employee has worked more than one year

SELECT * FROM employees ;

SELECT ename , salary , hireddate, timestampdiff(year , hireddate, curdate()),
IF (timestampdiff(year , hireddate, curdate()) > 1 , salary+salary*.10 , salary ) AS newsalary
FROM employees;

SELECT quarter(curdate());


-- to find in which quarter all the employees are hired


SELECT ename, hireddate , quarter(hireddate)
FROM employees;

SELECT ename, hireddate , CASE
WHEN quarter(hireddate) = 1 THEN '1st quarter'
WHEN quarter(hireddate) = 2 THEN '2nd quarter'
WHEN quarter(hireddate) = 3 THEN '3rd quarter'
WHEN quarter(hireddate) = 4 THEN '4th quarter'
END AS quarterofhired
FROM employees;

-- find whether current day i sweek or weeekend

SELECT CASE(dayname(curdate())) 
WHEN  'SUNDAY' THEN 'WEEK END' 
WHEN 'SATURDAY' THEN 'WEEK END' 
ELSE 'WEEKDAY'
END AS daydetails;


-- WRITE A QUERY TO FIND name of all employees who hired in the month which sonali was hired
SELECT ename
FROM employees 
WHERE extract(month from hireddate ) = 
(SELECT extract(month from hireddate)
FROM  employees
WHERE ename = 'sonali');

SELECT ename
FROM employees 
WHERE extract(month from hireddate ) <> 
(SELECT extract(month from hireddate)
FROM  employees
WHERE ename = 'sonali');

SELECT extract(month from curdate());
SELECT extract(year from curdate());
SELECT extract(day from curdate());

SELECT str_to_date('04-09-2020', '%m-%d-%Y');

SELECT str_to_date('2020-01-27', '%Y-%m-%d');

SELECT str_to_date('31-08-2019', '%d-%m-%Y');

SELECT str_to_date('27-04-17', '%d-%m-%y');

SELECT str_to_date('05-07-31', '%m,%y,%d');