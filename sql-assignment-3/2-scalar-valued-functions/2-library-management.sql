USE LibraryManagement;


GO

CREATE FUNCTION CalculateAuthorAge(@BirthDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @CurrentDate DATE = GETDATE();
    DECLARE @Age INT;

    SET @Age = YEAR(@CurrentDate) - YEAR(@BirthDate);

    RETURN @Age;
END;
---------------------------------------------------------------------------------------------------------------------------------------------------
GO
CREATE FUNCTION IsBookOnLoan(@BookID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsOnLoan BIT;

    SELECT @IsOnLoan = CASE 
                        WHEN EXISTS (SELECT 1 FROM Loans WHERE BookID = @BookID AND Status = 'Active')
                        THEN 1
                        ELSE 0
                    END;

    RETURN @IsOnLoan;
END;

---------------------------------------------------------------------------------------------------------------------------------------------------
GO
SELECT AuthorID, FirstName, LastName, dbo.CalculateAuthorAge(BirthDate) AS Age
FROM Authors;

SELECT BookID, Title, dbo.IsBookOnLoan(BookID) AS IsOnLoan
FROM Books;