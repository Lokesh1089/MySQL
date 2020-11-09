
-- GROUPING DATA 
-- GROUP BY, HAVING , ROLL UP

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
SELECT * FROM emp ;
SELECT fname, state, emp_no, city
FROM emp 
GROUP BY city ;

SELECT city, COUNT(*), state
FROM emp 
GROUP BY state ;

SELECT fname , city , COUNT(*)
FROM emp 
GROUP BY city
ORDER BY count(*) DESC;

SELECT fname, lname , count(*)
FROM emp 
GROUP BY lname
order by lname DESC;

SELECT fname , emp_no, COUNT(*)
FROM emp
GROUP BY fname;

 -- HAVING 
 
 
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
INSERT INTO customer(name, location)VALUES ('muthu', NULL);
INSERT INTO customer(name, location)VALUES ('vinoth', NULL);
INSERT INTO customer(name, location)VALUES ('hardik' , NULL);
INSERT INTO customer(name, location)VALUES (NULL, NULL);
SET foreign_key_checks = 1;

CREATE TABLE orders (
order_number INT PRIMARY KEY ,
order_quantity INT , 
price INT ,
customer_id INT ,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL
);

INSERT INTO orders(order_number, order_quantity , price, customer_id) VALUES (100, 5, 1250, 3);
INSERT INTO orders(order_number, order_quantity , price,customer_id)VALUES (102, 1, 300,1);
INSERT INTO orders(order_number, order_quantity , price, customer_id) VALUES (103, 4, 350,2);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (104, 3, 700,1);
INSERT INTO orders(order_number, order_quantity , price, customer_id) VALUES (105, 2, 600,7);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (106, 1, 660,7);
INSERT INTO orders(order_number, order_quantity , price, customer_id) VALUES (107, 7, 150, 4);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (108, 8, 120,8);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (109, 8, 120,NULL);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (110, 8, 120,5);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (111, 8, 120, NULL);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (112, NULL, NULL, NULL);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (113, NULL, NULL, NULL);
INSERT INTO orders (order_number, order_quantity , price, customer_id)VALUES (114, NULL, NULL, NULL);

SELECT * FROM orders;
SELECT name , location
FROM customer
HAVING location = 'covai';

SELECT order_number, price
FROM orders
HAVING price > 500;

SELECT order_number, price
FROM orders
HAVING order_number > 105
ORDER BY order_number DESC;

SELECT * 
FROM customer
HAVING location IS NULL
ORDER BY name;

SELECT * 
FROM customer
HAVING location IS NOT NULL 
order by location ;

SELECT * 
FROM saleR
HAVING total_sales > 90000 ;

SELECT * 
FROM saleR
HAVING clIent_id = 402;

SELECT * 
FROM saleR;

SELECT * 
FROM sales 
HAVING saleYear >= 2014;


-- ROLL UP

SELECT orders.order_number , orders.order_quantity, SUM(orders.order_quantity*orders.price)
FROM orders
GROUP BY order_quantity
WITH ROLLUP;

SELECT orders.order_number , orders.order_quantity, SUM(orders.order_quantity*orders.price)
FROM orders
GROUP BY orders.customer_id
WITH ROLLUP;

DROP TABLE sales;
CREATE TABLE sales(
id INT PRIMARY KEY AUTO_INCREMENT , 
product VARCHAR(25),
price INT,
saleYear YEAR );

INSERT INTO sales(product , price, saleYear) VALUES ('car', 25000, 2014);
INSERT INTO sales(product , price, saleYear) VALUES ('bike', 15000, 2014);
INSERT INTO sales(product , price, saleYear) VALUES ('van', 80000, 2014);
INSERT INTO sales(product , price, saleYear) VALUES ('car', 45000, 2014);
INSERT INTO sales(product , price, saleYear) VALUES ('car', 25000, 2013);
INSERT INTO sales(product , price, saleYear) VALUES ('bike', 18000, 2012);
INSERT INTO sales(product , price, saleYear) VALUES ('van', 65000, 2013);
INSERT INTO sales(product , price, saleYear) VALUES ('van', 95000, 2012);
INSERT INTO sales(product , price, saleYear) VALUES ('car', 30000, 2012);
INSERT INTO sales(product , price, saleYear) VALUES ('bike', 13000, 2015);
INSERT INTO sales(product , price, saleYear) VALUES ('car', 50000, 2017);

SELECT product, saleYear, SUM(price)
FROM sales
GROUP  BY   product,saleYear
WITH ROLLUP;

SELECT product, saleYear, SUM(price)
FROM sales
GROUP  BY saleYear
WITH ROLLUP;

SELECT product, SUM(price)
FROM sales
GROUP  BY   product
WITH ROLLUP;




CREATE TABLE saleR(
emp_id INT ,
client_id INT,
total_sales INT);

INSERT INTO saleR VALUES (105,400,60000);
INSERT INTO saleR VALUES (102,401,293000);
INSERT INTO saleR VALUES (108,402,28500);
INSERT INTO saleR VALUES (107,403,55000);
INSERT INTO saleR VALUES (108,403,78000);
INSERT INTO saleR VALUES (105,404,15000);
INSERT INTO saleR VALUES (107,405,60080);
INSERT INTO saleR VALUES (102,406,21010);
INSERT INTO saleR VALUES (105,406,120000);

SELECT emp_id , client_id, SUM(total_sales)
FROM saleR 
GROUP BY emp_id, client_id
WITH ROLLUP;

SELECT emp_id , SUM(total_sales)
FROM saleR 
GROUP BY emp_id
WITH ROLLUP;

SELECT client_id , SUM(total_sales)
FROM saleR 
GROUP BY client_id 
WITH ROLLUP ;
