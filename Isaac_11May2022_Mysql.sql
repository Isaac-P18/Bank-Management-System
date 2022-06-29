CREATE DATABASE BMS;
USE BMS;
CREATE TABLE CUSTOMER
(
CUSTID VARCHAR(6),
FNAME VARCHAR(30) NOT NULL,
MNAME VARCHAR(30),
LNAME VARCHAR(30) NOT NULL,
CITY VARCHAR(15) NOT NULL,
MOBILENO BIGINT NOT NULL CHECK(LENGTH(MOBILENO)=10),
OCCUPATION VARCHAR(10) NOT NULL,
DOB DATE NOT NULL,
CONSTRAINT CUSTOMER_CUSTID_PK PRIMARY KEY(CUSTID)
);

CREATE TABLE BRANCH
(
BID VARCHAR(6),
BNAME VARCHAR(30) NOT NULL,
BCITY VARCHAR(30) NOT NULL,
CONSTRAINT BRANCH_BID_PK PRIMARY KEY(BID)
);

CREATE TABLE LOAN
(
LOAN_ID INT,
CUSTID VARCHAR(6) NOT NULL,
BID VARCHAR(6) NOT NULL,
LOAN_AMOUNT INT  NOT NULL,
CONSTRAINT LOAN_LOAN_ID_PK PRIMARY KEY(LOAN_ID),
CONSTRAINT LOAN_CUSTID_FK FOREIGN KEY(CUSTID) REFERENCES  CUSTOMER(CUSTID),
CONSTRAINT LOAN_BID_FK FOREIGN KEY(BID) REFERENCES  BRANCH(BID)
);

CREATE TABLE ACCOUNT(
ACCNUMBER BIGINT,
CUSTID VARCHAR(6) ,
BID VARCHAR(6) ,
OPENING_BALANCE INT NOT NULL,
ACC_OPEN_DATE DATE NOT NULL,
ACC_TYPE VARCHAR(10) 
CHECK (ACC_TYPE="LOAN" or ACC_TYPE="SAVINGS" or ACC_TYPE="CURRENT"),
ACC_STATUS VARCHAR(10) 
CHECK (ACC_STATUS="OPEN" or ACC_STATUS="CLOSE"),
CONSTRAINT ACCOUNT_ACNUMBER_PK PRIMARY KEY(ACCNUMBER),
CONSTRAINT ACCOUNT_CUSTID_FK FOREIGN KEY(CUSTID) REFERENCES customer(CUSTID),
CONSTRAINT ACCOUNT_BID_FK FOREIGN KEY(BID) REFERENCES branch(BID)
);
ALTER TABLE ACCOUNT ADD LOAN_ID INT NOT NULL;
ALTER TABLE ACCOUNT ADD constraint LOAN_ID_FK FOREIGN KEY(LOAN_ID) REFERENCES LOAN(LOAN_ID);

CREATE TABLE TRANDETAILS
    (  
     TNUMBER VARCHAR(6),
     ACCNUMBER BIGINT,
     DOT DATE NOT NULL,
     MEDIUM_OF_TRANSACTION VARCHAR(20) NOT NULL CHECK 
     (MEDIUM_OF_TRANSACTION="BANK_TRANSFER" or MEDIUM_OF_TRANSACTION="CASH_DEPOSIT" ),
     TRANSACTION_TYPE VARCHAR(20)NOT NULL CHECK 
     (TRANSACTION_TYPE="CREDIT"),
     TRANSACTION_AMOUNT INT,    
     CONSTRAINT TRANDETAILS_TNUMBER_PK PRIMARY KEY(TNUMBER),
     CONSTRAINT TRANDETAILS_ACCNUMBER_FK FOREIGN KEY(ACCNUMBER) REFERENCES account(ACCNUMBER)  
    );
    
    
    
INSERT INTO BRANCH VALUES('B00001','BENZCIRCLE','VZD');
INSERT INTO BRANCH VALUES('B00002','NACHARAM','HYD');
INSERT INTO BRANCH VALUES('B00003','RAMAVARAPADU','VZD');
INSERT INTO BRANCH VALUES('B00004','CHOURASTHA','HYD');
INSERT INTO BRANCH VALUES('B00005','BHAVANIPURAM','VZD');
INSERT INTO BRANCH VALUES('B00006','NTR CIRCLE','SCD');
INSERT INTO BRANCH VALUES('B00007','MANDVI','MUM');
INSERT INTO BRANCH VALUES('B00008','SECTOR-17','CHD');
INSERT INTO BRANCH VALUES('B00009','KODAMBAKKAM','MAS');
INSERT INTO BRANCH VALUES('B00010','MADIVALA','BAN');
INSERT INTO BRANCH VALUES('B00011','WESTGUHATI','GHY');

