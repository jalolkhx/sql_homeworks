CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');

select * from Employees;

select *,
	DENSE_RANK() over(order by Salary asc) as rank
from Employees
order by EmployeeID;

select EmployeeID, Name, Department, Salary
from (select *,
	ROW_NUMBER() over(partition by Department order by Salary desc) as newRank
	from Employees) as table7
where newRank in (1,2)
order by EmployeeID;


select EmployeeID, Name, Department, Salary
from (select *,
	ROW_NUMBER() over(partition by Department order by Salary asc) as newRank
	from Employees) as table8
where newRank=1
order by EmployeeID;

select distinct Department,
	sum(Salary) over(partition by Department) as TotalSalaries
	from Employees;

select distinct Department,
	cast(AVG(Salary) over(partition by Department) as decimal(10,2)) as AvgSalaries
	from Employees;

select *,
	Abs(cast(Salary - (AVG(Salary) over(partition by Department)) as decimal(10,2))) as DifferenceAVG
	from Employees
order by EmployeeID;

select *,
	cast(AVG(Salary) over(order by EmployeeID rows between 1 preceding and 1 following) as decimal(10,2)) as AvgSalaries
	from Employees;

SELECT SUM(Salary) AS TotalSalary
FROM (
    SELECT TOP 3 Salary
    FROM Employees
    ORDER BY HireDate DESC
) AS LastHired;

select *,
	cast(AVG(Salary) over(order by EmployeeID) as decimal(10,2)) as AvgSalaries
	from Employees
	order by EmployeeID;

select *,
    MAX(Salary) OVER (ORDER BY EmployeeID ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS MaxSalarySlidingWindow
FROM Employees
ORDER BY EmployeeID;

select *,
	cast(100*Salary/sum(Salary) over() as decimal(10,2)) as Percentage_Contribution
from Employees
order by EmployeeID;