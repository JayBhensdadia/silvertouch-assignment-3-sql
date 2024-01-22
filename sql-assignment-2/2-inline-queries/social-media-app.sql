SELECT Posts.PostID, Users.Username, Posts.Content, Posts.PostDate, Posts.Likes, Posts.Comments
FROM Posts
JOIN Users ON Posts.UserID = Users.UserID;

SELECT Notifications.NotificationID, Users.Username, Notifications.NotificationText, Notifications.NotificationDate
FROM Notifications
JOIN Users ON Notifications.UserID = Users.UserID
WHERE Notifications.IsRead = 0;


SELECT Posts.Content, Comments.CommentText
FROM Comments
JOIN Posts ON Comments.PostID = Posts.PostID
