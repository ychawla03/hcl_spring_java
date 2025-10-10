create database company_db;
-- use database company_db;
-- select * from employees;
-- drop table employees;
create table employees( -- employees table created with 5 columns
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	department VARCHAR(50),
	salary DECIMAL(10,2)
);

insert into employees(name, age, department, salary) 
values('ABC', 25, 'IT', 1000000),
('MNO', 26, 'IT', 1200000),
('PQR', 24, 'IT', 110000);


-- delete from employees;
select * from staff where department = 'IT';

update employees set salary = '55000' where name = 'MNO';
delete from employees where id = 1;

alter table staff add column age varchar(100);
--alter table employees modify column salary decimal(12,2); -- mysql
alter table employees alter column salary set data type decimal(12,2);

ALTER TABLE employees RENAME COLUMN department TO dept_name;
select * from employees;
ALTER TABLE employees drop column age;
ALTER TABLE employees RENAME to staff;
select * from staff;

drop database company_db;




-- aliases or as keyword - temporary rename
select name as employeeName, salary as monthlysalary from staff;

-- to remove duplicates, we use distinct keyword
select distinct dept_name from staff; -- returns each department name
-- only once

select name, salary, salary * 12 as annualSalary
from staff;

select name, UPPER(dept_name) as DepartmentUpper from staff;

select name, salary from staff where salary > 100000;
-- =, !=, <, >, <=, >=
select name, salary from staff where salary between 100000 and 600000
and name like 'MN%';
select * from staff;
select name, salary from staff where (salary>=100000 and salary<=600000)
or name like 'MN%';
-- in operator, like(wildcard), and, or and not
select name, salary from staff where salary in (500000, 600000);
select name, salary from staff where salary not in (500000, 600000);
select name, salary from staff where salary between 100000 or 600000;
select name, salary from staff where salary::text like '%450%';

-- sort by
select name, salary from staff order by salary DESC -- ASC default
-- sort by department first and then by salary
select name, salary from staff order by dept_name asc, salary DESC;


select count(*) as totalEmployees from staff;
select sum(salary) as totalSalary from staff;
select avg(salary) as avgSalary from staff;
select min(salary) as lowestSalary, 
max(salary) as highestSalary from staff;

-- group by allows us to apply aggregates for each group of rows
-- usually grouped by column such as dept_name

select dept_name, count(*) as totalEmployees from staff
group by dept_name;
--having count(*)  != 1;

select dept_name, avg(salary) as totalEmployees from staff --format,cast
group by dept_name;

-- use HAVING with Aggregates
--  where filters before GROUPING
-- having filters after grouping

select * from staff;

select dept_name, count(*) as empCount,
min(salary) as min_salary,max(salary) as max_salary,
avg(salary) as avg_salary, sum(salary) as total_salary
from staff where salary > 120000
group by dept_name having avg(salary) > 1000000
order by avg_salary desc; 

-- if we ONLY have aggregate function in select clause - without group by
-- this will work perfectly fine

-- but if we another column with aggregate function in select clause 
-- logically in that case, always use group by on that column






CREATE TABLE order_items(
  order_id BIGINT, product_id BIGINT,
  quantity INT CHECK (quantity > 0),
  PRIMARY KEY (order_id, product_id), FOREIGN KEY (order_id)  
	REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id));