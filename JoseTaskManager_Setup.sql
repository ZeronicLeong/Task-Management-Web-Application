/*
====================================================
 Jose Task Manager Database Setup
 Database: JoseTaskManager
====================================================
*/


----------------------------------------------------
-- Create Database
----------------------------------------------------

CREATE DATABASE JoseTaskManager;

GO


USE JoseTaskManager;

GO



----------------------------------------------------
-- Users Table
----------------------------------------------------

CREATE TABLE Users
(
    UserID INT IDENTITY(1,1)
        PRIMARY KEY,

    Username VARCHAR(50)
        NOT NULL,

    Password VARCHAR(50)
        NOT NULL,

    Role VARCHAR(20)
        NOT NULL
);


GO



----------------------------------------------------
-- Tasks Table
----------------------------------------------------

CREATE TABLE Tasks
(
    TaskID INT IDENTITY(1,1)
        PRIMARY KEY,


    TaskName VARCHAR(100)
        NOT NULL,


    Description VARCHAR(255)
        NULL,


    Status VARCHAR(20)
        NULL
);


GO



----------------------------------------------------
-- Task History Table
----------------------------------------------------

CREATE TABLE TaskHistory
(
    HistoryID INT IDENTITY(1,1)
        PRIMARY KEY,


    TaskID INT
        NOT NULL,


    UserID INT
        NOT NULL,


    CompletedDateTime DATETIME
        NULL
);


GO



----------------------------------------------------
-- User Task Assignment Table
----------------------------------------------------

CREATE TABLE UserTaskAssignment
(
    AssignmentID INT IDENTITY(1,1)
        PRIMARY KEY,


    TaskID INT
        NOT NULL,


    UserID INT
        NOT NULL,


    Status VARCHAR(20)
        NULL,


    CompletedDateTime DATETIME
        NULL,


    HistoryID INT
        NULL
);


GO



----------------------------------------------------
-- Task Photos Table
----------------------------------------------------

CREATE TABLE TaskPhotos
(
    PhotoID INT IDENTITY(1,1)
        PRIMARY KEY,


    HistoryID INT
        NOT NULL,


    FileName VARCHAR(255)
        NOT NULL,


    FilePath VARCHAR(500)
        NOT NULL,


    UploadDateTime DATETIME
        NULL
);


GO



----------------------------------------------------
-- Foreign Keys
----------------------------------------------------


ALTER TABLE TaskHistory

ADD CONSTRAINT FK_TaskHistory_Task

FOREIGN KEY(TaskID)

REFERENCES Tasks(TaskID);


GO



ALTER TABLE TaskHistory

ADD CONSTRAINT FK_TaskHistory_User

FOREIGN KEY(UserID)

REFERENCES Users(UserID);


GO



ALTER TABLE TaskPhotos

ADD CONSTRAINT FK_TaskPhotos_History

FOREIGN KEY(HistoryID)

REFERENCES TaskHistory(HistoryID);


GO



ALTER TABLE UserTaskAssignment

ADD CONSTRAINT FK_UserTaskAssignment_Task

FOREIGN KEY(TaskID)

REFERENCES Tasks(TaskID);


GO



ALTER TABLE UserTaskAssignment

ADD CONSTRAINT FK_UserTaskAssignment_User

FOREIGN KEY(UserID)

REFERENCES Users(UserID);


GO



ALTER TABLE UserTaskAssignment

ADD CONSTRAINT FK_UserTaskAssignment_History

FOREIGN KEY(HistoryID)

REFERENCES TaskHistory(HistoryID);


GO




----------------------------------------------------
-- Default Admin Account
----------------------------------------------------

INSERT INTO Users
(
 Username,
 Password,
 Role
)

VALUES
(
 'admin',
 'admin123',
 'Admin'
);


GO



----------------------------------------------------
-- Default Staff Account
----------------------------------------------------

INSERT INTO Users
(
 Username,
 Password,
 Role
)

VALUES
(
 'nurse1',
 '123456',
 'User'
);


GO



INSERT INTO Users
(
 Username,
 Password,
 Role
)

VALUES
(
 'nurse2',
 '123456',
 'User'
);


GO



----------------------------------------------------
-- Sample Task
----------------------------------------------------

INSERT INTO Tasks
(
 TaskName,
 Description,
 Status
)

VALUES
(
 'Daily Equipment Inspection',
 'Inspect hospital equipment',
 'Pending'
);


GO



----------------------------------------------------
-- Verification
----------------------------------------------------

SELECT * FROM Users;

SELECT * FROM Tasks;

SELECT * FROM UserTaskAssignment;

SELECT * FROM TaskHistory;

SELECT * FROM TaskPhotos;


GO