USE LibraryManagement;


GO


CREATE TRIGGER LogInsertAttempt
ON Books
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'BEFORE INSERT Trigger: Attempting to insert a new book.';
END;

---------------------------------------------------------------------------------
GO
CREATE TRIGGER LogSuccessfulInsert
ON Books
AFTER INSERT
AS
BEGIN
    PRINT 'AFTER INSERT Trigger: Book successfully inserted.';
END;

--------------------------------------------------------------------------------


INSERT INTO Books (Title, Author, Genre, PublishedDate)
VALUES ('The Test Book', 'Test Author', 'Test Genre', '2023-01-01');

