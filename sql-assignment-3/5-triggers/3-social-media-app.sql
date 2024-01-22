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
INSERT INTO Posts (UserID, Content)
VALUES (1, 'This is a test post.');