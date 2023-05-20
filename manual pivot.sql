/*
create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);
*/

/*
insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);
select * from emp_compensation;
*/

/*
SELECT emp_id,
		SUM(CASE WHEN salary_component_type = 'salary' THEN val END) AS salary,
		SUM(CASE WHEN salary_component_type = 'bonus' THEN val END) AS bonus,
		SUM(CASE WHEN salary_component_type = 'hike_percent' THEN val END) AS hike_percent
INTO emp_compensation_pivot
FROM emp_compensation
GROUP BY 1
ORDER BY 1;
*/

SELECT * from (
SELECT emp_id, 'salary' AS salary_component_type, salary as val from emp_compensation_pivot
UNION
SELECT emp_id, 'bonus' AS salary_component_type, bonus as val from emp_compensation_pivot
UNION
SELECT emp_id, 'hike_percent' AS salary_component_type, hike_percent as val from emp_compensation_pivot
) foo
ORDER BY emp_id