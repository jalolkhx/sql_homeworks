create table Images
(
	id int primary key identity,
	img_data varbinary(max)
)

--"C:\Mac\Home\Pictures\bird.jpg"

insert into Images(img_data)
select * from openrowset( bulk 'C:\Mac\Home\Pictures\bird.jpg', single_blob) as img;

select * from Images;