USE InventoryModule;



SELECT ProductName, ASCII(ProductName) AS ASCIIValueOfProductName
FROM Product;

SELECT ProductName, UPPER(ProductName) AS UppercasedProductName
FROM Product;

SELECT ProductName, LEFT(ProductName,3) AS First3CharOfProductName
FROM Product;


SELECT Description, DATALENGTH(Description) AS LenOfDescription
FROM Category;

SELECT Category.CreatedDate, FORMAT(Category.CreatedDate, 'yyyy-MM-dd') AS FormatedDate
FROM Category;

SELECT Category.CategoryName, TRIM(Category.CategoryName) AS TrimmedName
FROM Category;






SELECT ProductName, UnitPrice, ABS(UnitPrice) AS AbsoluteUnitPrice
FROM Product;

SELECT ProductName, InStockQuantity, CEILING(InStockQuantity/10.0) AS CeilingQuantityDividedBy10
FROM Product;

SELECT UnitPrice, FLOOR(UnitPrice) AS FloorValuedUnitPrice
FROM Product;


SELECT CategoryName, DATEDIFF(DAY, CreatedDate, GETDATE()) AS DaysSinceCreation
FROM Category;

SELECT CategoryName, ROUND(DATALENGTH(Description) / 2.0, 0) AS HalfLengthOfDescription
FROM Category;

SELECT CategoryName, POWER(2, 3) AS PowerOf2ToThe3rd
FROM Category;






SELECT ProductID, ProductName, 
       COALESCE(NULLIF(ProductName, ''), 'No Name Available') AS DisplayProductName
FROM Product;


SELECT ProductID, ProductName, UnitPrice,
       IIF(UnitPrice > 50, 'High Price', 'Low Price') AS PriceCategory
FROM Product;


SELECT ProductID, ProductName, ISNULL(InStockQuantity, 0) AS DisplayQuantity
FROM Product;




SELECT CategoryID, CategoryName, COALESCE(Description, 'No Description Available') AS UpdatedDescription
FROM Category;


SELECT UnitPrice, CONVERT(INT, UnitPrice) AS IntegerUnitPrice
FROM OrderDetail;


SELECT OrderID, NULLIF(Status,'Pending') AS NullIfPending
FROM PurchaseOrder;