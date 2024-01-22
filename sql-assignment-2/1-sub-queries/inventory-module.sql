SELECT ProductName, InStockQuantity
FROM Product
WHERE UnitPrice IN ( SELECT UnitPrice FROM Product WHERE UnitPrice < 100);

SELECT OrderID, Status 
FROM PurchaseOrder
WHERE Status IN (SELECT Status FROM PurchaseOrder WHERE Status = 'Pending');

SELECT OrderID, TotalPrice
FROM OrderDetail
WHERE TotalPrice IN (SELECT TotalPrice FROM OrderDetail WHERE TotalPrice > 1000);