-- JOINS 

  -- INNER JOIN
  -- LEFT JOIN
  -- RIGHT JOIN 
  -- CROSS JOIN
  
  
CREATE TABLE members(
member_id INT AUTO_INCREMENT,
name VARCHAR(25),
PRIMARY KEY (member_id)
);

CREATE TABLE committees(
committe_id INT AUTO_INCREMENT,
name VARCHAR(25),
PRIMARY KEY (committe_id)
);

DROP TABLE committees;
INSERT INTO members(name) VALUES ('john'), ('jane'), ('mary'),('david'), ('amelia');
INSERT INTO committees(name) VALUES ('john'), ('mary'), ('amelia'), ('joe');

SELECT * FROM members;
SELECT * FROM committees;

SELECT member_id , members.name , committe_id , committees.name 
FROM members
INNER JOIN committees USING(name) ;     

-- LEFT JOIN                                    ;

SELECT member_id , members.name,  committe_id, committees.name 
FROM members
LEFT JOIN committees USING (name);

SELECT member_id, members.name , committe_id, committees.name 
FROM members
LEFT JOIN committees USING (name) 
WHERE committe_id IS NULL;

-- RIGHT JOIN

SELECT member_id, members.name , committe_id, committees.name 
FROM members
right JOIN  committees
 USING (name);      


SELECT member_id, members.name , committe_id, committees.name 
FROM members
right JOIN  committees
 USING (name) 
 WHERE member_id IS NULL;
 
 -- CROSS JOINS
 
 SELECT member_id, members.name, committe_id, committees.name 
 FROM members
 CROSS JOIN committees ;
 
 USE tutorial;
 
 CREATE TABLE customer(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    location VARCHAR(25)
    );
 
 DROP TABLE customer;

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


SELECT * FROM customer;
SELECT *  FROM orders;


SELECT customer.name , customer.customer_id, orders.customer_id, orders.price, orders.order_quantity, orders.order_quantity*orders.price AS total_amount
FROM customer 
JOIN orders
ON orders.customer_id = customer.customer_id;

SELECT customer.name , customer.customer_id, orders.customer_id, orders.price, orders.order_quantity, orders.order_quantity*orders.price AS total_amount
FROM customer 
LEFT JOIN orders
ON orders.customer_id = customer.customer_id;

SELECT customer.name , customer.customer_id, orders.customer_id, orders.price, orders.order_quantity, orders.order_quantity*orders.price AS total_amount
FROM customer 
RIGHT JOIN orders
ON orders.customer_id = customer.customer_id;

SELECT customer.name , customer.customer_id, orders.customer_id, orders.price, orders.order_quantity, orders.order_quantity*orders.price AS total_amount
FROM customer 
CROSS JOIN orders ;


SELECT customer.customer_id , order_quantity*price AS toatl_amount 
FROM customer
JOIN orders;

SELECT customer.customer_id, customer.name , orders.price
FROM customer
LEFT JOIN orders
ON orders.customer_id = customer.customer_id;

   SELECT customer.customer_id, customer.name , orders.order_number
    FROM customer
    RIGHT JOIN orders
    ON orders.customer_id = customer.customer_id
ORDER BY order_number ;

    SELECT customer.customer_id, customer.name , orders.order_number
    LEFT JOIN orders
    ON orders.customer_id = customer.customer_id;









 