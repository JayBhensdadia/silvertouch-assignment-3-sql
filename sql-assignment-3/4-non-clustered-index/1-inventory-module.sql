USE InventoryModule;

CREATE NONCLUSTERED INDEX IX_Product_ProductName
ON Product (ProductName);

CREATE NONCLUSTERED INDEX IX_Category_CategoryName
ON Category (CategoryName);