-- 1. Create a Relational Database for 
-- Employee Salary Maintenance with attributes EmployeeID (PK),
-- EmployeeName, Department, Salary, Month. From Employee Table, 
-- transform rows into columns in MYSQL.

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Month VARCHAR(20)
);
-- inserting value
INSERT INTO Employee (EmployeeID, EmployeeName, Department, Salary, Month)
VALUES
(1, 'Alice', 'HR', 50000, 'January'),
(1, 'Alice', 'HR', 50000, 'February'),
(2, 'Bob', 'IT', 60000, 'January'),
(2, 'Bob', 'IT', 60000, 'February'),
(3, 'Charlie', 'Finance', 55000, 'January'),
(3, 'Charlie', 'Finance', 55000, 'February');

-- Transform Rows into Columns
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SUM(CASE WHEN Month = 'January' THEN Salary ELSE 0 END) AS January,
    SUM(CASE WHEN Month = 'February' THEN Salary ELSE 0 END) AS February
FROM Employee
GROUP BY EmployeeID, EmployeeName, Department;