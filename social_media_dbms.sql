CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    LastLogin DATETIME,
    Bio TEXT,
    ProfilePicture VARCHAR(255),
    DateOfBirth DATE
);

CREATE TABLE Post (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT NOT NULL,
    Timestamp DATETIME NOT NULL,
    LikeCount INT DEFAULT 0,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT NOT NULL,
    Timestamp DATETIME NOT NULL,
    PostID INT,
    UserID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Like (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    CommentID INT,
    UserID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (CommentID) REFERENCES Comment(CommentID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Message (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT NOT NULL,
    Timestamp DATETIME NOT NULL,
    SenderUserID INT,
    ReceiverUserID INT,
    FOREIGN KEY (SenderUserID) REFERENCES User(UserID),
    FOREIGN KEY (ReceiverUserID) REFERENCES User(UserID)
);

CREATE TABLE GroupEntity (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    Description TEXT,
    CreatorUserID INT,
    FOREIGN KEY (CreatorUserID) REFERENCES User(UserID)
);

CREATE TABLE FriendshipFollow (
    FriendshipID INT PRIMARY KEY AUTO_INCREMENT,
    FollowerUserID INT,
    FollowedUserID INT,
    Timestamp DATETIME NOT NULL,
    FOREIGN KEY (FollowerUserID) REFERENCES User(UserID),
    FOREIGN KEY (FollowedUserID) REFERENCES User(UserID)
);
