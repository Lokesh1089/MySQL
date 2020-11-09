-- SORTING DATA 
-- ORDER BY


CREATE TABLE student(
sid INT AUTO_INCREMENT PRIMARY KEY ,
fname VARCHAR(20),
lname VARCHAR(20),
major VARCHAR(20)
);

INSERT INTO student(fname, lname, major) VALUES( 'kavin', 'kumar', 'biology ');
INSERT INTO student(fname, lname, major) VALUES( 'ashok', 'selvan', 'chemistry');
INSERT INTO student(fname, lname, major) VALUES( 'muthu', 'kumar', 'physics ');
INSERT INTO student(fname, lname, major) VALUES( 'raja', 'ram', 'social ');
INSERT INTO student(fname, lname, major) VALUES( 'dilip', 'kumar', 'biology ');

SELECT * FROM student;

SELECT fname 
FROM student
ORDER BY fname ;

SELECT fname, major 
FROM student
ORDER BY major;

SELECT fname ,major 
FROM  student
ORDER BY fname ;


SELECT fname,lname 
FROM student
ORDER BY lname ;

SELECT fname, lname
FROM student
ORDER BY fname DESC;

SELECT fname , lname , major, sid
FROM student 
ORDER BY sid DESC;

SELECT major, fname, sid
FROM student
ORDER BY sid ASC;

SELECT * 
FROM student
ORDER BY lname DESC;

SELECT * 
FROM student
ORDER BY fname , sid ;

SELECT * 
FROM student
ORDER BY major , fname ;

SELECT * 
FROM student 
ORDER BY fname , sid DESC;
