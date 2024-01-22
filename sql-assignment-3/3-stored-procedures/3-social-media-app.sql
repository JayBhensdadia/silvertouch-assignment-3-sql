USE SocialMediaApp;
GO

CREATE PROCEDURE SelectPosts
AS
BEGIN
    SELECT 
        PostID,
        UserID,
        Content,
        PostDate,
        Likes,
        Comments
    FROM 
        Posts;
END;
--------------------------------------------------------------------
GO
CREATE PROCEDURE AddPost
    @UserID INT,
    @Content TEXT
AS
BEGIN
    INSERT INTO Posts (UserID, Content)
    VALUES (@UserID, @Content);
END;
---------------------------------------------------------------------
GO
CREATE PROCEDURE DeletePost
    @PostID INT
AS
BEGIN
    DELETE FROM Posts
    WHERE
        PostID = @PostID;
END;
-----------------------------------------------------------------------
GO
CREATE PROCEDURE UpdatePost
    @PostID INT,
    @Content TEXT
AS
BEGIN
    UPDATE Posts
    SET 
        Content = @Content
    WHERE
        PostID = @PostID;
END;
----------------------------------------------------------------------
GO
CREATE PROCEDURE DisplayPostWithUser
    @PostID INT
AS
BEGIN
    SELECT 
        Posts.PostID,
        Posts.UserID,
        Posts.Content,
        Posts.PostDate,
        Posts.Likes,
        Posts.Comments,
        Users.FirstName AS UserFirstName,
        Users.LastName AS UserLastName,
        Users.Username AS UserUsername
    FROM 
        Posts
    JOIN 
        Users ON Posts.UserID = Users.UserID
    WHERE
        Posts.PostID = @PostID;
END;
-----------------------------------------------------------------------------------------------

EXEC AddPost
    @UserID = 1,
    @Content = 'This is a new post.';


EXEC SelectPosts;


EXEC UpdatePost
    @PostID = 1,
    @Content = 'Updated content of the first post.';


EXEC SelectPosts;


EXEC DisplayPostWithUser @PostID = 1;


EXEC DeletePost @PostID = 1;

EXEC SelectPosts;