USE InventoryModule;

----------------------------------------------------------------------------
GO

CREATE TRIGGER LogInsertAttempt
ON Product
FOR INSERT
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
CREATE TRIGGER LogUpdateAttemptBefore
ON Product
FOR UPDATE
AS
BEGIN
    PRINT 'BEFORE UPDATE Trigger: Attempting to update a product.';
END;

------------------------------------------------------------------------------
GO

CREATE TRIGGER LogUpdateAttemptAfter
ON Product
AFTER UPDATE
AS
BEGIN
    PRINT 'AFTER UPDATE Trigger: Product successfully updated.';
END;

------------------------------------------------------------------------------
GO
CREATE TRIGGER LogDeleteAttemptBefore
ON Product
FOR DELETE
AS
BEGIN
    PRINT 'BEFORE DELETE Trigger: Attempting to delete a product.';
END;
----------------------------------------------------------------------
GO

CREATE TRIGGER LogDeleteAttemptAfter
ON Product
AFTER DELETE
AS
BEGIN
    PRINT 'AFTER DELETE Trigger: Product successfully deleted.';
END;
-------------------------------------------------------------------------------
GO
INSERT INTO Product (ProductName, CategoryID, UnitPrice, InStockQuantity)
VALUES ('TestProduct2', 1, 19.99, 50);

EXEC SelectProducts;

EXEC DisplayProductWithCategory @ProductID = 1;

UPDATE Product
SET UnitPrice = 29.30
WHERE ProductName = 'TestProduct2';

DELETE FROM Product
WHERE ProductName = 'TestProduct2';