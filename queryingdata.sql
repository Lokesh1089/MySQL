-- QUERYING DATA 
-- SELECT


CREATE DATABASE tutorial;
USE tutorial ;
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


SELECT name , location
FROM customer
ORDER BY location;

SELECT name , location
FROM customer
ORDER BY name DESC ;

SELECT name , location 
FROM customer 
ORDER BY location DESC;


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


SELECT * FROM order_details;

SELECT order_number, order_quantity , order_quantity*price_each AS sub_total
FROM order_details
ORDER BY sub_total;

SELECT order_number, order_quantity , order_quantity*price_each AS sub_total
FROM order_details
ORDER BY sub_total DESC;

SELECT * FROM order_details;

SELECT order_number, order_quantity , order_quantity*price_each
FROM order_details
ORDER BY order_quantity;


CREATE TABLE movie_list ( m_id INT AUTO_INCREMENT,        
name VARCHAR (50), 
director VARCHAR(20), 
price INT,
PRIMARY KEY( m_id)
);
DROP TABLE sale ;
CREATE TABLE cutomer(
 cus_id INT AUTO_INCREMENT,
 name VARCHAR(20),
 location VARCHAR(20),
 PRIMARY  KEY (cus_id)
);
CREATE TABLE sale (
bill_no INT AUTO_INCREMENT,
m_id INT , cus_id INT , price INT ,
PRIMARY KEY ( bill_no)
);

SHOW TABLES ;

RENAME TABLE me.cutomer to me.customer;

ALTER TABLE sale
ADD FOREIGN KEY (m_id) REFERENCES movie_list(m_id);

ALTER TABLE sale
ADD FOREIGN KEY (cus_id) REFERENCES customer(cus_id);

INSERT INTO movie_list (name , director, price) VALUES ('varanam aayiram' , 'gowtham ', 500);
INSERT INTO movie_list (name , director, price) VALUES ('kaththi' , 'ar murugadoss ', 600);
INSERT INTO movie_list (name , director, price) VALUES ('minnale' , 'gowtham ', 400);
INSERT INTO movie_list (name , director, price) VALUES ('theri' , 'atlee', 300);
INSERT INTO movie_list (name , director, price) VALUES ('thuppakki' , 'ar murugadoss ', 900);
INSERT INTO movie_list (name , director, price) VALUES ('raja raani' , 'atlee ', 400);
INSERT INTO movie_list (name , director, price) VALUES ('vivegam' , ' siva ', 350);
INSERT INTO movie_list (name , director, price) VALUES ('mankatha' , 'venkat prabhu ', 890);
INSERT INTO movie_list (name , director, price) VALUES ('asuran' , 'NULL', 890);
INSERT INTO movie_list (name , director, price) VALUES ('ohmykadavule' , 'venkat prabhu ', NULL);
SELECT * FROM movie_list ;

INSERT INTO customer (name, location) VALUES ('vikram', 'tirupattur');
INSERT INTO customer (name, location) VALUES ('ram', 'vaniyambadi');
INSERT INTO customer (name, location) VALUES ('prabhu', 'chennai');
INSERT INTO customer (name, location) VALUES ('tamil', 'tirupattur');
INSERT INTO customer (name, location) VALUES ('krish', 'chennai');
INSERT INTO customer (name, location) VALUES ('mathew', 'hosur');

INSERT INTO customer (name, location) VALUES (NULL, 'hosur');
INSERT INTO customer (name, location) VALUES ('mathew', NULL);
INSERT INTO customer (name, location) VALUES ('muthu', 'krishnagiri');

SELECT * FROM SALE;

INSERT INTO sale(m_id, cus_id, price ) VALUES  (3,5,400);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (4,1,300);
INSERT INTO sale (m_id, cus_id, price ) VALUES  (7,6,350);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (6,8,400);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (2,2,350);


SELECT name, director FROM movie_list
GROUP BY director ;

SELECT name, price FROM movie_list 
ORDER BY price
);


SELECT name, location
FROM customer
WHERE location = 'tirupattur'; 

