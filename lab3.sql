-- 1
CREATE TABLE Students(
    crn varchar(50) PRIMARY KEY,
    name varchar(50),
    address varchar(50),
    phone varchar(10),
    dob date
);

-- 2 Insert a tuple into relation Student with crn as null. Comment
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    (null, "Ram", "Kathmandu", "9841223344", "1990-01-01"); -- ERROR 1048 (23000): Column 'crn' cannot be null

-- 3 Insert a tuple into relation Student with crn as 060/bct/04. Comment
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    ("060/bct/04", "Ram", "Kathmandu", "9841223344", "1990-01-01"); -- Success because there is no null value in primary key attribute

-- 4 Insert a tuple into relation Student with crn as 060/bct/40. Comment
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    ("060/bct/04", "Shyam", "Kathmandu", "9855566161", "1992-01-01"); -- ERROR 1062 (23000): Duplicate entry '060/bct/04' for key 'students.PRIMARY'

-- 5 Alter the relation student to add the attributes Parents Name and Email Id.
ALTER TABLE Students ADD COLUMN (parents_name varchar(50), email_id varchar(50));

-- 6 Create Relation Departments on Departments Schema with the underlined attribute as primary key.
-- Add the contraint to the relation department such that dnumber is only between 10 and 50 and also dname should be in capital letter.
CREATE TABLE Departments
(
    deptid INT PRIMARY KEY,
    dnumber INT CHECK (dnumber BETWEEN 10 AND 50),
    dname VARCHAR(255),
    CONSTRAINT CHK_Departments_dname CHECK (BINARY dname = UPPER(dname))
);

-- 7 Insert a tuple into relation Departments with dnumber as 10 and Dname as COMPUTER.
INSERT INTO Departments (deptid, dnumber, dname) VALUES (1, 10, "COMPUTER");

-- 8 Insert a tuple into relation Departments with dnumber as 20 and dname as civil. Comment on result
INSERT INTO Departments (deptid, dnumber, dname) VALUES (2,20, "civil"); -- ERROR 3819 (HY000): Check constraint 'departments_chk_2' is violated.

-- 9 Create relation course on course schema with the underlined attribute as primary key. The attribute coursename is unique.
CREATE TABLE Course(
    courseID INT PRIMARY KEY
    coursename varchar(50) UNIQUE,
    duration INT,
    fee INT
);

-- 10 Add a constraint to the relation course such that the minimum fee for all course is 1000.
ALTER TABLE Course
ADD CONSTRAINT CHK_Course_fee_min CHECK (fee >= 1000);

-- 11 Fill in the table course with the data of your choice provided that the course offered - are only "java",
-- "Cisco", "Linux" and "Visual Basic"
ALTER TABLE Course 
ADD CONSTRAINT CHK_Course_name CHECK (coursename in ("Java", "Cisco", "Linux", "Visual Basic"));

-- 12 Insert a tuple into the relation course with coursename "oracle". Comment on result
INSERT INTO Course(courseid, coursename, duration, fee)
VALUES (1,"oracle",2000, 1000); -- Comment: ERROR 3819 (HY000): Check constraint 'CHK_Course_name' is violated.

-- 14 Add a constraint to relation student so that attributes phone-number and DOB together form unique key.
ALTER TABLE Students
ADD CONSTRAINT CHK_Students_phone_dob UNIQUE (phone, dob);

-- 15 Insert a  tuple into the relation student with crn having a null value. Comment on result
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    (null, "Ram", "Kathmandu", "9841223344", "1990-01-01"); -- ERROR 1048 (23000): Column 'crn' cannot be null

-- 16 Insert a tuple into the relation student with the attributes phone-number as null value. Comment on result.
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    ("061/BCT/05", "Laxman", "Kathmandu", null, "1990-01-01");

-- 17 Insert a tuple into the relation student with both attributes phone-number and DOB as null values. Comment.
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    ("061/BCT/06", "Laxman", "Kathmandu", null, null);

-- 18 Again insert null value like 17
INSERT INTO Students(crn, name, address, phone, dob) VALUES
    ("061/BCT/07", "Gaurav", "Kathmandu", null, null);

-- 19 Alter the relation Course to change the data type of fee from integer to floating point.
ALTER TABLE Course
MODIFY COLUMN fee FLOAT;

-- 20 Drop constraint applied on dname of schema department
ALTER TABLE Departments
DROP CONSTRAINT CHK_Departments_dname;

-- 21 Drop constraint applied on combination of phone-number and DOB of schema student
ALTER TABLE Students
DROP CONSTRAINT CHK_Students_phone_dob;

-- 22 DELETE all records from the relation student;
TRUNCATE TABLE Students;

-- 23 Remove the relation student from the database;
DROP TABLE Students;