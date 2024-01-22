USE SocialMediaApp;

GO
CREATE VIEW PostsWithUserDetails AS
SELECT 
    Posts.PostID,
    Posts.Content,
    Posts.PostDate,
    Posts.Likes,
    Posts.Comments,
    Users.FirstName AS PostFirstName,
    Users.LastName AS PostLastName,
    Users.Username AS PostUsername
FROM 
    Posts
JOIN 
    Users ON Posts.UserID = Users.UserID;

------------------------------------------------------------

GO
CREATE VIEW PostWithComments AS
SELECT 
    Posts.PostID,
	Posts.Content,
	Comments.CommentText
FROM 
    Posts
JOIN 
    Comments ON Comments.PostID = Posts.PostID;

----------------------------------------------------------------------------
GO
SELECT * FROM PostsWithUserDetails;


SELECT * FROM PostWithComments;