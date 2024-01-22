USE SocialMediaApp;

CREATE NONCLUSTERED INDEX IX_Users_Username
ON Users (Username);

CREATE NONCLUSTERED INDEX IX_Posts_PostID
ON Posts (PostID);