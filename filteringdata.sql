-- FILETERING DATA

-- WHERE , SELECT DISTINCT, AND , OR, IN , BETWEEN, LIKE , LIMIT, IS NULL 


-- WHERE 

CREATE TABLE employee ( 
emp_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20),
office_code INT,
job_role VARCHAR(20)
);

INSERT INTO employee( name, office_code, job_role) VALUES ( 'dilip', '2', 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'tamil', '1', 'marketing');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'prabhu', '2', 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'sarath', '3', 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'rajesh', '2', 'manager');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'dilip', '1', 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'ajith', '2', 'incharge');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'guru', '3', 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'guru', NULL, 'sales rep');
INSERT INTO employee( name, office_code, job_role) VALUES ( 'kesav', NULL, 'sales rep');

SELECT *
FROM employee
WHERE job_role = 'sales rep';

SELECT *
FROM employee
WHERE job_role = 'sale_rep' OR  office_code = 2;

SELECT * 
FROM employee 
WHERE emp_id BETWEEN 1 AND 4;

SELECT *
FROM employee
WHERE emp_id BETWEEN 1 AND 4 
ORDER BY office_code ;

SELECT * 
FROM employee 
WHERE name LIKE '%lip' ;

SELECT * 
FROM employee
WHERE name LIKE '%ru' ;


SELECT * 
FROM employee 
WHERE office_code IS NULL;

SELECT *
FROM employee
WHERE office_code IS  NOT NULL
ORDER BY office_code ;

SELECT * 
FROM employee
WHERE 
job_role !=  'sales rep' ;

SELECT * 
FROM employee
WHERE emp_id >= 6 
ORDER BY emp_id DESC;

SELECT * 
FROM employee
WHERE emp_id < 3;

SELECT *
FROM employee 
WHERE office_code IN (2,3);

SELECT *
FROM employee
WHERE name IN ( 'dilip', 'guru');

-- SELECT DISTINCT

CREATE TABLE emp (
emp_no INT AUTO_INCREMENT PRIMARY KEY ,
fname VARCHAR(20),
lname VARCHAR (20),
city VARCHAR(20),
state VARCHAR(20));

INSERT INTO emp(fname , lname, city , state) VALUES ( 'kanmani', 'selvam', 'chennai', 'tamilnadu');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'vijay', 'kumar', 'chennai', 'tamilnadu');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'raja', 'rajan', 'bangalore', 'karnataka');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'vandhana', 'krishnamurthy', 'pune', 'maharashtra');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'muthu', 'selvam', 'hydrabad', 'andra');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'kanmani', 'santhosh', 'mumbai', 'maharashtra');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'arya', 'krishnan', 'trivandram', 'kerala');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'mithali', 'raj', 'trivandram', 'kerala');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'smriti', 'mandana', NULL, 'kerala');
INSERT INTO emp(fname , lname, city , state) VALUES ( 'sarath', 'ganeshan', 'vellore', NULL);
INSERT INTO emp(fname , lname, city , state) VALUES ( 'smriti', 'mandana', NULL, 'gujarat');


SELECT lname
 FROM emp;

SELECT DISTINCT lname
 FROM emp ;
 
 SELECT DISTINCT state
 FROM emp ;
 
 SELECT lname, state 
 FROM emp 
 ORDER BY city ;
 
 SELECT DISTINCT state 
 FROM emp 
 ORDER BY state ;
 
 SELECT state
 FROM emp 
 GROUP BY state;
 
 SELECT COUNT( DISTINCT state)
FROM emp 
WHERE lname = 'selvam' ;

SELECT COUNT(state) 
FROM emp ;

SELECT DISTINCT state 
FROM  emp 
WHERE  state IS NOT NULL ;

-- AND OPERATOR

SELECT * 
FROM emp 
WHERE city = 'trivandram' AND state ='kerala';

SELECT * 
FROM emp 
WHERE lname = 'selvam' AND city = 'chennai';

