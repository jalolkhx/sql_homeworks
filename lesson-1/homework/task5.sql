create table account(
	account_id int primary key,
	balance decimal(38,2) constraint balance_id check(balance>=0),
	account_type varchar(50) constraint account_type_id check(account_type='Saving' or account_type='Checking')
);
alter table account drop constraint balance_id, account_type_id;
alter table acoount add constraint balance_id_new check(balance>0);
alter table account add constraint account_type_id_new check(account_type='Saving' or account_type='Checking');