-- TRANSACTIONAL LANGUAGE 
-- ROLL BACK
-- COMMIT
-- START TRANSACTION

CREATE TABLE test(
num INT, name VARCHAR(15)
);
SELECT * FROM test ;
INSERT INTO test VALUES(1, 'mohan');

START TRANSACTION;

INSERT INTO test VALUES(2, 'manoj');

COMMIT;

ROLLBACK;

USE ME ;

CREATE TABLE t1 ( num INT );

INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (45);
INSERT INTO t1 VALUES (95);
INSERT INTO t1 VALUES (33);

SELECT * FROM t1 ;

START TRANSACTION ;
DELETE FROM  t1 ;
ROLLBACK ;


START TRANSACTION ;
INSERT INTO t1 VALUES (999);
ROLLBACK;

START TRANSACTION ;
UPDATE t1 
SET num = 33
WHERE num = 888 ;
ROLLBACK;



CREATE TABLE students(
student_id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20) DEFAULT 'undecided',
primary key(student_id)
);

INSERT INTO students(name, major) VALUES('saravanan', 'biology');
INSERT INTO students(name, major) VALUES('chiranjeevi', 'computer science');
INSERT INTO students(name, major) VALUES('naveen' , 'history');
INSERT INTO students(name, major) VALUES('manirathnam', 'chemistry');
INSERT INTO students(name, major) VALUES('Thiru', 'physics');
INSERT INTO students(name) VALUES('babu');

SELECT * FROM students ;


START TRANSACTION ;
 UPDATE students 
 SET name = 'ramasamy'
 WHERE major = 'chemistry';
 
 COMMIT;
 ROLLBACK;

 UPDATE students 
 SET major = 'engg maths'
 WHERE name = 'thiru';

START TRANSACTION ;
UPDATE students
SET major = 'maths'
WHERE major = 'undecided';
COMMIT ;
ROLLBACK;
