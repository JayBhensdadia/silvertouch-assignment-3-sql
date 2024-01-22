SELECT Title, Author
FROM Books
WHERE PublishedDate IN (SELECT PublishedDate FROM Books WHERE PublishedDate > '1930-01-01');


SELECT CategoryName, ShelfLocation, CategoryCode
FROM Categories
WHERE CategoryName IN (SELECT CategoryName FROM Categories WHERE CategoryName = 'Fiction');

Select UserID, BookID, LoanDate 
FROM Loans
WHERE Status IN (SELECT Status FROM Loans WHERE Status = 'Active');