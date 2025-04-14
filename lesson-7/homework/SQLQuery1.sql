create database DB2;
use DB2;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);
INSERT INTO Customers VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Orders VALUES 
(101, 1, '2024-01-01'), (102, 1, '2024-02-15'),
(103, 2, '2024-03-10'), (104, 2, '2024-04-20');

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 2, 10.00), (2, 101, 2, 1, 20.00),
(3, 102, 1, 3, 10.00), (4, 103, 3, 5, 15.00),
(5, 104, 1, 1, 10.00), (6, 104, 2, 2, 20.00);

INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics'), 
(2, 'Mouse', 'Electronics'),
(3, 'Book', 'Stationery');

select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;

select c.CustomerName, o.OrderID, o.OrderDate
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID

--=================

select t.CustomerName
from (select c.CustomerName, o.OrderID, o.OrderDate
from Customers as c
left join Orders as o
on c.CustomerID = o.CustomerID) as t
where t.OrderID is NULL

--=================

select o.OrderID, o.Quantity, p.ProductName
from OrderDetails as o
join Products as p
on o.ProductID = p.ProductID

--=================

select c.CustomerName, count(*) as OrderNumbers
from Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
group by c.CustomerName
having count(*) >= 2

--=================

select t.OrderID, p.ProductName, t.MaxPrice
from (select o.OrderID, max(o.Price) as MaxPrice
from OrderDetails as o 
join Products as p 
on p.ProductID = o.ProductID
group by o.OrderID) as t
join OrderDetails as o
on o.OrderID = t.OrderID and o.Price = t.MaxPrice
join Products as p
on p.ProductID = o.ProductID
order by t.OrderID

--====================

select CustomerName, max(OrderDate) as LatestOrder
from Customers as c
join Orders o
on c.CustomerID = o.CustomerID
group by CustomerName

--=====================

select c.CustomerName
from OrderDetails as o
join Products as p 
on o.ProductID = p.ProductID
join Orders
on Orders.OrderID = o.OrderID
join Customers as c
on c.CustomerID = Orders.CustomerID
group by c.CustomerName
having count(distinct case when Category != 'Electronics' then p.Category end)=0

--======================

select distinct c.CustomerName
from OrderDetails as o
join Products as p 
on o.ProductID = p.ProductID
join Orders
on Orders.OrderID = o.OrderID
join Customers as c
on c.CustomerID = Orders.CustomerID
where Category = 'Stationery'

--=======================

select distinct c.CustomerID, c.CustomerName, sum(o2.Price) over(partition by c.CustomerID) as [Total spent]
from Customers as c
join Orders as o1
on c.CustomerID = o1.CustomerID
join OrderDetails as o2
on o2.OrderID = o1.OrderID
