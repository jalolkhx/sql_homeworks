
create table category(
	category_id int primary key,
	category_name varchar(50)
)

create table item(
	item_id int primary key,
	item_name varchar(50),
	category_id int constraint foregin_key_constra_id foreign key references category(category_id)
)

alter table item
drop constraint foregin_key_constra_id;

alter table item
add constraint foregin_key_constra_id_new foreign key (category_id) references category(category_id);