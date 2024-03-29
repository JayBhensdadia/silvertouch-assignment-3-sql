USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 23-01-2024 10:20:02 ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryManagement] SET QUERY_STORE = OFF
GO
USE [LibraryManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateAuthorAge]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateAuthorAge](@BirthDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @CurrentDate DATE = GETDATE();
    DECLARE @Age INT;

    SET @Age = YEAR(@CurrentDate) - YEAR(@BirthDate);

    RETURN @Age;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[IsBookOnLoan]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsBookOnLoan](@BookID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsOnLoan BIT;

    SELECT @IsOnLoan = CASE 
                        WHEN EXISTS (SELECT 1 FROM Loans WHERE BookID = @BookID AND Status = 'Active')
                        THEN 1
                        ELSE 0
                    END;

    RETURN @IsOnLoan;
END;
GO
/****** Object:  Table [dbo].[Books]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Genre] [varchar](50) NULL,
	[PublishedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[ShelfLocation] [varchar](50) NULL,
	[CategoryCode] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[BookWithCategory]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BookWithCategory] AS
SELECT 
	Books.BookID,
	Books.Title,
	Books.Genre,
	Categories.Description,
	Categories.ShelfLocation

FROM 
	Books
JOIN 
	Categories ON Books.Genre = Categories.CategoryName;
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[JoinDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[LoanID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BookID] [int] NULL,
	[LoanDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserWithLoanDetails]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserWithLoanDetails] AS
SELECT 
	Users.FirstName,
	Users.LastName,
	Loans.LoanDate,
	Loans.Status
FROM 
	Users
JOIN
	Loans ON Loans.UserID = Users.UserID;
---
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NULL,
	[Nationality] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_Title]    Script Date: 23-01-2024 10:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_Books_Title] ON [dbo].[Books]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Loans_BookID_Status]    Script Date: 23-01-2024 10:20:02 ******/
CREATE NONCLUSTERED INDEX [IX_Loans_BookID_Status] ON [dbo].[Loans]
(
	[BookID] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT (getdate()) FOR [LoanDate]
GO
ALTER TABLE [dbo].[Loans] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [JoinDate]
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBook]
    @Title VARCHAR(100),
    @Author VARCHAR(50),
    @Genre VARCHAR(50),
    @PublishedDate DATE
AS
BEGIN
    INSERT INTO Books (Title, Author, Genre, PublishedDate)
    VALUES (@Title, @Author, @Genre, @PublishedDate);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteBook]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBook]
    @BookID INT
AS
BEGIN
    DELETE FROM Books
    WHERE
        BookID = @BookID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DisplayBookWithAuthor]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DisplayBookWithAuthor]
    @BookID INT
AS
BEGIN
    SELECT 
        Books.BookID,
        Books.Title,
        Books.Author,
        Books.Genre,
        Books.PublishedDate,
        Authors.FirstName,
        Authors.LastName
    FROM 
        Books
    INNER JOIN 
        Authors ON Books.Author = Authors.AuthorID
    WHERE
        Books.BookID = @BookID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DisplayBookWithGenre]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisplayBookWithGenre]
    @BookID INT
AS
BEGIN
    SELECT 
        Books.BookID,
        Books.Title,
        Books.Author,
        Books.Genre,
        Books.PublishedDate,
        Categories.Description,
        Categories.ShelfLocation
    FROM 
        Books
    JOIN 
        Categories ON Books.Genre = Categories.CategoryName
    WHERE
        Books.BookID = @BookID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectBooks]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBooks]
AS
BEGIN
    SELECT 
        BookID,
        Title,
        Author,
        Genre,
        PublishedDate
    FROM 
        Books;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateBook]    Script Date: 23-01-2024 10:20:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBook]
    @BookID INT,
    @Title VARCHAR(100),
    @Author VARCHAR(50),
    @Genre VARCHAR(50),
    @PublishedDate DATE
AS
BEGIN
    UPDATE Books
    SET 
        Title = @Title,
        Author = @Author,
        Genre = @Genre,
        PublishedDate = @PublishedDate
    WHERE
        BookID = @BookID;
END;
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
