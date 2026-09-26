CREATE DATABASE JoseTaskManager;
GO

USE JoseTaskManager;
GO


CREATE TABLE Users
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Role VARCHAR(20) NOT NULL
);


CREATE TABLE Tasks
(
    TaskID INT IDENTITY(1,1) PRIMARY KEY,

    TaskName VARCHAR(100) NOT NULL,

    Description VARCHAR(255),

    AssignedUserID INT NOT NULL,

    Status VARCHAR(20) DEFAULT 'Pending',

    FOREIGN KEY (AssignedUserID)
    REFERENCES Users(UserID)
);


CREATE TABLE TaskHistory
(
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,

    TaskID INT NOT NULL,

    UserID INT NOT NULL,

    CompletedDate DATETIME DEFAULT GETDATE(),


    FOREIGN KEY(TaskID)
    REFERENCES Tasks(TaskID),


    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);



INSERT INTO Users
(Username, Password, Role)
VALUES

('admin','admin123','Admin'),

('nurse1','user123','User'),

('nurse2','user123','User');



INSERT INTO Tasks
(TaskName, Description, AssignedUserID, Status)
VALUES

('Room Checking',
 'Check room condition',
 2,
 'Pending'),


('Patient Monitoring',
 'Monitor patient status',
 2,
 'Pending'),


('Equipment Inspection',
 'Inspect equipment',
 3,
 'Pending'),


('Daily Report',
 'Submit daily report',
 3,
 'Pending');

 CREATE TABLE UserTaskAssignment
(
    AssignmentID INT IDENTITY PRIMARY KEY,

    TaskID INT NOT NULL,

    UserID INT NOT NULL,


    FOREIGN KEY(TaskID)
    REFERENCES Tasks(TaskID),


    FOREIGN KEY(UserID)
    REFERENCES Users(UserID)
);

USE master;
GO

DROP DATABASE JoseTaskManager;
GO