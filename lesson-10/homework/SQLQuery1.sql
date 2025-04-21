
CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

INSERT INTO Shipments (N, Num) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 4), (15, 4), 
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), 
(23, 4), (24, 4), (25, 4), (26, 5), (27, 5), (28, 5), (29, 5), 
(30, 5), (31, 5), (32, 6), (33, 7);

select * from Shipments;

with cte(N, Num) as (
	select 1, 0
	union all
	select N+1, Num from cte
	where N<40
)


select sum(t1.Num)/2
from (select t.Num, ROW_NUMBER() over(order by t.Num) as rnk
	from (select GREATEST(cte.Num, s.Num) as Num
		from cte
		left join Shipments as s
		on cte.N = s.N) as t) as t1
where t1.rnk = 20 or t1.rnk = 21
