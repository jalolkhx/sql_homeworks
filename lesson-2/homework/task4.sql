create table student(
	id int primary key,
  	num_class int not null,
  	tuition_fee_perclass int not null,
	total_fee as (num_class*tuition_fee_perclass)

);
insert into student(id,num_class,tuition_fee_perclass) values(1, 3, 500);

select * from student;
