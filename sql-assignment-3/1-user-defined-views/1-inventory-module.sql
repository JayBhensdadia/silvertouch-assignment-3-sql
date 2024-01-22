USE InventoryModule;

GO

CREATE VIEW ProductWithCategory AS
SELECT
	Product.ProductID,
	Product.ProductName,
	Product.CategoryID,
	Category.CategoryName,
	Product.UnitPrice,
	Product.InStockQuantity

FROM
    Product
JOIN
    Category  ON Product.CategoryID = Category.CategoryID;



GO

CREATE VIEW PurchaseOrderDetails AS
SELECT
	PurchaseOrder.OrderID,
	PurchaseOrder.SupplierID,
	PurchaseOrder.OrderDate,
	PurchaseOrder.TotalAmount,
	PurchaseOrder.Status,
	OrderDetail.ProductID,
	OrderDetail.Quantity,
	OrderDetail.UnitPrice,
	OrderDetail.TotalPrice

FROM
	PurchaseOrder

JOIN
	OrderDetail ON PurchaseOrder.OrderID = OrderDetail.OrderID


GO

SELECT * FROM PurchaseOrderDetails;
SELECT * FROM ProductWithCategory;
