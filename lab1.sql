DROP DATABASE IF EXISTS Lab;

CREATE DATABASE Lab;

use Lab;

CREATE TABLE Employees
(
    Empno int PRIMARY KEY,
    Ename varchar(50),
    Job varchar(50),
    mgr int,
    hiredate date,
    sal int,
    comm int,
    deptno int
);

DESC Employees;

-- Inserting Multiple Values
INSERT INTO Employees(Empno, Ename, Job, mgr, hiredate, sal, comm, deptno) VALUES 
    (1,'Ram','Clerk',Null,'2007-01-26',5000,700,10),
    (2,'James','Clerk',Null,'2008-12-5',7000,800,20),
    (3,'Reema','Manager', Null,'2005-12-2',1500,1000,20),
    (4,'Manish','Manager',Null,'2005-07-5',25000,1500,10),
    (5,'Manoj','Analyst',Null,'2007-01-12',20000,1000,10),
    (6,'Saroj','Analyst',Null,'2008-12-05',25000,1100,20),
    (7,'Sameer','President',Null,'2005-01-02',50000,5000,10),
    (8,'Saroj','Salesman',Null,'2005-12-01',15000,1000,20),
    (9,'Sumi','Salesman',Null,'2007-01-01',18000,1100,20);


--1
SELECT * FROM Employees;

--2 
SELECT Ename, Job, sal FROM Employees;

--3
SELECT Ename FROM Employees WHERE Job = "Clerk";

--4
SELECT * FROM Employees WHERE deptno = 20 and Job = 'Clerk';

--5
SELECT Ename, Empno, Job FROM Employees WHERE Job = "Manager" OR Job = "Analyst";

--6
SELECT * FROM Employees WHERE Job <> "President" AND Job <> "Analyst";

--8
SELECT * FROM Employees WHERE sal BETWEEN 1100 AND 3000;

--9
SELECT * FROM Employees WHERE sal NOT BETWEEN 1600 AND 3500;

--10
SELECT DISTINCT Job FROM Employees;

--11
SELECT Ename FROM Employees WHERE Ename LIKE 'M%';

--12
SELECT Empno, Ename FROM Employees WHERE Ename LIKE '%ER';

--13
SELECT Ename FROM Employees WHERE EName LIKE 'J%S';

--14
SELECT Ename FROM Employees WHERE EName LIKE 'S____';

--15
SELECT Ename FROM Employees ORDER BY EName DESC;

--16
SELECT Ename, sal * 1.1 AS Incremented_Salary FROM Employees;

--17
SELECT Ename, comm * 1.1 AS Incremented_Commision FROM Employees;

--18
SELECT Ename, (sal+comm) AS Total_Salary FROM Employees WHERE deptno = 30;

--19
SELECT * FROM Employees WHERE Job = 'Manager' OR sal > 3000;

--20
SELECT SUM(sal) FROM Employees;

--21
SELECT COUNT(Empno) AS Total_Records FROM Employees;

--22
SELECT COUNT(DISTINCT deptno) FROM Employees;

--23
SELECT deptno, MAX(sal) AS Max_Salary
FROM Employees
GROUP BY deptno;

--24
SELECT * FROM Employees
WHERE sal = (SELECT MAX(sal) FROM Employees);

--25
SELECT DISTINCT deptno FROM Employees
WHERE sal > (SELECT AVG(sal) FROM Employees);

--26
SELECT deptno FROM Employees
GROUP BY deptno
HAVING MAX(sal) > 30000;