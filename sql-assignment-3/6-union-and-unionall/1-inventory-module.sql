USE InventoryModule;

SELECT ProductName AS AllNames
FROM Product
UNION 
SELECT SupplierName FROM Supplier;

SELECT ProductName AS AllNames
FROM Product
UNION ALL
SELECT SupplierName FROM Supplier;