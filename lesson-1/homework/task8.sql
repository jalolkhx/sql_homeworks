
create table books(
	book_id int primary key identity,
	title varchar(50) not null check(title<>''),
	price decimal(38,2) check(price>0),
	genre varchar(50) default 'Unknown'
)
insert into books(title, price) values 
	(1980, 25.20);
