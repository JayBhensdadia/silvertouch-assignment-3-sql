USE InventoryModule;

----------------------------------------------------------------------------
GO
CREATE TRIGGER LogInsertAttempt
ON Product
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'BEFORE INSERT Trigger: Attempting to insert a new product.';
END;
-----------------------------------------------------------------------------

GO
CREATE TRIGGER LogSuccessfulInsert2
ON Product
AFTER INSERT
AS
BEGIN
    PRINT 'AFTER INSERT Trigger: Product successfully inserted.';
END;

---------------------------------------------------------------------------
GO
INSERT INTO Product (ProductName, CategoryID, UnitPrice, InStockQuantity)
VALUES ('TestProduct2', 1, 19.99, 50);



