USE SocialMediaApp;

GO

CREATE TRIGGER LogInsertAttemptPosts
ON Posts
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'BEFORE INSERT Trigger: Attempting to insert a new post.';
END;

----------------------------------------------------------------------------------
GO

CREATE TRIGGER LogSuccessfulInsertPosts
ON Posts
AFTER INSERT
AS
BEGIN
    PRINT 'AFTER INSERT Trigger: Post successfully inserted.';
END;

-------------------------------------------------------------------------------
GO
CREATE TRIGGER LogUpdateAttemptBeforePosts
ON Posts
FOR UPDATE
AS
BEGIN
    PRINT 'BEFORE UPDATE Trigger: Attempting to update a post.';
END;

-------------------------------------------------------------------------------
GO

CREATE TRIGGER LogUpdateAttemptAfterPosts
ON Posts
AFTER UPDATE
AS
BEGIN
    PRINT 'AFTER UPDATE Trigger: Post successfully updated.';
END;
--------------------------------------------------------------------------------
GO
CREATE TRIGGER LogDeleteAttemptBeforePosts
ON Posts
FOR DELETE
AS
BEGIN
    PRINT 'BEFORE DELETE Trigger: Attempting to delete a post.';
END;
--------------------------------------------------------------------------------
GO

CREATE TRIGGER LogDeleteAttemptAfterPosts
ON Posts
AFTER DELETE
AS
BEGIN
    PRINT 'AFTER DELETE Trigger: Post successfully deleted.';
END;
--------------------------------------------------------------------------------
INSERT INTO Posts (UserID, Content)
VALUES (1, 'This is a test post.');

UPDATE Posts
SET Content = 'Updated post content'
WHERE PostID = 1003;

DELETE FROM Posts
WHERE PostID = 1003;

EXEC SelectPosts;