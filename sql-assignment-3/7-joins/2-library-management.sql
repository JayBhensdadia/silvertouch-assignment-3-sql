USE LibraryManagement;

SELECT 
    Books.BookID, 
    Books.Title, 
    Books.Author, 
    Authors.FirstName, 
    Authors.LastName
FROM 
    Books
INNER JOIN 
    Authors ON Books.Author = CONCAT(Authors.FirstName, ' ', Authors.LastName);

	--------------------------------------------------------------------------------------
	SELECT 
    Books.BookID, 
    Books.Title, 
    Books.Author, 
    Authors.FirstName, 
    Authors.LastName
FROM 
    Books
LEFT JOIN 
    Authors ON Books.Author = CONCAT(Authors.FirstName, ' ', Authors.LastName);

	------------------------------------------------------------------------------------------

	SELECT 
    Books.BookID, 
    Books.Title, 
    Books.Author, 
    Authors.FirstName, 
    Authors.LastName
FROM 
    Books
RIGHT JOIN 
    Authors ON Books.Author = CONCAT(Authors.FirstName, ' ', Authors.LastName);

	----------------------------------------------------------------------------------------
	SELECT 
    Books.BookID, 
    Books.Title, 
    Books.Author, 
    Authors.FirstName, 
    Authors.LastName
FROM 
    Books
FULL JOIN 
    Authors ON Books.Author = CONCAT(Authors.FirstName, ' ', Authors.LastName);
