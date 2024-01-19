

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE DEFAULT NULL,
);


CREATE TABLE Posts (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Content TEXT NOT NULL,
    PostDate DATETIME DEFAULT GETDATE(),
    Likes INT DEFAULT 0,
    Comments INT DEFAULT 0
);


CREATE TABLE Friends (
    FriendshipID INT PRIMARY KEY IDENTITY(1,1),
    UserID1 INT FOREIGN KEY REFERENCES Users(UserID),
    UserID2 INT FOREIGN KEY REFERENCES Users(UserID),
    FriendshipStatus VARCHAR(20) DEFAULT 'Pending',
    RequesterUserID INT DEFAULT NULL
);


CREATE TABLE Comments (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    PostID INT FOREIGN KEY REFERENCES Posts(PostID),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CommentText TEXT NOT NULL,
    CommentDate DATETIME DEFAULT GETDATE(),
    Likes INT DEFAULT 0
);


CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    NotificationText VARCHAR(255) NOT NULL,
    IsRead BIT DEFAULT 0,
    NotificationDate DATETIME DEFAULT GETDATE()
);