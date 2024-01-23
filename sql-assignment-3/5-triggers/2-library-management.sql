USE LibraryManagement;


GO


CREATE TRIGGER LogInsertAttempt
ON Books
FOR INSERT
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
GO
CREATE TRIGGER LogUpdateAttemptBeforeBooks
ON Books
FOR UPDATE
AS
BEGIN
    PRINT 'BEFORE UPDATE Trigger: Attempting to update a book.';
END;
------------------------------------------------------------------------------
GO

CREATE TRIGGER LogUpdateAttemptAfterBooks
ON Books
AFTER UPDATE
AS
BEGIN
    PRINT 'AFTER UPDATE Trigger: Book successfully updated.';
END;
--------------------------------------------------------------------------------
GO
CREATE TRIGGER LogDeleteAttemptBeforeBooks
ON Books
FOR DELETE
AS
BEGIN
    PRINT 'BEFORE DELETE Trigger: Attempting to delete a book.';
END;
--------------------------------------------------------------------------------
GO
CREATE TRIGGER LogDeleteAttemptAfterBooks
ON Books
AFTER DELETE
AS
BEGIN
    PRINT 'AFTER DELETE Trigger: Book successfully deleted.';
END;
----------------------------------------------------------------------------
INSERT INTO Books (Title, Author, Genre, PublishedDate)
VALUES ('The Test Book2', 'Test Author', 'Test Genre', '2023-01-01');

UPDATE Books
SET Genre = 'Updated Genre'
WHERE Title = 'The Test Book';

DELETE FROM Books
WHERE Title = 'The Test Book';

EXEC SelectBooks;