SELECT * 
FROM emp
WHERE fname = 'arya' AND lname = 'krishnan';

-- OR OPERATOR

SELECT * 
FROM  emp 
WHERE fname = 'muthu' OR state = 'tamilnadu' ;

SELECT * 
FROM emp
WHERE emp_no = 5 OR state = 'kerala';

SELECT * 
FROM emp 
WHERE fname = 'mithali' OR state = 'maharashtra'
AND emp_no > 5;


SELECT * 
FROM emp 
WHERE fname = 'sarath' OR city = 'chennai';
 
 SELECT * 
FROM emp 
WHERE fname = 'sarath' OR city = 'chennai'
AND emp_no > 3 ;

-- IN OPERATOR

SELECT * 
FROM emp 
WHERE state IN ( 'kerala', 'tamilnadu');

SELECT * 
FROM emp
WHERE fname IN ( 'mithali', 'arya', 'sarath');

SELECT * 
FROM emp 
WHERE state  NOT IN ( 'tamilnadu', 'kerala'); 

SELECT * 
FROM emp 
WHERE lname NOT IN ('selvam')
AND emp_no > 8;

-- BETWEEN OPERTOR

CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(25),
location VARCHAR(25)
);


INSERT INTO customer(name, location)VALUES ('ram', 'chennai');
INSERT INTO customer(name, location)VALUES ('abi', 'krishnagir');
INSERT INTO customer(name, location)VALUES ('subbu', 'vellore');
INSERT INTO customer(name, location)VALUES ('kanamni', 'karaikkal');
INSERT INTO customer(name, location)VALUES ('muthu', 'chennai');
INSERT INTO customer(name, location)VALUES ('babu', 'bargur');
INSERT INTO customer(name, location)VALUES ('krithika', 'covai');
INSERT INTO customer(name, location)VALUES ('rasathi', 'covai');
INSERT INTO customer(name, location)VALUES ('priya', NULL);
INSERT INTO customer(name, location)VALUES (NULL, 'madurai');
INSERT INTO customer(name, location)VALUES ('swetha', NULL);



CREATE TABLE order_details(
order_number INT,
order_quantity INT ,
price_each INT 
);

INSERT INTO order_details VALUES (100, 5, 1500);
INSERT INTO order_details VALUES (102, 1, 300);
INSERT INTO order_details VALUES (103, 4, 350);
INSERT INTO order_details VALUES (104, 3, 700);
INSERT INTO order_details VALUES (105, 2, 600);
INSERT INTO order_details VALUES (106, 1, 660);
INSERT INTO order_details VALUES (107, 7, 150);
INSERT INTO order_details VALUES (108, 8, 120);


SELECT * 
FROM order_details 
WHERE price_each BETWEEN 600 AND 1500
ORDER BY price_each; 

SELECT * 
FROM customer 
WHERE customer_id BETWEEN 5 AND 10 ;

SELECT *
FROM order_details
WHERE price_each NOT BETWEEN 700 AND 2200
ORDER BY price_each;

SELECT * 
FROM customer
WHERE customer_id NOT BETWEEN 3 AND 6;


USE tutorial;
-- LIKE 

SELECT * 
FROM customer
WHERE name NOT LIKE '%i' ;

SELECT * 
FROM customer 
WHERE location LIKE '%ai'

SELECT *
FROM emp
WHERE fname LIKE '%a';

-- SELECT * 
FROM emp
WHERE city LIKE 'che%' ;

SELECT * 
FROM order_details
WHERE price_each LIKE '12_' ;

SELECT *
FROM order_details
WHERE price_each NOT LIKE '7__' ;

SELECT * 
FROM order_details 
WHERE price_each LIKE '__00' ;

SELECT * 
FROM order_details 
WHERE price_each LIKE '_00' ;


-- LIMIT

SELECT  lname , city , emp_no
FROM emp 
LIMIT 5;

SELECT * 
FROM order_details
WHERE price_each > 900
LIMIT 2 


