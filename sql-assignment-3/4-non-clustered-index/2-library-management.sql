USE LibraryManagement;

CREATE NONCLUSTERED INDEX IX_Books_Title
ON Books (Title);

CREATE NONCLUSTERED INDEX IX_Loans_BookID_Status
ON Loans (BookID, Status);
