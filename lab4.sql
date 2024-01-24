DROP TABLE Enrolls;
DROP TABLE Students;
DROP TABLE Courses;

CREATE TABLE Students(
    crn VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone_number int,
    dob DATE
);

CREATE TABLE Courses(
    courseID varchar(50) PRIMARY KEY,
    course_name varchar(50),
    duration int,
    fee int
);

INSERT INTO Students(crn,name,address,phone_number, dob)
VALUES ("058/bct766","Binod", "Lalitpur", null, "1992-01-12"),
("058/bct778","Shyam", "Ktm", 4288888, "1990-12-01"),
("058/bct777", "Puja", "Ktm", 4272222, "1982-01-10"),
("058/bct779","Hari","Bkt", 667890,"1983-07-12"),
("058/bct729","John","Ktm", 667890,"1983-07-12"),
("058/bct730","Sim","Dhapakhel", 4567890,"1990-06-10");

INSERT INTO Courses(courseID,course_name,duration,fee)
VALUES ("c123", "java", 5, 3000),
("c111", "linux", 8, 6000),
("c142", "oracle", 9, 8000),
("c143", "A+", 5, 1500);

CREATE TABLE Enrolls(
    enrollID varchar(10) PRIMARY KEY,
    crn varchar(50),
    courseID varchar(50),
    enroll_date DATE,
    complete_date DATE,
    FOREIGN KEY (crn) REFERENCES Students(crn),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);

INSERT INTO Enrolls(enrollID, crn, courseID, enroll_date, complete_date)
VALUES
("e13","058/bct778","c111", "2003-01-23","2003-06-01"),
("e12","058/bct766","c111", "2003-01-23",null),
("e14","058/bct766","c123", "2004-06-01",null),
("e15","058/bct766","c111", "2004-06-01",null),
("e18","058/bct779","c111", "2004-06-01",null),
("e20","058/bct729","c143", "2006-01-23",null),
("e21","058/bct730","c143", "2006-01-23",null);

INSERT INTO Enrolls VALUES("e23", "058/bct766","e122",null,null);

SELECT * FROM 
Students CROSS JOIN Enrolls;

SELECT * FROM
Students NATURAL JOIN Enrolls;

----
SELECT crn, name, enroll_date
FROM Students NATURAL JOIN Enrolls NATURAL JOIN Courses
WHERE course_name = "java";

SELECT Students.crn, Students.name, Enrolls.enroll_date
FROM Students
JOIN Enrolls ON Students.crn = Enrolls.crn
JOIN Courses ON Enrolls.courseID = Courses.courseID
WHERE Courses.course_name = 'java';
---

SELECT DISTINCT(S.crn), S.name, S.address
FROM Students AS S JOIN Enrolls AS E ON S.crn = E.crn
WHERE E.enroll_date = "2004-06-01";


SELECT S.name
FROM Students AS S
JOIN Enrolls AS E ON S.crn = E.crn
JOIN Courses AS C ON E.courseID = C.courseID
WHERE C.course_name IN ('java', 'linux')
GROUP BY S.name
HAVING COUNT(DISTINCT C.course_name) = 2;


DELETE FROM Students WHERE crn = "058/bct779"; -- Error

DELETE FROM Students 
WHERE crn = (SELECT crn FROM Enrolls WHERE enrollID = 'e12');

DELETE Students 
FROM Students
JOIN Enrolls ON Students.crn = Enrolls.crn
JOIN Courses ON Enrolls.courseID = Courses.courseID
WHERE Courses.fee < 2000;

CREATE VIEW Student_Info AS
SELECT crn, name, address FROM Students;

CREATE VIEW Student_Course AS
SELECT S.crn, S.name, S.phone_number, C.course_name, E.enroll_date
FROM Students AS S
JOIN Enrolls AS E ON S.crn = E.crn
JOIN Courses AS C ON C.courseID = E.courseID;

CREATE VIEW Linux_Students AS
SELECT Students.crn, Students.name
FROM Students
JOIN Enrolls ON Students.crn = Enrolls.crn
JOIN Courses ON Enrolls.courseID = Courses.courseID
WHERE Courses.course_name = 'linux';

DROP TABLE Student_Course;

DROP TABLE Students;