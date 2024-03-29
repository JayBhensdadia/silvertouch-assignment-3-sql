USE [master]
GO
/****** Object:  Database [SocialMediaApp]    Script Date: 23-01-2024 10:20:52 ******/
CREATE DATABASE [SocialMediaApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialMediaApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SocialMediaApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialMediaApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SocialMediaApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SocialMediaApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialMediaApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialMediaApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialMediaApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialMediaApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialMediaApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialMediaApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialMediaApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialMediaApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialMediaApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialMediaApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialMediaApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialMediaApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialMediaApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialMediaApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialMediaApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialMediaApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialMediaApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialMediaApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialMediaApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialMediaApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialMediaApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialMediaApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialMediaApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialMediaApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocialMediaApp] SET  MULTI_USER 
GO
ALTER DATABASE [SocialMediaApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialMediaApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialMediaApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialMediaApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialMediaApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialMediaApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SocialMediaApp] SET QUERY_STORE = OFF
GO
USE [SocialMediaApp]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateUserAge]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateUserAge] (@BirthDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @CurrentDate DATE = GETDATE();
    DECLARE @Age INT;

    SET @Age = YEAR(@CurrentDate) - YEAR(@BirthDate);


    RETURN @Age;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[CountPostLikes]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CountPostLikes] (@PostID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalLikes INT;

    SELECT @TotalLikes = Likes
    FROM Posts
    WHERE PostID = @PostID;

    RETURN @TotalLikes;
END;
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[BirthDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Content] [text] NOT NULL,
	[PostDate] [datetime] NULL,
	[Likes] [int] NULL,
	[Comments] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PostsWithUserDetails]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PostsWithUserDetails] AS
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
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NULL,
	[UserID] [int] NULL,
	[CommentText] [text] NOT NULL,
	[CommentDate] [datetime] NULL,
	[Likes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[PostWithComments]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PostWithComments] AS
SELECT 
    Posts.PostID,
	Posts.Content,
	Comments.CommentText
FROM 
    Posts
JOIN 
    Comments ON Comments.PostID = Posts.PostID;
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendshipID] [int] IDENTITY(1,1) NOT NULL,
	[UserID1] [int] NULL,
	[UserID2] [int] NULL,
	[FriendshipStatus] [varchar](20) NULL,
	[RequesterUserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[NotificationText] [varchar](255) NOT NULL,
	[IsRead] [bit] NULL,
	[NotificationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_PostID]    Script Date: 23-01-2024 10:20:52 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_PostID] ON [dbo].[Posts]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 23-01-2024 10:20:52 ******/
CREATE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [dbo].[Friends] ADD  DEFAULT ('Pending') FOR [FriendshipStatus]
GO
ALTER TABLE [dbo].[Friends] ADD  DEFAULT (NULL) FOR [RequesterUserID]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [NotificationDate]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [PostDate]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT ((0)) FOR [Comments]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [BirthDate]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([UserID1])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([UserID2])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[AddPost]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPost]
    @UserID INT,
    @Content TEXT
AS
BEGIN
    INSERT INTO Posts (UserID, Content)
    VALUES (@UserID, @Content);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeletePost]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePost]
    @PostID INT
AS
BEGIN
    DELETE FROM Posts
    WHERE
        PostID = @PostID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DisplayPostWithUser]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayPostWithUser]
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
GO
/****** Object:  StoredProcedure [dbo].[SelectPosts]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPosts]
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
GO
/****** Object:  StoredProcedure [dbo].[UpdatePost]    Script Date: 23-01-2024 10:20:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePost]
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
GO
USE [master]
GO
ALTER DATABASE [SocialMediaApp] SET  READ_WRITE 
GO
