USE SocialMediaApp;

SELECT UserID, FirstName, LastName, ASCII(Username) AS ASCIIValueOfUsername
FROM Users;

SELECT FirstName, LastName, UPPER(Username) AS UppercasedUsername
FROM Users;

SELECT FirstName, LastName, LEFT(Username, 3) AS First3CharOfUsername
FROM Users;


SELECT Content, DATALENGTH(Content) AS LenOfContent
FROM Posts;

SELECT PostDate, FORMAT(PostDate, 'yyyy-MM-dd') AS FormattedPostDate
FROM Posts;


SELECT UserID1, UserID2, ABS(UserID2 - UserID1) AS AbsoluteUserIDDifference
FROM Friends;

SELECT UserID1, UserID2, CEILING(UserID2/10.0) AS CeilingUserID2DividedBy10
FROM Friends;

SELECT FriendshipStatus, FLOOR(LEN(FriendshipStatus) / 2.0) AS FloorLengthOfFriendshipStatus
FROM Friends;


SELECT PostID, UserID, DATEDIFF(MINUTE, CommentDate, GETDATE()) AS MinutesSinceComment
FROM Comments;

SELECT PostID, UserID, ROUND(Likes / 2.0, 0) AS RoundedLikes
FROM Comments;

SELECT PostID, UserID, POWER(Likes, 2) AS LikesSquared
FROM Comments;



SELECT UserID, NotificationText, 
       COALESCE(NULLIF(NotificationText, ''), 'No Text Available') AS DisplayNotificationText
FROM Notifications;

SELECT UserID, NotificationText, 
       IIF(IsRead = 1, 'Read', 'Unread') AS ReadStatus
FROM Notifications;

SELECT UserID, NotificationText, ISNULL(IsRead, 0) AS DisplayReadStatus
FROM Notifications;
