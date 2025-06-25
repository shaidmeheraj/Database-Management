-- Find the titles of courses in the Comp. Sci. department that have 3 credits.

select title
from course
where dept_name = 'Comp. Sci.' and credits= 3;

-- 2  Find the IDs of all students who were taught by an instructor named Einstein; make sure there are no duplicates in the result.

select t.id
from takes as t
JOIN teaches as te
ON t.course_id = te.course_id
AND t.sec_id = te.sec_id
AND t.semester = te.semester
AND t.year = te.year
where te.ID = ( 
   select id 
   from instructor
   where name = 'Einstein'
   );

-- ANOTHER WAY:
select t.id
from takes as t
JOIN teaches as te
ON t.course_id = te.course_id
AND t.sec_id = te.sec_id
AND t.semester = te.semester
AND t.year = te.year
JOIN instructor as i
ON te.id = i.id
where i.name = 'Einstein';

-- 3. Find the ID and name of each student who has taken at least one Comp. Sci. course; make sure there are no duplicate names in the result.
select distinct s.id, s.name
from student as s
join takes as t
ON s.id = t.id
where t.course_id IN (
           select course_id
		   from course 
		   where dept_name = 'Comp. Sci'
		   );

-- 4. Find the course id, section id, and building for each section of a Biology course.

select s.course_id, s.sec_id, s.building
from section as s
JOIN course as c
On s.course_id = c.course_id
where dept_name = 'Biology';

-- 5. Output instructor names sorted by the ratio of their salary to their department’s budget (in ascending order).

select i.name
from instructor as i
join department as d 
On i.dept_name = d.dept_name
order by (i.salary / d.budget ) ASC;

-- another solution 
SELECT instructor.name
FROM instructor
LEFT JOIN department ON instructor.dept_name = department.dept_name
ORDER BY (instructor.salary / department.budget) ASC;

-- 6. Output instructor names and buildings for each building an instructor has taught in. Include instructor names who have not taught any classes (the building name should be NULL in this case).
select i.name, s.building
from instructor as i
LEFT JOIN teaches as t
ON t.id = i.id
LEFT JOIN section as s
ON s.course_id = t.course_id
AND s.sec_id = t.sec_id
AND s.semester = t.semester
AND s.year = t.year;

-- Another solution:-
SELECT i.name, s.building
FROM instructor as i
LEFT JOIN teaches as t 
    ON i.ID = t.ID
LEFT JOIN section as s 
    ON t.course_id = s.course_id 
    AND t.sec_id = s.sec_id 
    AND t.semester = s.semester 
    AND t.year = s.year;

-- 36. List all departments along with the number of instructors in each department.
select d.dept_name, count(i.ID) 
from department as d
LEFT JOIN instructor as i 
ON d.dept_name = i.dept_name
Group By d.dept_name;

-- another code
SELECT d.dept_name, COUNT(i.ID) AS instructor_count
FROM department as d
LEFT JOIN instructor as i ON d.dept_name = i.dept_name
GROUP BY d.dept_name;

-- 35.Find the maximum across all departments of the total salary at each department.
SELECT TOP 1  SUM(i.salary) as total_salary
from instructor as i
JOIN department as d 
ON d.dept_name = i.dept_name
group by i.dept_name
order by total_salary desc;
-- Top 1 mean maximum from all department
-- another
SELECT TOP 1 SUM(i.salary) AS total_salary
FROM department as d
JOIN instructor as i ON d.dept_name = i.dept_name
GROUP BY i.dept_name
ORDER BY total_salary DESC;

--Find the average instructors’ salaries of those departments where the average salary is greater than $42,000.
select distinct dept_name, avg(salary) as salary
from instructor
group by dept_name
having avg(salary) > 42000;

-- 33.Find all courses that were offered at least twice in 2009.
select course_id
from takes
where year = 2009
group by course_id
having count(*) > 1;

-- 32.Find all courses that were offered at most once in 2009.
select course_id
from takes
where year = 2009
group by course_id
having count(*) = 1;

-- 30.Find all courses taught in both the Fall 2009 semester and in the Spring-2010 semester.
select course_id 
from teaches
where (semester = 'Fall' and year = 2009) and ( semester = 'Spring' and year = 2010);
--another
select course_id from teaches
where semester = 'Fall' and year = 2009 intersect 
(select course_id from teaches where semester = 'Spring' and year = 2010);

-- 29.Find the departments that have the highest average salary.
select top 1 dept_name, avg(salary)
from instructor
group by dept_name
order by avg(salary) desc;

-- 28.Find the names of all instructors that have a salary value greater than that of each instructor in the Biology department.
select name
from instructor
where salary > ( select max(salary)
from instructor where dept_name = 'Biology');

-- another
select name 
from instructor 
where salary > (
select max(salary)
from instructor 
where dept_name = 'Biology'
);

-- 27. Find the ID and names of all instructors whose salary is greater than at least one instructor in the History department.
select id, name
from instructor
where salary > ( select min(salary)
from instructor where dept_name = 'History');

-- 26.Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 110011.
select count(distinct s.id)
from student as s join  takes as t 
on s.id = t.id
join section as sc
on t.course_id = sc.course_id 
and t.sec_id = sc.sec_id 
and t.semester = sc.semester
and t.year = sc.year
join teaches as tc
on sc.course_id = tc.course_id
and sc.sec_id = tc.sec_id 
and sc.semester = tc.semester
and sc.year = tc.year
where tc.id = '110011';

