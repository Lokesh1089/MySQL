
-- DML COMMANDS

-- INSERT , UPDATE , DELETE

CREATE TABLE students(
sid INT, 
sname VARCHAR(25),
age INT,
sub VARCHAR(25)
);

INSERT INTO students VALUES (1, 'raja', 22, 'cs');

INSERT INTO students(sid, age , sname, sub) VALUES (2, 25, 'krithik', 'java' );

INSERT INTO students (sub, age, sname, sid) VALUES ('os', 27, 'divya',  3 );

INSERT INTO students VALUES (4, 'murali', 33, 'python');

INSERT INTO students VALUES (5, 'muthu', 12, 'java');

INSERT INTO students VALUES (6, 'krithik', 32, 'c++');

SELECT * FROM students;


SET  SQL_SAFE_UPDATES = 0;

UPDATE students 
SET age = 26
WHERE sid = 3 ;

UPDATE students
SET sname = 'raja' WHERE sid = 2;

UPDATE students 
SET age = 43
WHERE sname = 'muthu';

UPDATE students 
SET sub = 'golang'
WHERE sname = 'krithik';

DELETE FROM students
WHERE sname = 'raja'; 

DELETE FROM students
WHERE age = 33 ;

DELETE FROM students
WHERE sub= 'os';

DELETE FROM students 
WHERE sid = 6;

DELETE FROM students;

CREATE TABLE student(
student_id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20) DEFAULT 'undecided',
primary key(student_id)
);

DROP TABLE student;
DESCRIBE student;
SELECT * FROM student;

-- inserting data

INSERT INTO student(name, major) VALUES('saravanan', 'biology');
INSERT INTO student(name, major) VALUES('chiranjeevi', 'computer science');
INSERT INTO student(name, major) VALUES('naveen' , 'history');
INSERT INTO student(name, major) VALUES('manirathnam', 'chemistry');
INSERT INTO student(name, major) VALUES('Thiru', 'physics');

SET SQL_SAFE_UPDATES = 0;

-- updating & deleting values

UPDATE student
SET major = 'bio'
WHERE major = 'biology'

UPDATE student 
SET major = 'biochemistry'
WHERE major = 'bio' OR major = 'chemistry' ;

UPDATE student 
SET name = 'chinna',  major = 'history'
WHERE student_id = 1 ;

UPDATE student
SET major = 'chemistry';

DELETE FROM student 
WHERE student_id = 5;

DELETE FROM student 
WHERE name = 'naveen' AND major = 'history'

DELETE FROM student;



-- DDL COMMANDS 

-- CREATE , ALTER , DROP , TRUNCATE , RENAME 



CREATE TABLE stud(
sno int , sname VARCHAR (20), age INT , dob DATE );

DESCRIBE stud;

INSERT INTO stud VALUES(1, 'ajay', 25, current_date() );

DROP TABLE stud ;

SELECT * FROM stud;

ALTER TABLE stud ADD COLUMN marks INT ;

ALTER TABLE stud ADD result VARCHAR(20) ;

ALTER TABLE stud DROP dob ;
ALTER TABLE stud DROP COLUMN marks;

ALTER TABLE stud ADD COLUMN sub INT; 

INSERT INTO stud VALUES (2, 'meera', 27, 'pass', 'maths' );
INSERT INTO stud VALUES (3, 'kanmani', 34, 'pass', 'science');

ALTER TABLE stud MODIFY COLUMN sub VARCHAR(20);

DESC STUD;

ALTER TABLE stud MODIFY COLUMN AGE INT  NOT NULL DEFAULT 13 ;

ALTER TABLE stud MODIFY COLUMN sno INT NOT NULL DEFAULT '123';

ALTER TABLE stud ALTER COLUMN sub SET  DEFAULT 'tamil';

ALTER TABLE stud RENAME TO enggstudent ;

SELECT * FROM enggstudent;


DESC enggstudent ;


TRUNCATE TABLE enggstudent ;

DELETE FROM enggstudent ;



USE me  ;
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


DELETE FROM customer 
WHERE name = 'subbu';

SELECT * FROM customer ;

DELETE FROM customer 
WHERE location = 'chennai';

ALTER TABLE customer ADD COLUMN contactNo INT  ;

ALTER TABLE customer ADD COLUMN age INT NOT NULL DEFAULT '12';

ALTER TABLE customer MODIFY COLUMN contactNo INT DEFAULT '123';  

ALTER TABLE customer MODIFY COLUMN customer.name VARCHAR(21) NOT NULL DEFAULT 'govindhan';  

INSERT INTO customer(name, location)VALUES ('harish', 'mumbai');

ALTER TABLE customer RENAME TO mycustomers;

ALTER TABLE mycustomers RENAME COLUMN location TO loc; 

ALTER TABLE mycustomers RENAME COLUMN loc TO location; 

ALTER TABLE mycustomers RENAME TO customers ;

DESCRIBE customers ;

TRUNCATE TABLE customers;