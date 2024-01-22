USE InventoryModule;


GO

CREATE PROCEDURE SelectProducts
AS
BEGIN
    SELECT 
        ProductID,
        ProductName,
        CategoryID,
        UnitPrice,
        InStockQuantity
    FROM 
        Product;
END;

-------------------------------------------------------------------
GO
CREATE PROCEDURE AddProduct
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @UnitPrice DECIMAL(10, 2),
    @InStockQuantity INT
AS
BEGIN
    INSERT INTO Product (ProductName, CategoryID, UnitPrice, InStockQuantity)
    VALUES (@ProductName, @CategoryID, @UnitPrice, @InStockQuantity);
END;

----------------------------------------------------------------------------------
GO
CREATE PROCEDURE DeleteProduct
    @ProductID INT
AS
BEGIN
    DELETE FROM Product
    WHERE
        ProductID = @ProductID;
END;
---------------------------------------------------------------------------------
GO
CREATE PROCEDURE UpdateProduct
    @ProductID INT,
    @ProductName VARCHAR(50),
    @CategoryID INT,
    @UnitPrice DECIMAL(10, 2),
    @InStockQuantity INT
AS
BEGIN
    UPDATE Product
    SET 
        ProductName = @ProductName,
        CategoryID = @CategoryID,
        UnitPrice = @UnitPrice,
        InStockQuantity = @InStockQuantity
    WHERE
        ProductID = @ProductID;
END;

---------------------------------------------------------------------------
GO
CREATE PROCEDURE DisplayProductWithCategory
	@ProductID INT
AS
BEGIN
	SELECT * 
	FROM Product
	JOIN Category ON Product.CategoryID = Category.CategoryID
END;

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
GO

EXEC AddProduct 
	@ProductName = 'Mobile',
	@CategoryID = 1,
	@UnitPrice = 59.9,
	@InStockQuantity = 100;

EXEC SelectProducts;

EXEC UpdateProduct
	@ProductID = 1003,
	@ProductName = 'Smart Phone',
	@CategoryID = 1,
	@UnitPrice = 59.9,
	@InStockQuantity = 100;
EXEC SelectProducts;

EXEC DisplayProductWithCategory @ProductID = 1003;

EXEC DeleteProduct @ProductID = 1003;
EXEC SelectProducts;


