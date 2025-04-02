create table product(
	product_id int constraint id_name unique,
	product_name varchar(50),
	price decimal(38,2)
)

alter table product
drop constraint id_name;

alter table product
add constraint unique_product unique(product_id, product_name)