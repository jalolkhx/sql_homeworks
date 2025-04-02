-- DEFAULT Constraint
--Create a table named customer with:
--customer_id (integer, primary key)
--name (string, no constraint)
--city (string, should have a default value of 'Unknown')
--First, define the default value inside CREATE TABLE.
--Then, drop and re-add the default constraint using ALTER TABLE.

create table customer(
	customer_id int primary key,
	name varchar(50),
	city varchar(50) constraint city_id default 'Unknown'
)
alter table customer drop constraint city_id;
alter table customer add constraint city_id_new default 'Unknown' for city;