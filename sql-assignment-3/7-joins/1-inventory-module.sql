USE InventoryModule;


SELECT 
    Product.ProductName, 
    Category.CategoryName,
    Product.UnitPrice
FROM 
    Product
INNER JOIN 
    Category ON Category.CategoryID = Product.CategoryID;

-----------------------------------------------------------------
SELECT 
    Product.ProductName, 
    Category.CategoryName,
    Product.UnitPrice
FROM 
    Product
LEFT JOIN 
    Category ON Category.CategoryID = Product.CategoryID;

-------------------------------------------------------------------------
SELECT 
    Product.ProductName, 
    Category.CategoryName,
    Product.UnitPrice
FROM 
    Product
RIGHT JOIN 
    Category ON Category.CategoryID = Product.CategoryID;

---------------------------------------------------------------------------
SELECT 
    Product.ProductName, 
    Category.CategoryName,
    Product.UnitPrice
FROM 
    Product
FULL JOIN 
    Category ON Category.CategoryID = Product.CategoryID;
