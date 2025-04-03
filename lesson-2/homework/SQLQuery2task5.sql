
create table import_csv 
(
	id int primary key,
	name varchar(50),
	age int,
	city varchar(50),
	score int
)

bulk insert import_csv
from 'C:sample_data.csv'
with
(
	firstrow = 2,
	fieldterminator = ',',
	rowterminator = '\n'
)

select * from import_csv;