INSERT INTO CUSTOMER VALUES('C00001','ISAAC',null,'NAIDU','VZD',8184899595,'EMP','2000-12-18');
INSERT INTO CUSTOMER VALUES('C00002','ABHISHEK',null,'kOUNDLE','CHD',9115898742,'EMP','2000-09-17');
INSERT INTO CUSTOMER VALUES('C00003','RAHUL',null,'GANDHAM','VZD',9765178901,'STD','1999-09-26');
INSERT INTO CUSTOMER VALUES('C00004','SRIKANTH',null,'GANDERTI','MUM',9876532109,'STD','1999-12-31');
INSERT INTO CUSTOMER VALUES('C00005','ANUPAL',null,'DEKA','GHY',8976523190,'EMP','1997-09-19');
INSERT INTO CUSTOMER VALUES('C00006','ROHIT',null,'GADAM','HYD',7651298321,'STD','2000-12-21');
INSERT INTO CUSTOMER VALUES('C00007','HRUSHI','VENKATA','SAI','BAN',8977764637,'EMP','2000-02-12');


INSERT INTO LOAN VALUES(1,'C00001','B00001',100000);
INSERT INTO LOAN VALUES(2,'C00001','B00001',200000);
INSERT INTO LOAN VALUES(3,'C00002','B00008',50000);
INSERT INTO LOAN VALUES(4,'C00004','B00007',750000);
INSERT INTO LOAN VALUES(5,'C00006','B00004',100000);
INSERT INTO LOAN VALUES(6,'C00005','B00002',300000);
INSERT INTO LOAN VALUES(7,'C00001','B00003',300000);
INSERT INTO LOAN VALUES(8,'C00002','B00004',300000);
INSERT INTO LOAN VALUES(9,'C00003','B00005',300000);
INSERT INTO LOAN VALUES(10,'C00005','B00011',300000);



SELECT * FROM ACCOUNT;
DESC ACCOUNT;


INSERT INTO account VALUES(9000000001,'C00001','B00001',100000,'2012-12-15','LOAN','OPEN',1);
INSERT INTO account VALUES(9000000002,'C00002','B00001',200000,'2012-06-12','LOAN','OPEN',2);
INSERT INTO account VALUES(9000000003,'C00003','B00002',50000,'2012-05-17','LOAN','OPEN',3);
INSERT INTO account VALUES(9000000004,'C00002','B00005',750000,'2013-01-27','LOAN','OPEN',4);
INSERT INTO account VALUES(9000000005,'C00006','B00006',1000,'2012-12-17','SAVINGS','OPEN',5);
INSERT INTO account VALUES(9000000006,'C00007','B00007',0,'2010-08-12','LOAN','CLOSE',6);
INSERT INTO account VALUES(9000000007,'C00007','B00001',300000,'2012-10-02','CURRENT','OPEN',7);
INSERT INTO account VALUES(9000000008,'C00001','B00003',0,'2009-11-09','LOAN','CLOSE',8);
INSERT INTO account VALUES(9000000009,'C00003','B00007',0,'2008-11-30','SAVINGS','CLOSE',9);
INSERT INTO account VALUES(9000000010,'C00004','B00002',0,'2013-03-01','LOAN','CLOSE',10);

SELECT * FROM TRANDETAILS;
DESC TRANDETAILS;
INSERT INTO trandetails VALUES('T00001',9000000010,'2013-04-01','CASH_DEPOSIT','CREDIT',100000);
INSERT INTO trandetails VALUES('T00002',9000000010,'2013-05-01','BANK_TRANSFER','CREDIT',100000);
INSERT INTO trandetails VALUES('T00003',9000000010,'2013-06-01','CASH_DEPOSIT','CREDIT',100000);
INSERT INTO trandetails VALUES('T00004',9000000008,'2009-12-01','BANK_TRANSFER','CREDIT',100000);
INSERT INTO trandetails VALUES('T00005',9000000008,'2010-01-01','BANK_TRANSFER','CREDIT',100000);
INSERT INTO trandetails VALUES('T00006',9000000008,'2010-02-01','CASH_DEPOSIT','CREDIT',100000);
INSERT INTO trandetails VALUES('T00007',9000000006,'2010-09-01','BANK_TRANSFER','CREDIT',100000);
INSERT INTO trandetails VALUES('T00008',9000000006,'2010-10-01','BANK_TRANSFER','CREDIT',100000);
INSERT INTO trandetails VALUES('T00009',9000000006,'2010-11-01','BANK_TRANSFER','CREDIT',100000);


