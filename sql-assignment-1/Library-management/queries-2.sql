

INSERT INTO Books (Title, Author, Genre, PublishedDate)
VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '1925-04-10'),
    ('To Kill a Mockingbird', 'Harper Lee', 'Fiction', '1960-07-11'),
    ('1984', 'George Orwell', 'Dystopian', '1949-06-08'),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '1937-09-21'),
    ('The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', '1951-07-16');


INSERT INTO Authors (FirstName, LastName, BirthDate, Nationality)
VALUES
    ('F. Scott', 'Fitzgerald', '1896-09-24', 'American'),
    ('Harper', 'Lee', '1926-04-28', 'American'),
    ('George', 'Orwell', '1903-06-25', 'British'),
    ('J.R.R.', 'Tolkien', '1892-01-03', 'British'),
    ('J.D.', 'Salinger', '1919-01-01', 'American');


INSERT INTO Users (FirstName, LastName, Email)
VALUES
    ('Jethalal', 'Gada', 'jethalal.gada@email.com'),
    ('Ajay', 'Sharma', 'ajay.sharma@email.com'),
    ('Vijay', 'Verma', 'vijay.verma@email.com'),
    ('Vinay', 'Patel', 'vinay.patel@email.com'),
    ('Rahul', 'Chauhan', 'rahul.chauhan@email.com');


INSERT INTO Loans (UserID, BookID, LoanDate, ReturnDate, Status)
VALUES
    (1, 1, '2022-01-01', '2022-02-01', 'Returned'),
    (2, 3, '2022-02-10', NULL, 'Active'),
    (3, 2, '2022-03-15', '2022-04-15', 'Returned'),
    (4, 4, '2022-04-20', NULL, 'Active'),
    (5, 5, '2022-05-25', '2022-06-25', 'Returned');




INSERT INTO Categories (CategoryName, Description, ShelfLocation, CategoryCode)
VALUES
    ('Classic', 'Books that have stood the test of time.', 'A1', 'CL001'),
    ('Fiction', 'Imaginative or invented stories.', 'B2', 'FI002'),
    ('Dystopian', 'Books that explore dystopian societies.', 'C3', 'DY003'),
    ('Fantasy', 'Books set in fantastical worlds.', 'D4', 'FA004'),
    ('Coming-of-age', 'Stories about characters growing up.', 'E5', 'CO005');
