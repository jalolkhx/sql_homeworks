
select * 
from employees
order by Salary
offset 0 row
fetch first 10 rows only;

select Department, sum(Salary)/count(*) as newColumn
from Employees
group by Department
order by newColumn;

select Salary,avg(Salary) as Avg_salary, case
when
Salary>80000
then
'High'
when
Salary between 50000 and 80000
then
'Medium'
else 'Low'
end as 'Salary category'
from Employees
group by department
order by Avg(Salary)
offset 2 rows
fetch next 5 rows only;