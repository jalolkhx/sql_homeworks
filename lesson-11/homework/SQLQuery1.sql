CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary)
VALUES
    (1, 'Alice', 'HR', 5000),
    (2, 'Bob', 'IT', 7000),
    (3, 'Charlie', 'Sales', 6000),
    (4, 'David', 'HR', 5500),
    (5, 'Emma', 'IT', 7200);

select * from Employees

select * 
into #EmployeeTransfers
from Employees
where 0 = 1;

insert into #EmployeeTransfers (EmployeeID, Name, Department, Salary)
select 
	EmployeeID,
	Name,
	case 
		when Department = 'HR' then 'IT'
		when Department = 'IT' then 'Sales'
		when Department = 'Sales' then 'HR'
		else Department
		end as Department,
	Salary
from Employees

select * from #EmployeeTransfers;

--=====================================
CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB1 VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Orders_DB2 VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);

declare @MissingOrders table (
	OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

with cte as(
	select o1.* 
	from Orders_DB1 as o1
	left join Orders_DB2 as o2
	on o1.OrderID = o2.OrderID
	where o2.Quantity is NULL
)
insert into @MissingOrders
select * from cte;

select * from @MissingOrders;

--===============================================

CREATE TABLE WorkLog (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    WorkDate DATE,
    HoursWorked INT
);

INSERT INTO WorkLog VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);

select * from WorkLog;


create view vw_MonthlyWorkSummary as
	select EmployeeID, EmployeeName, sum(HoursWorked) as TotalHoursWorked
	from WorkLog
	group by EmployeeID, EmployeeName;

go

create view vw_MonthlyWorkSummaryDep as
	select Department, sum(HoursWorked) as TotalHoursDepartment, avg(HoursWorked) as AvgHoursDepartment
	from WorkLog
	group by Department;

select * from vw_MonthlyWorkSummary;
select * from vw_MonthlyWorkSummaryDep;



