CREATE DATABASE Lab;

CREATE TABLE Student(
    crn PRIMARY INT,
    name VARCHAR(50),
    phone_number VARCHAR(50)
);

-- Exercise the commands commit, rollback and save point after inserting, deleting and updating tuple in a relation student.

START TRANSACTION;

INSERT INTO Student VALUES(1, 'John', '1234567890');
INSERT INTO Student VALUES(2, 'Doe', '1234567890');
INSERT INTO Student VALUES(3, 'Jane', '1234567890');

COMMIT;

START TRANSACTION;
DELETE FROM Student WHERE crn = 3;
ROLLBACK;

UPDATE Student SET name = 'Doe' WHERE crn = 2;
SAVEPOINT Doe;
UPDATE Student SET name = 'Jane' WHERE crn = 2;
ROLLBACK TO Doe;


-- Create user u1 identified by u1.Then login as u1 .Try using databases. Comment.

CREATE USER 'u1'@'localhost' IDENTIFIED by 'u1';

GRANT UPDATE,DELETE,CREATE on lab.* TO 'u1'@'localhost';

show grants;


CREATE TABLE Employee(
    emp_id INT PRIMARY KEY,
    dept_id INT
);
