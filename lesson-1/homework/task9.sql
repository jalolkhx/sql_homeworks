
create table Book(
	book_id int primary key,
	title varchar(50),
	author varchar(50),
	published_year int
)

create table Member(
	member_id int primary key,
	name varchar(50),
	email varchar(50),
	phone_number varchar(50)
)

create table Loan(
	loan_id int primary key,
	book_id int foreign key references Book(book_id),
	member_id int foreign key references Member(member_id),
	loan_date varchar(50),
	return_date varchar(50)
)

insert into Book values
(1, 'loviyapoya', 'jek', 1999),
(2, 'real', 'unknown', 1903);

insert into Member values
(1, 'zafar', 'xafar@gmail.com', '9993439433');

insert into Loan values
(1, 1, 1, 'bugun', 'ertaga'),
(2, 2, 1, 'bugun', 'ertaga');

select * from Member;
select * from Book;
select * from Loan;

