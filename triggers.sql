-- TRGGERS
-- INSERT , UPDATE , DELETE

CREATE TABLE booklist (
bno INT ,
bname VARCHAR(20)
);

ALTER TABLE booklist MODIFY COLUMN bname VARCHAR(50);

INSERT INTO booklist VALUES (1, 'thermodynamics');
INSERT INTO booklist VALUES (2, 'manufacturing technology');
INSERT INTO booklist VALUES (3, 'strength of material');
INSERT INTO booklist VALUES (4, 'environmental science');

CREATE TABLE black ( msg VARCHAR(50));

DELIMITER $$

CREATE TRIGGER delbook AFTER INSERT 
ON booklist 
FOR EACH ROW 
BEGIN 
INSERT INTO black VALUES ( 'new book added');
END $$

DELIMITER ;

INSERT INTO booklist VALUES (5, 'computer programming');

SELECT * FROM  black;

INSERT INTO booklist VALUES (6, ' engg chemistry');


DELIMITER $$
 
    CREATE TRIGGER upbook AFTER UPDATE 
    ON booklist 
    FOR EACH ROW 
    BEGIN 
    INSERT INTO black VALUES (' book name updated');
    END $$
    
  DELIMITER ;  

UPDATE booklist 
SET bname = 'engineering graphics'
WHERE bno = 4 ; 

SELECT * FROM black;

UPDATE booklist 
SET bname = 'engg maths'
WHERE bno = 5 ; 

SELECT * FROM booklist ;


DELIMITER $$
CREATE TRIGGER del AFTER DELETE
ON booklist
FOR EACH ROW  
BEGIN 
INSERT INTO black VALUES ('book deleted from booklist') ;
END $$
DELIMITER ;

DELETE FROM booklist 
WHERE bno = 4 ;

SELECT * FROM black ;

SELECT * FROM booklist;




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

CREATE TABLE trigger_table (
 blue VARCHAR(50) );

DELIMITER //
    CREATE TRIGGER mytrigger AFTER INSERT
    ON student 
    FOR EACH ROW 
    BEGIN
    INSERT INTO trigger_table VALUES ('added a one new student');
    END//
DELIMITER ;
INSERT INTO student VALUES (8, 'raja', 'rajan', 'c', 'biology', 'katpadi', 102);

SELECT * FROM trigger_table;

DELIMITER //
    CREATE TRIGGER mytrigger2 AFTER DELETE
    ON student 
    FOR EACH ROW 
    BEGIN
    INSERT INTO trigger_table VALUES ('deleted a one student information');
    END//
DELIMITER ;

DELETE FROM student
WHERE student_id = 8 ;
 