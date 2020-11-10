
-- INDEXES
  -- clustured index, secondary index

USE jarvis ;
CREATE TABLE movie_list ( m_id INT AUTO_INCREMENT,        
name VARCHAR (50), 
director VARCHAR(20), 
price INT,
PRIMARY KEY( m_id)
);

CREATE TABLE customer(
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

INSERT INTO customer (name, location) VALUES ('vikram', 'tirupattur');
INSERT INTO customer (name, location) VALUES ('ram', 'vaniyambadi');
INSERT INTO customer (name, location) VALUES ('prabhu', 'chennai');
INSERT INTO customer (name, location) VALUES ('tamil', 'tirupattur');
INSERT INTO customer (name, location) VALUES ('krish', 'chennai');
INSERT INTO customer (name, location) VALUES ('mathew', 'hosur');
INSERT INTO customer (name, location) VALUES (NULL, 'hosur');
INSERT INTO customer (name, location) VALUES ('mathew', NULL);
INSERT INTO customer (name, location) VALUES ('muthu', 'krishnagiri');


INSERT INTO sale(m_id, cus_id, price ) VALUES  (3,5,400);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (4,1,300);
INSERT INTO sale (m_id, cus_id, price ) VALUES  (7,6,350);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (6,8,400);
INSERT INTO sale(m_id, cus_id, price )  VALUES  (2,2,350);



SELECT * FROM movie_list;

SELECT price 
FROM movie_list
WHERE price = 900 ;   

EXPLAIN SELECT price 
FROM movie_list
WHERE price = 900 ;  

CREATE INDEX priceindex ON movie_list(price);

DROP INDEX priceindex ON movie_list ;

SELECT price 
FROM movie_list
WHERE price = 900 ;

EXPLAIN SELECT price
FROM movie_list
WHERE price = 900; 


SELECT location, name 
FROM customer 
WHERE name = 'vikram' ;

EXPLAIN SELECT location, name 
FROM customer 
WHERE name = 'vikram' ;

CREATE INDEX cusnamex ON customer(name);

SELECT location, name 
FROM customer 
WHERE name = 'mathew' ;

EXPLAIN SELECT location, name 
FROM customer 
WHERE name = 'mathew' ;


SELECT * 
FROM customer
WHERE name = 'prabhu';


CREATE INDEX locax ON customer(location);


SELECT name 
FROM customer 
WHERE location = 'tirupattur';

EXPLAIN SELECT name 
FROM customer 
WHERE location = 'tirupattur';


CREATE TABLE sal( 
eid INT ,
ename INT , 
salary INT
);
ALTER TABLE sal MODIFY COLUMN ename VARCHAR(20);

INSERT INTO sal VALUES (1,'mani', 20000);
INSERT INTO sal VALUES (2,'sounder', 25000);
INSERT INTO sal VALUES (3,'bharathi', 30000);
INSERT INTO sal VALUES (4,'vijay', 70000);
INSERT INTO sal VALUES (5,'mohan', 50000);
INSERT INTO sal VALUES (6,'hari', 15000);
INSERT INTO sal VALUES (7,'agalyan', 18000);
INSERT INTO sal VALUES (8,'ashok', 48000);
INSERT INTO sal VALUES (9,'raj', 27000);
INSERT INTO sal VALUES (10,'vel', 35000);
INSERT INTO sal VALUES (11,'kumar', 49000);
INSERT INTO sal VALUES (12,'kannan', 12000);

SELECT *  FROM sal;

CREATE INDEX salax ON sal(salary);

SELECT ename ,  salary 
FROM sal
WHERE salary = 49000;

EXPLAIN SELECT ename ,  salary 
FROM sal
WHERE salary = 49000;

SELECT ename 
FROM sal 
WHERE salary > 50000;

EXPLAIN SELECT ename 
FROM sal 
WHERE salary > 50000;

SELECT * FROM sal 
WHERE salary = 20000;

SELECT  eid 
FROM sal;

CREATE INDEX edix ON sal(eid);

SELECT eid FROM sal;

SELECT * 
FROM sal
WHERE eid = 7;
 

CREATE TABLE tab1(
sno INT );
 
 
INSERT INTO tab1 VALUES (29);
INSERT INTO tab1 VALUES (33);
INSERT INTO tab1 VALUES (19);
INSERT INTO tab1 VALUES (11);
INSERT INTO tab1 VALUES (09);
INSERT INTO tab1 VALUES (22);
INSERT INTO tab1 VALUES (17);
INSERT INTO tab1 VALUES (3);
INSERT INTO tab1 VALUES (1);

SELECT * FROM tab1;

 CREATE INDEX snox ON tab1(sno);
 
 SELECT sno FROM tab1;
 
 DROP INDEX snox ON tab1;
 
  
SHOW INDEXES FROM sal;
 SHOW INDEXES FROM sal IN jarvis;
 
 SHOW KEYS FROM sal;
 SHOW KEYS FROM sal IN jarvis;
 
 
 SHOW INDEXES FROM movie_list;
 SHOW INDEXES FROM movie_list IN jarvis;
 
 SHOW INDEXES FROM tab1;
 SHOW INDEXES FROM tab1 IN JARVIS;
 
 SHOW KEYS FROM tab1;
   
-- clustured index  primary key , unique key 

 CREATE TABLE sun(
 nos INT 
 );
 
 INSERT INTO sun(nos) VALUES (24);
 INSERT INTO sun(nos) VALUES (18);
 INSERT INTO sun(nos)VALUES (13);
 INSERT INTO sun(nos) VALUES (07);
 INSERT INTO sun(nos) VALUES (1);
 INSERT INTO sun(nos) VALUES (4);
 INSERT INTO sun(nos) VALUES (33);
 
 
 SELECT * FROM sun;
 
 ALTER TABLE sun ADD COLUMN nam VARCHAR(20);
 
 ALTER TABLE sun ADD CONSTRAINT  PRIMARY KEY sun(nos);
 
 SHOW KEYS FROM sun; 
 
 ALTER TABLE sun ADD CONSTRAINT unixnam UNIQUE(nam);
 
 CREATE TABLE test3(
  sid INT ,
  sname VARCHAR(20)
 );
 
 

 ALTER TABLE test3 ADD CONSTRAINT PRIMARY KEY (sid);
 
 ALTER TABLE test3 ADD CONSTRAINT unixname UNIQUE(sname);
 
 
 SHOW KEYS FROM test3;
 
 ALTER TABLE test3 ADD COLUMN tname VARCHAR(20);
 
 ALTER TABLE test3 ADD CONSTRAINT UNIQUE(tname);
 
SHOW INDEXES FROM  test3 FROM jarvis;
 