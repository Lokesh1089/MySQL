--  STRING FUNCTION 

-- LENGTH
-- UPPER 
-- SUBSTRING
-- UPPER
-- LTRIM
-- INSTRT
-- REPEAT
-- CONCAT

USE jarvis;

CREATE TABLE student(
student_id INT AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20) DEFAULT 'undecided',
primary key(student_id)
);


SELECT * FROM student;

INSERT INTO student(name, major) VALUES('saravanan', 'biology');
INSERT INTO student(name, major) VALUES('chiranjeevi', 'computer science');
INSERT INTO student(name, major) VALUES('naveen' , 'history');
INSERT INTO student(name, major) VALUES('manirathnam', 'chemistry');
INSERT INTO student(name, major) VALUES('Thiru', 'physics');

SELECT length('venba');

SELECT LENGTH('manirathnnam');

SELECT LENGTH('thirukumaran');

SELECT LENGTH('mani');

SELECT LENGTH('ok');

SELECT name , LENGTH(name)
FROM student;

SELECT major , LENGTH(major)
FROM student;

SELECT UPPER(name) FROM student;

SELECT UPPER(major) FROM student;

SELECT name,  UPPER(name)
FROM student;

SELECT name, major , UPPER(major)
FROM student;

SELECT name, UPPER(name), major, UPPER(major)
FROM student;


SELECT SUBSTRING('muthumani', 3, 6);

SELECT SUBSTRING('muthumani', 2, 5);

SELECT SUBSTRING('muthumani', 1, 5);

SELECT SUBSTRING('rajarajan', 1,4);

SELECT SUBSTRING('rajarajan', 5,3);

SELECT SUBSTRING('gokulaprakash', 7, 4);

SELECT SUBSTRING('ajaylokesh',  5,4);

SELECT SUBSTRING('ajaylokesh',  1,4);

SELECT INSTR('ajay', 'j');
SELECT INSTR('ajay', 'a');
SELECT INSTR('murali', 'r');
SELECT INSTR('prabhu', 'u');
SELECT INSTR('afridy', 'r');
SELECT INSTR('mohammad', 'o');
SELECT INSTR('mohammad', 'm');


SELECT CONCAT('mohammad', 'afridy');
SELECT CONCAT('vandu', 'murugan');
SELECT CONCAT( 'all', 'in', 'all', 'azhaguraja');
SELECT CONCAT('child' , 'chinna');
SELECT CONCAT('vazhgha', 'vazhamudan');

CREATE TABLE test(

fname VARCHAR(20), 
lname VARCHAR(20)
);


INSERT INTO test VALUES ('  rohith','   sharma');
INSERT INTO test VALUES ('    virath','        kholi');
INSERT INTO test VALUES ('          abhishek','sharma');
INSERT INTO test VALUES ('vijay','      kumar');

SELECT fname , lname , CONCAT(fname  , lname) AS fullname
FROM test;

-- generate full name with space between fname and lname 

SELECT fname  , lname , CONCAT( fname , CONCAT(' ', lname )) AS fullname
FROM test ;

-- query to display a name in initcap for  example  nikhil becomes Nikhil

SELECT ename , substr(ename, 1,1)
FROM employees;

SELECT ename , UPPER(substr(ename, 1,1))
FROM employees;

SELECT ename , concat(UPPER(substr(ename, 1,1)), substr(ename , 2 , length(ename)))
FROM employees;

-- QUERY TO DISPLAY NAME IN FORM Nikhil srivasta THEN N.srivasta

SELECT * FROM test;

SELECT concat(UPPER(substr(fname, 1,1)), concat('.', lname)) AS namewithinitial
FROM test;

-- query to find mid alpha of  name


SELECT ename , CASE(length(ename)%2)
    WHEN 0 THEN substr(ename, length(ename)/2, 2)
    WHEN 1 THEN substr(ename, length(ename)/2, 1)
    END AS midalpha
FROM employees;    

SELECT ltrim('     muthu');
SELECT ltrim('kanmani    ');
SELECT ltrim('     raj');
SELECT ltrim('rio     ');

SELECT LENGTH('     muthu');
SELECT LENGTH(LTRIM('     muthu'));

SELECT repeat('123', 5);
SELECT repeat('&', 3);
SELECT repeat('*', 12);
SELECT repeat('L', 4);


 SELECT * FROM test;
 
 -- query to pad left spaces in a name with '*'
 
 SELECT fname , repeat( '*' , length(fname)-length( ltrim(fname)))
 FROM test;
  
 SELECT fname , concat(repeat( '*' , length(fname)-length( ltrim(fname))), ltrim(fname))
 FROM test;
  SELECT fname , concat(repeat( '*' , length(fname)-length( ltrim(fname))), ltrim(fname)) AS newname
 FROM test;
 
 SELECT fname,  replace( fname , ' ', '*') FROM test;
 
 SELECT  replace('GOPAL', 'P', 'V'); 
 
 -- query to perform credit card masking
 
 CREATE TABLE carddetails 
(
nam VARCHAR(25),
cardno INT8
);

ALTER TABLE cardDetails MODIFY COLUMN cardno INT8;
 
 INSERT INTO carddetails VALUES ('ram', 8559659652695296);
INSERT INTO carddetails VALUES ('gopi', 7458852545655);
INSERT INTO carddetails VALUES ('sudhakar', 15854847844144);
INSERT INTO carddetails VALUES ('vaithee',8774848941854);

SELECT cardno , concat(repeat( '*', length(cardno)-4), substring(cardno, length(cardno)-4,4 )) AS masking

FROM carddetails; 
 
 