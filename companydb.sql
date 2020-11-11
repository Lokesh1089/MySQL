drop table employee;
drop table branch;
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
 first_name VARCHAR(15) , 
 last_name VARCHAR(15), 
 birth_date DATE ,
 sex VARCHAR(1), 
 salary INT, 
 super_id INT, 
 branch_id INT 
); 
SET foreign_key_checks = 1;
 CREATE TABLE branch (
 branch_id INT PRIMARY KEY,
 branch_name VARCHAR(40),
 mgr_id INT ,
 mgr_start_date DATE ,
 FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
 );
 
ALTER TABLE employee 
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id) 
REFERENCES employee(emp_id) ON DELETE SET NULL;

CREATE TABLE client (
client_id INT PRIMARY KEY,
client_name VARCHAR(20),
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL 
);

CREATE TABLE works_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY (emp_id, client_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id ) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(30),
supply_type VARCHAR(30),
PRIMARY KEY (branch_id, supplier_name),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

INSERT INTO employee VALUES(100, 'ram', 'kumar', '1993-08-22', 'M', 28000, NULL, NULL);
INSERT INTO branch VALUES (1, 'corporate', 100, '2000-08-11');
UPDATE employee
SET branch_id = 1 
WHERE emp_id = 100;
INSERT INTO employee VALUES(101, 'janaki', 'murugan', '1997-01-08', 'F', 32000, 100,1);

INSERT INTO employee VALUES(102, 'manick', 'vinayagam', '1989-11-18', 'M', 45000, 100, NULL);
INSERT INTO branch VALUES (2, 'scranton',102,'2001-08-06');
UPDATE employee
SET branch_id = 2 WHERE emp_id = 102;
INSERT INTO employee VALUES(103, 'anandhi', 'ragul', '1993-09-08', 'F', 27000, 102, 2);
INSERT INTO employee VALUES(104, 'kavi', 'murali', '1995-04-13', 'F', 29000, 102, 2);
INSERT INTO employee VALUES(105, 'saravanan', 'kannan', '1997-12-09', 'M', 41000, 102,2);

INSERT INTO employee VALUES (106, 'Jagan', 'kumar', '1999-07-01', 'M', 33000, 100, NULL);
INSERT INTO branch VALUES (3,'stanford',106,'2009-08-11');
UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES (107, 'arun', 'kumar', '1999-07-03', 'M', 39000,106, 3);
INSERT INTO employee VALUES (108, 'Jagan', 'krishnan', '1997-02-27', 'M', 43000, 106, 3);

INSERT INTO branch_supplier VALUE (1, 'hammer mill', 'paper');
INSERT INTO branch_supplier VALUES (2, 'uni-ball', 'writing utensils');
INSERT INTO branch_supplier VALUES (3, 'patriot paper', 'paper');
INSERT INTO branch_supplier VALUES (2, 'j.t. forms & labels', 'customer forms');
INSERT INTO branch_supplier VALUES (3, 'uni-ball', 'writing utensils');
INSERT INTO branch_supplier VALUES (3, 'Hammmer mills', 'paper');
INSERT INTO branch_supplier VALUES (3, 'stamford labels', 'customer forms');

INSERT INTO client VALUES (400, 'vetri high school',2);
INSERT INTO client VALUES (401, 'jai hind',2);
INSERT INTO client VALUES (402, 'professional courier',3);
INSERT INTO client VALUES (403, 'thiru law, LLC',3);
INSERT INTO client VALUES (404, 'suresh whitepages',2);
INSERT INTO client VALUES (405, 'The hindu',3);
INSERT INTO client VALUES (405, 'professiona courier',2);

INSERT INTO works_with VALUES (105,400,60000);
INSERT INTO works_with VALUES (102,401,293000);
INSERT INTO works_with VALUES (108,402,28500);
INSERT INTO works_with VALUES (107,403,55000);
INSERT INTO works_with VALUES (108,403,78000);
INSERT INTO works_with VALUES (105,404,15000);
INSERT INTO works_with VALUES (107,405,60080);
INSERT INTO works_with VALUES (102,406,21010);
INSERT INTO works_with VALUES (105,406,120000);

SELECT * FROM  works_with;

SELECT * FROM employee
ORDER BY salary DESC ;

SELECT * FROM employee
ORDER BY sex, first_name, last_name 
LIMIT 4;

SELECT first_name AS forename , last_name AS surname
 FROM employee;

SELECT DISTINCT sex FROM employee;

-- functions

SELECT COUNT(emp_id) FROM employee;
SELECT COUNT(super_id) FROM employee;
SELECT COUNT(emp_id),  FROM employee 
WHERE sex = 'F' AND salary > 25000;

SELECT AVG(salary) FROM employee 
WHERE sex = 'M';

SELECT SUM(salary) FROM employee ;

SELECT COUNT(sex), sex 
FROM employee  GROUP BY sex;

SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

-- wild cards

SELECT * FROM client WHERE client_name LIKE '%r';
SELECT * FROM employee WHERE first_name LIKE '%jagan%';

SELECT * FROM employee WHERE birth_date LIKE '____-09%__';

-- UNIONS

SELECT first_name FROM employee 
UNION
SELECT branch_name
FROM branch ;

SELECT first_name as staffs, last_name AS workers
 FROM employee 
UNION
SELECT branch_name, branch_id
FROM branch ;

SELECT client_name , branch_id
FROM client
UNION
SELECT supplier_name , branch_id
FROM branch_supplier;

-- JOINS
 
 INSERT INTO branch VALUES (4,'namakkal', NULL, NULL);  
 UPDATE branch
 SET branch_name = 'chennai'
 WHERE branch_id = 4;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch 
ON employee.emp_id = branch.mgr_id;

SELECT emp_id, first_name, branch_name
FROM employee
LEFT JOIN branch 
ON emp_id = mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch 
ON employee.emp_id = branch.mgr_id;

-- NESTED QUERIES

SELECT client.client_name 
FROM client
WHERE client.branch_id = (
 SELECT branch.branch_id
 FROM branch
 WHERE branch.mgr_id = 102
);

SELECT branch_supplier.supply_type
FROM branch_supplier
WHERE branch_id =(
SELECT branch.branch_id
FROM branch
WHERE mgr_id = 102);


-- ON DELETE

DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM branch_supplier;

DELETE FROM branch
WHERE branch_id = 3;

-- VIEW 

CREATE VIEW works
AS SELECT first_name, last_name, branch_name
FROM employee , branch
WHERE emp_id = mgr_id;

DROP VIEW works; 

-- TRIGGERS

CREATE TABLE trigger_test(
message VARCHAR(100)
);
DESCRIBE TABLE trigger_test ;

DELIMITER //
CREATE TRIGGER my_trigger BEFORE INSERT
    ON  employee 
    FOR EACH ROW  BEGIN 
    INSERT INTO trigger_test VALUES('added new');
    END//

DELIMITER ;  









 




