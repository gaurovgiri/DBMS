CREATE DATABASE lab2;

USE lab2

CREATE TABLE Employees
(
    Empid int PRIMARY KEY,
    Name varchar(50) not null,
    phone varchar(50),
    designation varchar(50) not null,
    hiredate date,
    sal int not null,
    comm int,
    deptno int not null
);

INSERT INTO Employees (Empid, Name, Phone, designation, hiredate, sal, comm, deptno) VALUES
    (700, "Krish", 424572, "Clerk", "1990-12-01", 4000, null, 10),
    (1500, "Saroj", 552222, "Manager", "1990-01-01",2000, 370, 20),
    (1099, "Manoj", 678799, "Accountant", "1991-01-01", 12000, 500, 10),
    (1045, "Sita", null, "Clerk", "1980-07-03", 3500, 700, 20),
    (1011, "Manoj", 440245, "Sub-account", "1989-06-01", 1100, 23, 20),
    (1060, "Saroj", 552262, "Manager", "1990-01-01", 2000, 370, 20)
;

SELECT * FROM Employees;

UPDATE Employees SET sal = sal * 1.1;

UPDATE Employees SET phone = 542229 WHERE Name="Sita";

UPDATE Employees SET comm = comm + (sal * 0.1) WHERE hiredate < "1990-01-01";

UPDATE Employees SET sal = sal * 0.9 WHERE sal + comm > 12000;

UPDATE Employees SET sal = (sal + sal * 0.2) WHERE comm BETWEEN 500 AND 1000;

UPDATE Employees SET deptno = 10 WHERE Name = "Manoj";

UPDATE Employees SET deptno = 50 WHERE Empid = 1060;

DELETE FROM Employees WHERE Name = "Sita";

DELETE FROM Employees WHERE Empid = 1099;

UPDATE Employees 
SET deptno = 20, designation = "Manager", sal = (sal + 1000) 
WHERE Name="Krish";


SET @min = (SELECT MIN(sal) FROM Employees WHERE designation = "Manager");
UPDATE Employees
SET sal = @min
WHERE designation = "Sub-account";

TRUNCATE TABLE Employees;

