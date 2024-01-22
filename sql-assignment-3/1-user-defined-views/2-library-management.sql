USE LibraryManagement;

GO
CREATE VIEW BookWithCategory AS
SELECT 
	Books.BookID,
	Books.Title,
	Books.Genre,
	Categories.Description,
	Categories.ShelfLocation

FROM 
	Books
JOIN 
	Categories ON Books.Genre = Categories.CategoryName;


--------------------------------------------------------------------
GO
CREATE VIEW UserWithLoanDetails AS
SELECT 
	Users.FirstName,
	Users.LastName,
	Loans.LoanDate,
	Loans.Status
FROM 
	Users
JOIN
	Loans ON Loans.UserID = Users.UserID;
------------------------------------------------------
GO
SELECT * FROM BookWithCategory;
SELECT * FROM UserWithLoanDetails;