SELECT cus_id  , m_id, price
FROM sale
WHERE m_id = 1 OR price =400;

SELECT name, price
FROM movie_list
WHERE  price > 500
ORDER BY price;

SELECT name, director, price, m_id
FROM movie_list
WHERE m_id BETWEEN 3 AND 8
ORDER BY price ;

SELECT director, name FROM movie_list WHERE name LIKE '%i';

SELECT name, price 
FROM movie_list
WHERE price IN (400, 500,300)
ORDER BY price;

SELECT name , m_id
FROM movie_list
WHERE price IS NULL ;

SELECT name , m_id, price
FROM movie_list 
WHERE price <> 400;

SELECT DISTINCT location 
FROM customer;

SELECT location FROM customer;

SELECT location, name
FROM customer 
WHERE location = 'hosur' ; 
use me;

SELECT * 
FROM customer 
WHERE name IN ('vikram', 'prabhu', 'ram') AND cus_id > 2;


CREATE TABLE sshospital(
 patient_id INT AUTO_INCREMENT , name VARCHAR(20) NOT NULL, age INT , gender VARCHAR(7), contact_no INT UNIQUE,
 PRIMARY KEY(patient_id)
);
DROP TABLE sshospital;
DESCRIBE sshospital;
SELECT * FROM sshospital ;
ALTER TABLE sshospital ADD doctor VARCHAR(20);

INSERT INTO sshospital (name, age, gender, contact_no, doctor ) VALUES  ('kumar', 39, 'male', 968554055, 'dr iniyan');
INSERT INTO sshospital (name, age, gender, contact_no, doctor ) VALUES  ('janani', 27, 'female', 978985503, 'dr divya');
INSERT INTO sshospital (name, age, gender, contact_no, doctor ) VALUES  ('muthu', 48, 'male', 785613297, 'dr david');
INSERT INTO sshospital (name, age, gender, contact_no, doctor ) VALUES  ('ram', 23, 'male', 895272525, 'dr priya');
INSERT INTO sshospital (name, age, gender, contact_no, doctor ) VALUES  ('kaavya', 35, 'female', 98632147, 'dr iniyan');

SET SQL_SAFE_UPDATES= 0;
UPDATE sshospital
SET age = 45
WHERE age = 48;

DELETE FROM sshospital 
WHERE name = 'ram';

UPDATE sshospital
SET name = 'murali'
WHERE name = 'muthu';

SELECT name , age FROM sshospital;
SELECT doctor, name, age  FROM  sshospital
ORDER BY age, name ; 
SELECT sshospital.name, sshospital.doctor FROM sshospital
ORDER BY name LIMIT 2 ;

SELECT doctor FROM sshospital 
WHERE doctor = 'dr iniyan';

SELECT * FROM sshospital
WHERE age < 40 OR name= 'ram';

SELECT * FROM sshospital
WHERE name IN ('kaavya', 'kumar','murali');

SELECT name, age FROM sshospital 
WHERE age IN (27,35,39);


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

-- SELECT , WHERE 

SELECT ename, salary , salary*12 AS yearlysalary
FROM employees;

SELECT salary, commission, salary+commission AS totalSalary
FROM employees;

SELECT ename FROM employees
WHERE dept_id = 10;

SELECT ename
FROM employees 
WHERE dept_id = 20;

SELECT ename
FROM employees 
WHERE dept_id = 30;

SELECT ename , salary , dept_id 
FROM employees
WHERE dept_id = 20 AND salary > 30000;

SELECT ename
FROM employees
WHERE dept_id = 10 AND salary < 90000;

SELECT ename , salary, dept_id, gender
FROM employees
WHERE dept_id = 20 AND salary >= 40000 AND gender = 'f' ;

SELECT ename , dept_id
FROM employees 
WHERE dept_id = 10 OR dept_id = 20;

SELECT ename , dept_id , salary 
FROM employees 
WHERE (dept_id = 10 OR dept_id = 20 )
AND salary > 40000;



