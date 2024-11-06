SELECT TOP (1000) [userId]
      ,[userName]
      ,[email]
      ,[hashedPassword]
      ,[firstName]
      ,[lastName]
      ,[phoneNumber]
      ,[dateOfBirth]
      ,[role]
      ,[status]
      ,[createdAt]
      ,[lastLogin]
  FROM [thesis-database].[dbo].[Users]



SET IDENTITY_INSERT [thesis-database].[dbo].[Users] ON;
INSERT INTO [thesis-database].[dbo].[Users]
(
	[userId],
    [userName],
    [email],
    [hashedPassword],
    [firstName],
    [lastName],
    [phoneNumber],
    [dateOfBirth],
    [role],
    [status],
    [createdAt],
    [lastLogin]
)
VALUES
(
	'4',
    'fatly',     
    '21522444@gm.uit.edu.vn',        
    'P@ssword123',
    'Phat',    
    'Ly',     
    '0909090909',  
    '2003-07-05',        -- Example valid date in YYYY-MM-DD format
    'SuperAdmin',         
    '',       
    GETDATE(),           -- Automatically sets the current date and time for createdAt
    NULL                 -- Last login is unknown, setting it as NULL
);

DELETE FROM [thesis-database].[dbo].[Users]
WHERE [userId] = 1009;

SET IDENTITY_INSERT [thesis-database].[dbo].[Users] OFF;
INSERT INTO [thesis-database].[dbo].[Users]
(
    [userName],
    [email],
    [hashedPassword],
    [firstName],
    [lastName],
    [phoneNumber],
    [dateOfBirth],
    [role],
    [status],
    [createdAt],
    [lastLogin]
)
VALUES
-- Manager Role
('manager001', 'manager001@example.com', 'hashedPassword1', 'John', 'Doe', '123-456-7890', '1980-05-12', 'Manager', 'Active', GETDATE(), NULL),

-- Employee Role
('employee001', 'employee001@example.com', 'hashedPassword2', 'Jane', 'Smith', '987-654-3210', '1990-07-18', 'Employee', 'Active', GETDATE(), NULL),

-- Quality Control Role
('qc001', 'qc001@example.com', 'hashedPassword3', 'Paul', 'Johnson', '456-789-1230', '1985-03-22', 'Quality Control', 'Active', GETDATE(), NULL),

-- Author Role
('author001', 'author001@example.com', 'hashedPassword4', 'Alice', 'Brown', '321-654-9870', '1992-11-15', 'Author', 'Active', GETDATE(), NULL),

-- User Role
('user001', 'user001@example.com', 'hashedPassword5', 'Bob', 'Taylor', '159-753-4862', '1995-09-25', 'User', 'Active', GETDATE(), NULL);


CREATE TABLE [thesis-database].[dbo].[Task] (
    taskID INT IDENTITY(1,1) PRIMARY KEY,      -- Primary Key, auto-increment
    taskname NVARCHAR(255) NOT NULL,           -- Task name
    createAt DATETIME DEFAULT GETDATE(),       -- Task creation time, default current timestamp
    deadline DATETIME NOT NULL,                -- Deadline for the task
    progressPercentage DECIMAL(5, 2) DEFAULT 0, -- Task progress (0-100%)
    priority NVARCHAR(50) NOT NULL,            -- Task priority (e.g., High, Medium, Low)
    status NVARCHAR(50) NOT NULL,              -- Task status (e.g., Pending, In Progress, Completed)
    ComicId INT,                               -- Foreign key referencing Comic table
    CONSTRAINT FK_ComicId FOREIGN KEY (ComicId) REFERENCES [thesis-database].[dbo].[Comic](ComicId)
);


CREATE TABLE [thesis-database].[dbo].[Assign] (
    AssignID INT IDENTITY(1,1) PRIMARY KEY,     -- Primary Key, auto-increment
    userID INT NOT NULL,                        -- Foreign key referencing Users table
    TaskID INT NOT NULL,                        -- Foreign key referencing Task table
    assignAt DATETIME DEFAULT GETDATE(),        -- Assignment time, default current timestamp
    CONSTRAINT FK_UserID FOREIGN KEY (userID) REFERENCES [thesis-database].[dbo].[Users](userId),
    CONSTRAINT FK_TaskID FOREIGN KEY (TaskID) REFERENCES [thesis-database].[dbo].[Task](TaskID)
);


INSERT INTO [thesis-database].[dbo].[Task]
(
    Taskname,
    createAt,
    deadline,
    progressPercentage,
    priority,
    status,
    comicID
)
VALUES
-- Task 1
('Review Chapter 1', GETDATE(), '2024-11-01', 25.50, 'High', 'In Progress', 5),
-- Task 2
('Draw Sketches for Chapter 2', GETDATE(), '2024-11-10', 0.00, 'Medium', 'Pending', 5),
-- Task 3
('Color Chapter 3', GETDATE(), '2024-11-15', 75.00, 'High', 'In Progress', 3),
-- Task 4
('Proofread Chapter 2', GETDATE(), '2024-10-25', 100.00, 'Low', 'Completed', 3),
-- Task 5
('Write Script for Chapter 4', GETDATE(), '2024-11-20', 0.00, 'High', 'Pending', 9);

INSERT INTO [thesis-database].[dbo].[Assign]
(
    userID,
    TaskID,
    assignAt
)
VALUES
-- Assign Task 1 to userID 1
( 1014,2, GETDATE()),
-- Assign Task 2 to userID 2
( 1010,3, GETDATE()),
-- Assign Task 3 to userID 1
( 1010,4, GETDATE()),
-- Assign Task 4 to userID 3
( 1010,5, GETDATE()),
-- Assign Task 5 to userID 4
( 1010,6, GETDATE());


SELECT TOP (1000) [AssignID]
      ,[userID]
      ,[TaskID]
      ,[assignAt]
  FROM [thesis-database].[dbo].[Assign]
 

SELECT 
    t.TaskID, 
    u.firstName + ' ' + u.lastName AS fullName, 
    t.status AS taskStatus, 
    t.priority AS Priority, 
    t.deadline
FROM 
    [thesis-database].[dbo].[Task] t
JOIN 
    [thesis-database].[dbo].[Assign] a ON t.TaskID = a.TaskID
JOIN 
    [thesis-database].[dbo].[Users] u ON a.userID = u.userId;

