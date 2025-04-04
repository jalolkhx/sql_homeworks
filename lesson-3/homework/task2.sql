
select case
	when
	Status in ('Shipped', 'Delivered')
	then
	'Complated'
	when
	Status = 'Pending'
	then
	'Pending'
	when
	Status = 'Canceled'
	then
	'Canceled'
	end as OrderStatus,
	Count(*) as TotalOrders,
	Sum(TotalAmount) as totalRevenue
from Orders
where OrderDate between '2023-01-01' and '2023-12-31'
group by 
case
	when
	Status in ('Shipped', 'Delivered')
	then
	'Complated'
	when
	Status = 'Pending'
	then
	'Pending'
	when
	Status = 'Canceled'
	then
	'Canceled'
end 
having sum(TotalAmount) > 5000
order by totalRevenue desc;