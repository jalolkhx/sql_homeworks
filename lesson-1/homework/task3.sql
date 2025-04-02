
create table orders(
	order_id int constraint constraint_order primary key,
	customer_name varchar(50),
	order_date varchar(50)
);

alter table orders
drop constraint constraint_order;
alter table orders
add constraint constraint_order_new primary key(order_id);