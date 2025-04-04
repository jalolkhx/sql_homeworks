
SELECT 
    Category,
    ProductName AS MostExpensiveProduct,
    Price,
    IIF(Stock = 0, 'Out of Stock', 
        IIF(Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM Products
WHERE Price IN (
    SELECT MAX(Price) 
    FROM Products 
    GROUP BY Category
)
ORDER BY Price DESC
OFFSET 5 ROWS;
