USE SocialMediaApp;

SELECT 
    Posts.PostID, 
    Posts.Content, 
    Users.UserID, 
    Users.FirstName, 
    Users.LastName
FROM 
    Posts
INNER JOIN 
    Users ON Posts.UserID = Users.UserID;

----------------------------------------------------------
SELECT 
    Posts.PostID, 
    Posts.Content, 
    Users.UserID, 
    Users.FirstName, 
    Users.LastName
FROM 
    Posts
LEFT JOIN 
    Users ON Posts.UserID = Users.UserID;

--------------------------------------------------------------
SELECT 
    Posts.PostID, 
    Posts.Content, 
    Users.UserID, 
    Users.FirstName, 
    Users.LastName
FROM 
    Posts
RIGHT JOIN 
    Users ON Posts.UserID = Users.UserID;

--------------------------------------------------------------------
SELECT 
    Posts.PostID, 
    Posts.Content, 
    Users.UserID, 
    Users.FirstName, 
    Users.LastName
FROM 
    Posts
FULL JOIN 
    Users ON Posts.UserID = Users.UserID;
