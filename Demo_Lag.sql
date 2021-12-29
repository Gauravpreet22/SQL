select MONTH(OrderDate) as 'Month Of Sale', 
SUM(SalesAmount) as 'Current Sales',
LAG(SUM(SalesAmount), 1, 0) OVER (order by MONTH(OrderDate)) as 'Previous Month Sales',
LAG(SUM(SalesAmount),2, 0) OVER (order by MONTH(OrderDate)) as 'Sales 2 Month ago',
LEAD(SUM(SalesAmount)) OVER (order by MONTH(OrderDate)) as 'Subsequent Month Sales'
from FactInternetSales fi
group by MONTH(OrderDate) 
order by MONTH(OrderDate)