SELECT * FROM ACCOUNT;
SELECT * FROM BRANCH;
SELECT * FROM CUSTOMER;
SELECT * FROM LOAN;
SELECT * FROM TRANDETAILS;


-- FIND OUT ALL THE LOANS TAKEN BY THE CUSTID=1

SELECT COUNT(*) AS lOANS_TAKEN
FROM LOAN
WHERE CUSTID='C00001';

-- FIND OUT THE LOAN BALANCE FOR A CUSTID=1

sELECT * FROM TRANDETAILS;
SELECT * FROM ACCOUNT;

-- 1
SELECT COUNT(CUSTID)  FROM LOAN WHERE CUSTID='C00001';
-- 2
SELECT L.LOAN_AMOUNT  FROM LOAN L INNER JOIN ACCOUNT A
ON L.LOAN_ID=A.LOAN_ID WHERE  A.CUSTID='C00001' AND A.ACCNUMBER=9000000001 ;
-- 3
SELECT SUM(LOAN_AMOUNT) FROM LOAN WHERE CUSTID='C00001'; 

-- 4
SELECT COUNT(DISTINCT CUSTID) AS NUM_OF_CUST,B.BID AS NUM_OF_CUSTOMER FROM BRANCH B
INNER JOIN  ACCOUNT A
ON B.BID=A.BID GROUP BY B.BID ORDER BY NUM_OF_CUST DESC LIMIT 1;

-- 5
SELECT SUM(LOAN_AMOUNT) AS TOTAL,B.BID FROM
LOAN L INNER JOIN BRANCH B ON
L.BID=B.BID
GROUP BY B.BID
ORDER BY TOTAL DESC LIMIT 1;

-- 6
SELECT A.CUSTID,COUNT(TNUMBER) AS NUM_OF_TRANS FROM TRANDETAILS TD INNER JOIN ACCOUNT A
ON TD.ACCNUMBER=A.ACCNUMBER
WHERE A.OPENING_BALANCE=0
GROUP BY TD.ACCNUMBER;

-- 7
SELECT A.CUSTID,SUM(TRANSACTION_AMOUNT) FROM TRANDETAILS TD INNER JOIN ACCOUNT A
ON TD.ACCNUMBER=A.ACCNUMBER  WHERE A.OPENING_BALANCE=0 GROUP BY A.ACCNUMBER;

-- 8
SELECT C.CUSTID, COUNT(C.CUSTID) AS COUNT FROM CUSTOMER C JOIN ACCOUNT A 
ON C.CUSTID=A.CUSTID WHERE A.ACC_STATUS = 'OPEN' GROUP BY C.CUSTID;

-- 9
#1 ACC_STATUS CHECK
INSERT INTO ACCOUNT VALUES(9000000098,'C00011','B00001',0,'2012-08-15','LOAN','INACTIVE',8); 
#2 MEDIUM OF TRANSACTION CHECK
INSERT INTO TRANDETAILS VALUES('TN0010', 9000000014, '2013-02-27',	'CHEQUE','CREDIT',	20000);
#3 TRANSACTION TYPE CHECK
INSERT INTO TRANDETAILS VALUES('TN0010', 9000000014, '2013-02-27',	'Bank_Transfer','UPI',	20000);
#4 ACC_TYPE CHECK
INSERT INTO ACCOUNT VALUES(9000000098,'C00011','B00001',0,'2012-08-15','SALARY','OPEN',8);


#10
SET @TRANSACTION_AMOUNT = 100;
insert INTO TRANDETAILS(TNUMBER,ACCNUMBER,DOT,MEDIUM_OF_TRANSACTION,TRANSACTION_TYPE,TRANSACTION_AMOUNT) 
SELECT 'T00017',9000000008,curdate(),"CASH_DEPOSIT",'CREDIT',100 FROM TRANDETAILS AC
JOIN  ACCOUNT A ON AC.ACCNUMBER=A.ACCNUMBER 
where  A.OPENING_BALANCE = 0 AND A.OPENING_BALANCE=@TRANSACTION_AMOUNT AND A.ACC_STATUS="CLOSE" LIMIT 1;
SET @TRANSACTION_AMOUNT = 23000;
#11
insert INTO TRANDETAILS(TNUMBER,ACCNUMBER,DOT,MEDIUM_OF_TRANSACTION,TRANSACTION_TYPE,TRANSACTION_AMOUNT) 
SELECT 'T00011',9000000006,curdate(),"CASH_DEPOSIT",'CREDIT',2000 FROM TRANDETAILS AC
JOIN  ACCOUNT A ON AC.ACCNUMBER=A.ACCNUMBER
where  A.OPENING_BALANCE >= @TRANSACTION_AMOUNT  LIMIT 1;