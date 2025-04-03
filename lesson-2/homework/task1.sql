-- DELETE vs TRUNCATE vs DROP (with IDENTITY example)
--Create a table test_identity with an IDENTITY(1,1) column and insert 5 rows.
--Use DELETE, TRUNCATE, and DROP one by one (in different test cases) and observe how they behave.
--Answer the following questions:
--What happens to the identity column when you use DELETE?
--What happens to the identity column when you use TRUNCATE?
--What happens to the table when you use DROP?

create table test_identity
(
	id int primary key identity,
	name varchar(50)
)

insert into test_identity(name)
values
('adam'), ('smith'), ('john'), ('david'), ('Gustabio');

delete from test_identity where id=5;

select * from test_identity;

truncate table test_identity;

drop table test_identity;

-- when we use delete for deleting all rows from table, next time when we are adding new row, identity will continue where it came lately. In short, it doesn't delete identity.
-- but for truncate, it will delate with identity keys
-- drop doesn't delete rows, it deletes table with all infos
