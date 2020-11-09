-- CASE STATEMENT 


-- 1) ADD OR EVEN 

SET @number = 20 ;

SELECT CASE (@number%2)
    WHEN 0 THEN 'even'
    WHEN 1 THEN 'odd'
END;

SET @number = 21;



-- 2) fifty or zero 

SET @number = 10;

SELECT CASE ( @number * 5)
 WHEN 50 THEN 'number is fifty'
 WHEN 0 THEN 'number is zero'
 END ;

SET @number = 0;


--  century or half century 

SET @number = 50;

SELECT CASE(@number*2)
WHEN 100 THEN 'century '
WHEN 50 THEN 'half century '
END ;

SET @number = 25;





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


--  WRITE A QUERY TO conditionally increment salary employees
-- when manager salary + 2000
-- when developer salary + 1000
-- others remains same salary

SELECT ename ,salary ,  designation ,
    CASE( designation)
    WHEN  'manager' THEN salary+2000
    WHEN 'developer' THEN salary+1000
    ELSE salary 
    END AS netsalary 
FROM employees ;

SELECT * FROM employees;

-- 2) prefix every name in the employees table with mr or mrs depending on the gender of the employee

SELECT  ename , gender, 
    CASE(gender)
    WHEN 'm' THEN  CONCAT('mr. ', ename )
    WHEN 'f' THEN  CONCAT('ms. ',ename)
    ELSE 'not decided'
    END as salutation 
FROM employees ; 

-- TO KNOW THE NAME OF THE MANGER FOR EVERY EMPLOYEE

SELECT  ename , mgrid, 
    CASE(mgrid)
    WHEN '1' THEN 'manager is nikhil'
    WHEN '2' THEN 'manger is nitin'
    ELSE 'you are the manger'
    END as mangername  
FROM employees ; 


-- TO KNOW THE NAME OF THE DEPARTMENT  FOR EVERY EMPLOYEE

SELECT  ename , dept_id, 
    CASE(dept_id)
    WHEN 10 THEN 'sales'
    WHEN 20 THEN 'marketing'
    WHEN 30  THEN 'finace'
    ELSE 'chill bro'
    END as departmentname  
FROM employees  ; 

SELECT * FROM department ;

-- TO KNOW LOCATION OF THE EMPLOYEE

SELECT ename , dept_id ,
    CASE(dept_id)
    WHEN 10 THEN 'Mumbai'
    WHEN 20 THEN 'Bangalore' 
    WHEN 30 THEN 'Chennai'
    END AS joblocation
    
FROM employees ;