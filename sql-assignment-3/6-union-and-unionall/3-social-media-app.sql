USE SocialMediaApp;

SELECT CAST(Content AS VARCHAR(MAX)) AS AllContent
FROM Posts
UNION
SELECT Username
FROM Users;


SELECT CAST(Content AS VARCHAR(MAX)) AS AllContent
FROM Posts
UNION ALL
SELECT Username
FROM Users;