USE LibraryManagement;

GO

CREATE PROCEDURE SelectBooks
AS
BEGIN
    SELECT 
        BookID,
        Title,
        Author,
        Genre,
        PublishedDate
    FROM 
        Books;
END;
-------------------------------------------------------------------------------------
GO

CREATE PROCEDURE AddBook
    @Title VARCHAR(100),
    @Author VARCHAR(50),
    @Genre VARCHAR(50),
    @PublishedDate DATE
AS
BEGIN
    INSERT INTO Books (Title, Author, Genre, PublishedDate)
    VALUES (@Title, @Author, @Genre, @PublishedDate);
END;
----------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE DeleteBook
    @BookID INT
AS
BEGIN
    DELETE FROM Books
    WHERE
        BookID = @BookID;
END;
------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE UpdateBook
    @BookID INT,
    @Title VARCHAR(100),
    @Author VARCHAR(50),
    @Genre VARCHAR(50),
    @PublishedDate DATE
AS
BEGIN
    UPDATE Books
    SET 
        Title = @Title,
        Author = @Author,
        Genre = @Genre,
        PublishedDate = @PublishedDate
    WHERE
        BookID = @BookID;
END;
--------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE DisplayBookWithGenre
    @BookID INT
AS
BEGIN
    SELECT 
        Books.BookID,
        Books.Title,
        Books.Author,
        Books.Genre,
        Books.PublishedDate,
        Categories.Description,
        Categories.ShelfLocation
    FROM 
        Books
    JOIN 
        Categories ON Books.Genre = Categories.CategoryName
    WHERE
        Books.BookID = @BookID;
END;
--------------------------------------------------------------------
GO

EXEC AddBook
    @Title = 'The Hobbit',
    @Author = 'J.R.R. Tolkien',
    @Genre = 'Fantasy',
    @PublishedDate = '1937-09-21';

EXEC SelectBooks;

EXEC UpdateBook
    @BookID = 1,
    @Title = 'The Hobbit (Updated)',
    @Author = 'J.R.R. Tolkien',
    @Genre = 'Fantasy',
    @PublishedDate = '1937-09-21';

EXEC SelectBooks;

EXEC DisplayBookWithGenre @BookID = 1;

EXEC DeleteBook @BookID = 1;
EXEC SelectBooks;
