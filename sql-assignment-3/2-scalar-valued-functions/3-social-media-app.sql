USE SocialMediaApp;

GO


CREATE FUNCTION CalculateUserAge (@BirthDate DATE)
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


CREATE FUNCTION CountPostLikes (@PostID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLikes INT;

    SELECT @TotalLikes = Likes
    FROM Posts
    WHERE PostID = @PostID;

    RETURN @TotalLikes;
END;
------------------------------------------------------------------------

DECLARE @BirthDate DATE = '1990-05-15';

SELECT dbo.CalculateUserAge(@BirthDate) AS UserAge;


DECLARE @PostID INT = 1; 

SELECT dbo.CountPostLikes(@PostID) AS TotalLikes;