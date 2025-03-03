-- 4(i) Create a database name as university. 
-- Create the course table in your database and insert the some tuples in your table as provided file. 
-- After completion of the query export the database in your desktop.

CREATE DATABASE University;
USE University;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Budget DECIMAL(10,2)
);



-- 4(ii) Find the names of those departments whose budget is higher than that of Astronomy. 
-- List them in alphabetic order

SELECT Department 
FROM Course 
WHERE Budget > (SELECT Budget FROM Course WHERE Department = 'Astronomy')
ORDER BY Department;



-- 4 (iii)Find the names of all instructors in the Computer Science department 
-- who have salary less than 90,000.

SELECT InstructorName 
FROM Instructor 
WHERE Department = 'Computer Science' AND Salary < 90000;


-- 4(iv)Find the number of instructors in each department 
-- who teach a course in the Spring-2010 semester.

SELECT Department, COUNT(InstructorID) AS InstructorCount 
FROM Instructor 
WHERE Semester = 'Spring-2010'
GROUP BY Department;

-- 4(v) Increase salaries of instructors whose 
-- salary is over $100,000 by 3.03% and all others by 4.5%

UPDATE Instructor 
SET Salary = 
    CASE 
        WHEN Salary > 100000 THEN Salary * 1.0303
        ELSE Salary * 1.045
    END;