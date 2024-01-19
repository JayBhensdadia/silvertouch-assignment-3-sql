
INSERT INTO Users (FirstName, LastName, Username, Email, BirthDate)
VALUES
    ('Amit', 'Kumar', 'amit_k', 'amit.kumar@email.com', '1990-05-15'),
    ('Neha', 'Sharma', 'neha_s', 'neha.sharma@email.com', '1988-11-22'),
    ('Rahul', 'Verma', 'rahul_v', 'rahul.verma@email.com', '1995-07-08'),
    ('Sneha', 'Gupta', 'sneha_g', 'sneha.gupta@email.com', '1992-02-14'),
    ('Raj', 'Singh', 'raj_s', 'raj.singh@email.com', '1998-09-30');


INSERT INTO Posts (UserID, Content, Likes, Comments)
VALUES
    (1, 'excited about the weekend trip!', 15, 8),
    (2, 'look at my new hair cut.', 25, 12),
    (3, 'joined new company today', 10, 5),
    (4, 'starbucks is the best', 30, 20),
    (5, 'only 10% fat in body, i am fit now!!', 40, 15);


INSERT INTO Friends (UserID1, UserID2, FriendshipStatus, RequesterUserID)
VALUES
    (1, 2, 'Accepted', 1),
    (1, 3, 'Pending', 3),
    (2, 3, 'Accepted', 2),
    (3, 4, 'Pending', 4),
    (4, 5, 'Pending', 4);


INSERT INTO Comments (PostID, UserID, CommentText, Likes)
VALUES
    (1, 2, 'where to?', 5),
    (1, 3, 'bring me something..', 8),
    (2, 1, 'which salon?', 10),
    (3, 5, 'best of luck', 6),
    (5, 2, 'great', 12);


INSERT INTO Notifications (UserID, NotificationText, IsRead, NotificationDate)
VALUES
    (2, 'Amit Kumar accepted your friend request.', 0, GETDATE()),
    (3, 'Neha Sharma sent you a friend request.', 0, GETDATE()),
    (4, 'Rahul Verma accepted your friend request.', 0, GETDATE()),
    (5, 'Sneha Gupta sent you a friend request.', 0, GETDATE()),
    (1, 'Amit Kumar liked your post.', 0, GETDATE());