SELECT location 
FROM customer 
WHERE customer_id < 5
ORDER BY location
LIMIT 2;

SELECT * 
FROM customer
LIMIT 6;

SELECT price_each 
FROM order_details
ORDER BY price_each
LIMIT 5;

SELECT name , location 
FROM customer
LIMIT 1,1;

SELECT name , location 
FROM customer
WHERE location IS NULL ;

SELECT *
FROM customer
WHERE name IS NULL;

SELECT * 
FROM emp
WHERE city IS NULL;

SELECT * 
FROM emp 
WHERE city IS NOT NULL;

SELECT * 
FROM customer
WHERE location IS NOT NULL;

SELECT * 
FROM emp
WHERE state  IS NOT NULL;


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

DROP TABLE employees;
DROP TABLE department;
INSERT INTO department VALUES (10, 'sales', 'mumbai');
INSERT INTO department VALUES (20, 'marketing', 'bangalore');
INSERT INTO department VALUES (30, 'finance', 'chennai');


INSERT INTO employees VALUES (1,'nikhil', 10, 120000,30000, 'manager',NULL, 'm');
INSERT INTO employees VALUES (2,'nitin', 10, 80000,15000, 'manager',NULL, 'm');
INSERT INTO employees VALUES (3,'neha', 20, 50000,NULL, 'programmer',1, 'f');
INSERT INTO employees VALUES (4,'vaibhav', 20, 15000,3000, 'frontdeskoperator',1, 'm');
INSERT INTO employees VALUES (5,'salman', 30, 5000,1000, 'assistant',1, 'm');
INSERT INTO employees VALUES (6,'jayant', 20, 25000,9000, 'programmer',1, 'm');
INSERT INTO employees VALUES (7,'sharuk', 30, 4000,500, 'assistant',2, 'm');
INSERT INTO employees VALUES (8,'kiran', 20, 10000, 1500, 'analyst',3, 'm');
INSERT INTO employees VALUES (9,'sonali', 20, 40000,3500, 'developer',2, 'f');
INSERT INTO employees VALUES (10,'surabhi', 20, 35000,3000, 'developer',2, 'f');

SELECT ename , designation 
FROM employees
WHERE designation = 'manager' OR designation = 'developer';

SELECT ename , designation 
FROM employees 
WHERE designation IN ( 'manager', 'developer');

SELECT ename , dept_id 
FROM employees
WHERE dept_id IN ( 10,20);

SELECT ename , dept_id 
FROM employees
WHERE dept_id = 10 OR dept_id = 20;

SELECT ename , dept_id , salary 
FROM employees
WHERE dept_id IN (10, 20) 
AND salary > 30000;

-- BETWEEEN

SELECT ename , salary 
FROM employees
WHERE salary >= 40000 AND salary <= 90000 ;

SELECT * FROM employees ;

SELECT ename , salary 
FROM employees
WHERE salary BETWEEN 40000 AND 90000;


SELECT ename , commission , dept_id
FROM employees
WHERE commission BETWEEN 1000 AND 16000;

SELECT ename , commission , dept_id
FROM employees
WHERE commission BETWEEN 1000 AND 16000
AND dept_id = 30 ;

-- LIKE 

SELECT ename 
FROM employees
WHERE ename LIKE 'n%' ;

SELECT ename 
FROM employees 
WHERE ename LIKE '%a' ;

SELECT ename 
FROM employees 
WHERE ename LIKE '%a%' ;

SELECT ename 
FROM employees
WHERE ename LIKE '%a%a%' ;

SELECT ename 
FROM employees
WHERE ename LIKE '_____';

SELECT ename 
FROM employees 
WHERE ename LIKE '_i%';

SELECT ename , designation 
FROM employees
WHERE(designation = 'manager' OR designation = 'developer')
AND( ename LIKE 'n%' OR ename LIKE 's%' );

SELECT ename , designation 
FROM employees
WHERE designation IN ('manager', 'developer')
AND (ename LIKE 'n%' OR ename LIKE 's%' );
