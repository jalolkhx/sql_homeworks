
create table invoice(
	invoice_id int identity,
	amount decimal(38,2),
)

insert into invoice
values(2.5),
(4.5),
(5.5),
(7.5),
(8.5);

set identity_insert invoice on;