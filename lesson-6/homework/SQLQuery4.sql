USE NewDB;

-- Drop and create Departments table
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Drop and create Employees table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT NULL,
    Salary INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Drop and create Projects table
DROP TABLE IF EXISTS Projects;
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    EmployeeID INT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

-- Insert data into Projects
INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);


select * from Departments;
select * from Employees;
select * from Projects;

select e.Name, d.DepartmentName
from Employees as e
inner join Departments as d
on e.DepartmentID = d.DepartmentID

select e.Name, d.DepartmentName
from Employees as e
left outer join Departments as d
on e.DepartmentID = d.DepartmentID

select e.Name, d.DepartmentName
from Employees as e
right outer join Departments as d
on e.DepartmentID = d.DepartmentID

select e.Name, d.DepartmentName
from Employees as e
full outer join Departments as d
on e.DepartmentID = d.DepartmentID

select d.DepartmentName, sum(e.Salary) as TotalSalaryExpense
from Employees as e
inner join Departments as d
on d.DepartmentID = e.DepartmentID
group by d.DepartmentName

select d.DepartmentName, p.ProjectName
from Departments as d
cross join Projects as p

select newTable.*, p.ProjectName
from (select e.EmployeeID, e.Name, d.DepartmentName
from Employees as e
inner join Departments as d
on e.DepartmentID = d.DepartmentID) as newTable
left outer join Projects as p
on newTable.EmployeeID = p.EmployeeID