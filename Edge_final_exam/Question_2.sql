/* 2. In SQL Server, you need to track any salary changes made to employees in the Employees table. 
When an update occurs, the previous and new salary should be recorded in an EmployeeAudit table along with the modification timestamp.
Task: 
a. Create an EmployeeAudit table to store the audit history. 
b. Write a trigger that logs any salary changes when an update occurs in the Employees table. 
C. Test the trigger by updating an employee's salary and retrieving the audit records. 
*/

-- 2(a)
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing ID for audit records
    EmployeeID INT,                        -- ID of the employee
    OldSalary DECIMAL(10,2),              -- Salary before the update
    NewSalary DECIMAL(10,2),              -- Salary after the update
    ChangeDateTime DATETIME DEFAULT GETDATE() -- Timestamp of the change
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Salary DECIMAL(10,2)
);

-- 2(b)
CREATE TRIGGER trg_EmployeeSalaryAudit
ON Employees
AFTER UPDATE
AS
BEGIN
    -- Insert into EmployeeAudit by comparing old and new salary values
    INSERT INTO EmployeeAudit (EmployeeID, OldSalary, NewSalary)
    SELECT 
        i.EmployeeID, 
        d.Salary AS OldSalary, -- Old salary from the DELETED table
        i.Salary AS NewSalary  -- New salary from the INSERTED table
    FROM INSERTED i
    INNER JOIN DELETED d ON i.EmployeeID = d.EmployeeID
    WHERE i.Salary != d.Salary; -- Only log if the salary actually changed
END;

-- 2(c)
INSERT INTO Employees (EmployeeID, Salary)
VALUES (1, 50000.00);
UPDATE Employees
SET Salary = 55000.00
WHERE EmployeeID = 1;
SELECT * FROM EmployeeAudit;