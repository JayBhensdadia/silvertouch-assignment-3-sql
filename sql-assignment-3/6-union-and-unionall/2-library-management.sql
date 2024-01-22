USE LibraryManagement;

SELECT Title AS AllNames
FROM Books
UNION
SELECT CONCAT(FirstName, ' ', LastName) AS AllNames
FROM Authors;

SELECT Title AS AllNames
FROM Books
UNION ALL
SELECT CONCAT(FirstName, ' ', LastName) AS AllNames
FROM Authors;