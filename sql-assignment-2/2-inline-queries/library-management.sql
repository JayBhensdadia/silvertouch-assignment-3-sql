SELECT Title, Author, Description
FROM Books
JOIN Categories ON Books.Genre = Categories.CategoryName;


SELECT Loans.LoanID, Users.FirstName, Users.LastName, Books.Title, Loans.LoanDate
FROM Loans
JOIN Users ON Loans.UserID = Users.UserID
JOIN Books ON Loans.BookID = Books.BookID
WHERE Loans.Status = 'Active';


SELECT FirstName, LastName
FROM Authors
WHERE Nationality = 'American';