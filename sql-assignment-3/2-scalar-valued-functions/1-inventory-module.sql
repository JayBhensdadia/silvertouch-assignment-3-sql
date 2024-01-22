USE InventoryModule;

GO

CREATE FUNCTION CalculateDiscountedPrice
(
	@OriginalPrice DECIMAL(10,2),
	@DiscountPercentage DECIMAL(5,2)
)
RETURNS DECIMAL(10,2) AS 
BEGIN

	DECLARE @DiscountedPrice DECIMAL(10,2);
	SET @DiscountedPrice = @OriginalPrice  - (@OriginalPrice * @DiscountPercentage / 100.0);
	RETURN @DiscountedPrice;

END;


GO

CREATE FUNCTION CalculateTotalOrderAmount( @OrderID INT ) RETURNS DECIMAL(12,2) AS
BEGIN
	DECLARE @TotalAmount DECIMAL(12,2);

	SELECT @TotalAmount = SUM(PurchaseOrder.TotalAmount)
	FROM PurchaseOrder
	WHERE PurchaseOrder.OrderID = @OrderID

	RETURN @TotalAmount;
END;

GO

DECLARE @OrderID INT = 1;
SELECT dbo.CalculateTotalOrderAmount(@OrderID) AS TotalOrderAmount;

DECLARE @DiscountPercentage DECIMAL(5,2)= 10.0;
SELECT 
	UnitPrice,
	dbo.CalculateDiscountedPrice(UnitPrice, @DiscountPercentage) AS DiscountedPrice
FROM Product;