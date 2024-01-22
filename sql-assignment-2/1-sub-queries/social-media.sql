SELECT Content, Likes
FROM Posts
WHERE Likes IN (SELECT Likes FROM Posts WHERE Likes > 10);

SELECT UserID1, UserID2
FROM Friends
WHERE FriendshipStatus IN (SELECT FriendshipStatus FROM Friends WHERE FriendshipStatus='Pending');

SELECT UserName, BirthDate
FROM Users
WHERE BirthDate IN (SELECT BirthDate FROM Users WHERE BirthDate > '1995-01-01');