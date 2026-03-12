-- HOMEWORK 2 Part 2
--Author: Sophia Ketchen

CREATE TABLE DayOfWeek (
DOWeek int,
Day_Name varchar(9)
);


CREATE TABLE Specialty (
Field_ID varchar(4) Primary Key Not Null,
Field_Name varchar(10)
);

CREATE TABLE Generation (
GEN_ID varchar(4) Primary Key Not Null,
GEN_Name varchar(25)
);

CREATE TABLE Guests (
Guest_ID varchar(8) Primary Key Not Null,
First_Name varchar(16),
Last_Name varchar(16),
DOBirth varchar(10), --e.g. 07/04/1776
Field_ID varchar(4) Not Null,
FOREIGN KEY (Field_ID) REFERENCES Specialty(Field_ID),
GEN_ID varchar(4) Not Null,
FOREIGN KEY (GEN_ID) REFERENCES Generation(GEN_ID)
);

--FAILS
INSERT INTO GUESTS VALUES ('BRK001' ,'BRYCE', 'KETCHEN', '08/02/1908', 
'ATHL', 'GENX');

INSERT INTO SPECIALTY VALUES ('STUD', 'STUDENT');
INSERT INTO SPECIALTY VALUES ('ATHL', 'ATHLETE');

INSERT INTO GENERATION VALUES ('GENZ', 'Generation Z');
INSERT INTO GENERATION VALUES ('GENX', 'Generation X');

--WORKS NOW
INSERT INTO GUESTS VALUES ('SNK001' ,'SOPHIA', 'KETCHEN', '12/04/2004', 
'STUD', 'GENZ');
SELECT * FROM GUESTS;
SELECT First_Name, Last_Name, Field_Name, GEN_Name
FROM GUESTS, SPECIALTY, GENERATION
WHERE GUESTS.Field_ID = SPECIALTY.Field_ID
AND GUESTS.GEN_ID = GENERATION.GEN_ID;
