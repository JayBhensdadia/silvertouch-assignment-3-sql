SELECT SupplierID, SupplierName
FROM Supplier
WHERE SupplierID IN ( SELECT SupplierID FROM PurchaseOrder WHERE Status='Shipped');

SELECT ProductName
FROM Product 
WHERE ProductID IN (SELECT ProductID FROM OrderDetail WHERE Quantity > 5);

SELECT SUM(TotalAmount) AS TotalPurchaseAmount
FROM PurchaseOrder;
