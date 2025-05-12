-- Batch 18 Mid Exam

2. SELECT dept_name 
FROM department 
WHERE department.budget>(select budget
             FROM department
             WHERE dept_name='Astronomy');

3. SELECT name 
FROM instructor 
WHERE dept_name = 'Computer Science' 
AND salary < 90000;

4. SELECT instructor.dept_name, COUNT(DISTINCT teaches.ID) as instr_count
FROM instructor,teaches WHERE instructor.ID=teaches.ID
AND semester='Spring' and year=2010
GROUP BY dept_name;

5. update instructor set salary = salary*1.030
Where salary>100000;

update instructor set salary = salary*1.045
Where salary<=100000;

-- UPDATE instructor
-- SET salary = 
--     CASE 
--         WHEN salary > 100000 THEN salary * 1.0303
--         ELSE salary * 1.045
--     END;

