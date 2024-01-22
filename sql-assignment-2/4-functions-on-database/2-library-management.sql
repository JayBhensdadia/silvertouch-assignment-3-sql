
USE LibraryManagement


SELECT Title, ASCII(Title) AS ASCIIValueOfTitle
FROM Books;



SELECT Author, UPPER(Author) AS UppercasedAuthor
FROM Books;


SELECT Title, LEFT(Title, 3) AS First3CharOfTitle
FROM Books;


SELECT FirstName, LEN(FirstName) AS LenOfFirstName
FROM Authors;

SELECT LastName, CONCAT('Author: ', FirstName, ' ', LastName) AS FullAuthorName
FROM Authors;


SELECT UserID, DATEDIFF(YEAR, JoinDate, GETDATE()) AS YearsSinceJoining
FROM Users;

SELECT UserID, LEN(Email) AS LenOfEmail
FROM Users;




SELECT LoanID, Status, 
       IIF(Status = 'Active', 'Still Active', 'Inactive') AS LoanStatus
FROM Loans;

SELECT UserID, 
       ISNULL(NULLIF(Email, ''), 'No Email Provided') AS DisplayEmail
FROM Users;