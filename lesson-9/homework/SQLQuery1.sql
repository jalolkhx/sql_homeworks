declare @n int = 10;

with cte(n, factory) as (
	select 1, 1
	union all
	select n+1, factory*(n+1) from cte
	where n < @n )

select * from cte;

declare @m int = 10;

with cte2(m, fibbo1, fibbo2) as (
	select 1, 0, 1
	union all
	select m+1,fibbo2, fibbo1+fibbo2 from cte2
	where m < @m )

select m, fibbo2 as fibbonacci from cte2


