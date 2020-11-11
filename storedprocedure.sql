-- STORED PROCEDURE 

DELIMITER $$

CREATE  PROCEDURE sp1()
    BEGIN 
        SELECT * FROM student ;
END $$

DELIMITER ;

CALL sp1();

DELIMITER $$
CREATE PROCEDURE sp2()
    BEGIN 
        SELECT name,major FROM student;
    END$$
DELIMITER ;

CALL sp2();

DELIMITER $$
CREATE PROCEDURE sp3()
BEGIN 
    SELECT student_id , name FROM student;
END$$
DELIMITER ;

CALL sp3();

-- IN

DELIMITER $$
CREATE PROCEDURE sp4(IN a INTEGER)
    SET a = a + 10;
BEGIN
END$$

DELIMITER ;

CALL sp4(@a);
SELECT @a;
SET @a = 2;
SELECT @a;

SET @a = 12;
CALL sp4(@a);
SELECT @a;

-- OUT 


DELIMITER $$
CREATE PROCEDURE sp5 ( OUT a INTEGER)
BEGIN 
 SET a = 10;
END $$
DELIMITER ;

SET@a = 15;
CALL sp5(@a);
SELECT @a;

SET @a = 32 ;
CALL sp5(@a);
SELECT @a ; 


-- CREATE A PROCEDURE TO FIND NUMBER IS ODD OR EVEN


DELIMITER $$

 CREATE PROCEDURE odd_even(IN num INTEGER )
 BEGIN 
    IF num%2 = 0 THEN 
    SELECT 'NUMBER IS EVEN';
    ELSE 
    SELECT 'NUMBER IS ODD';
    END IF ;
   END $$
   
   DELIMITER ;

CALL odd_even(15);

CALL odd_even(40);

CALL odd_even(10);

CALL odd_even(22);

CALL odd_even(11);

-- student table for  stored procedures

    CREATE TABLE student(
    student_id INT AUTO_INCREMENT,
    student_name VARCHAR(25),
    father_name VARCHAR(25),
    section VARCHAR(1),
    major VARCHAR(10),
    location VARCHAR(15),
    class_teacher_id INT,
    PRIMARY KEY(student_id)
    );

CREATE TABLE teacher (
teacher_id INT,
tecaher_name VARCHAR(20),
subject VARCHAR(10),
PRIMARY KEY(teacher_id)
);
ALTER TABLE teacher RENAME COLUMN tecaher_name TO teacher_name ; 

CREATE TABLE result(
student_id INT,
total_mark INT,
result VARCHAR(5),
PRIMARY KEY(student_id)
);

INSERT INTO student VALUES (1, 'raja', 'raman', 'B', 'computer', 'tirupattur', NULL);
INSERT INTO teacher VALUES (101, 'priya', 'computer');
ALTER TABLE student
ADD FOREIGN KEY (class_teacher_id) REFERENCES teacher(teacher_id);

UPDATE student
SET class_teacher_id = 101
WHERE student_id = 1 ;
INSERT INTO student VALUES (4, 'sruthi', 'balamurali', 'D', 'computer', 'ambur', 101);

INSERT INTO student VALUES (2, 'kavi', 'kumar', 'A', 'chemistry', 'vellore', NULL);
INSERT INTO teacher VALUES (103, 'sathis', 'chemistry');
UPDATE student
SET class_teacher_id = 103
WHERE student_id = 2 ;

INSERT INTO student VALUES (6, 'kannan', 'mani', 'c', 'chemistry', 'tirupattur', 103);
INSERT INTO teacher VALUES (102, 'bhavani', 'biology');
INSERT INTO teacher VALUES (104, 'parthiban', 'history');
INSERT INTO student VALUES (3, 'shankar', 'ganesh', 'C', 'history', 'vaniyambadi', 104);
INSERT INTO student VALUES (5, 'revathy', 'krishnan', 'A', 'history', 'vellore', 104);
INSERT INTO student VALUES (7, 'muthu', 'kumar', 'B', 'biology', 'chennai', 102);

ALTER TABLE result
ADD FOREIGN KEY (student_id) REFERENCES student(student_id);

INSERT INTO result VALUES (1,495,'pass');
INSERT INTO result VALUES (2,480,'pass');
INSERT INTO result VALUES (3,137,'fail');
INSERT INTO result VALUES (4,493,'pass');
INSERT INTO result VALUES (5,360,'pass');
INSERT INTO result VALUES (6,420,'pass');
INSERT INTO result VALUES (7,153,'fail');

SELECT * FROM student ;

DELIMITER //
 CREATE PROCEDURE getall()
BEGIN 
SELECT * FROM teacher;
END//

DELIMITER ; 


CALL getall();


DELIMITER //
CREATE PROCEDURE insertstudent( IN istuid INT , isname VARCHAR(25), ifname VARCHAR(25), isec VARCHAR(2), imajor VARCHAR(20), ilocation VARCHAR(20) , itid INT)
BEGIN 
INSERT INTO student VALUES (istuid , isname, ifname, isec, imajor, ilocation, itid );
END //
DELIMITER ;
CALL insertstudent(8, 'bhuvanesh', 'raman', 'C', 'chemistry', 'vaniyambadi', 103 );

SELECT * FROM student;

DELIMITER //
CREATE PROCEDURE updateresult(  itmark INT, iresult VARCHAR(10))
BEGIN 
UPDATE result SET  total_mark = itmark, result = iresult WHERE student_id = 7 ;
END //
DELIMITER ;

DROP PROCEDURE updateresult;
CALL updateresult( 199 ,'pass');
CALL updateresult (145, 'fail');


DELIMITER $$
 CREATE PROCEDURE inteacher(IN iteacherid INT , IN iteachername VARCHAR(25), IN isubject VARCHAR(25) )
 BEGIN
  INSERT INTO teacher  VALUES( iteacherid , iteachername, isubject);
 END $$
 
 DELIMITER ;
 
DROP PROCEDURE inteacher; 
CALL inteacher(105, 'anandhi', 'tamil');
CALL inteacher(106, 'kalai', 'dsp');
CALL inteacher(107, 'maran', 'english');
SELECT * FROM teacher ;
 
 DELIMITER $$
  CREATE PROCEDURE delresults( IN istuid INTEGER )
    BEGIN 
      DELETE FROM result  WHERE student_id = istuid;
     END $$ 
 DELIMITER ;

SELECT * FROM result ;
CALL delresults(4);

DELIMITER $$
  CREATE PROCEDURE delteach(IN tname VARCHAR(20) )
BEGIN 
  DELETE FROM teacher WHERE teacher_name = tname ;
 END $$
 
DELIMITER ; 

DROP PROCEDURE delteach ;
CALL delteach('maran');
CALL delteach('kalai');
SELECT * FROM teacher ;
 






 