IF OBJECT_ID('Comic', 'U') IS NOT NULL
    DROP TABLE Comic;
GO
-- Recreate the Comic table with the new structure and foreign keys
--ALTER TABLE Comic
CREATE TABLE Comic (
    ComicID INT IDENTITY(1,1) PRIMARY KEY,
    comicTitle NVARCHAR(255) NOT NULL,
    localhostURL NVARCHAR(255),
    remoteURL NVARCHAR(255),
    taskID INT,
    releaseDate DATE,
    publishID INT,
	releaseID INT,
    authorID INT,
    language NVARCHAR(50),
    categoryID INT,
    Description NVARCHAR(MAX),
    FOREIGN KEY (taskID) REFERENCES Task(TaskID),
    FOREIGN KEY (publishID) REFERENCES Publisher(PublishID),
    FOREIGN KEY (releaseID) REFERENCES Releasing(ReleaseID),
    FOREIGN KEY (authorID) REFERENCES Author(authorID),
    FOREIGN KEY (categoryID) REFERENCES Section(categoryID)
);
GO

ALTER TABLE Comic
ADD comicTitle NVARCHAR(255) NULL;  -- Allow NULL values
GO

ALTER TABLE Comic
ADD localhostURL NVARCHAR(255),
    remoteURL NVARCHAR(255),
    taskID INT,
    releaseDate DATE,
    publisherID INT,
	releaseID INT,
    authorID INT,
    language NVARCHAR(50),
    categoryID INT,
    Description NVARCHAR(MAX),
    FOREIGN KEY (taskID) REFERENCES Task(TaskID),
    FOREIGN KEY (publisherID) REFERENCES Publisher(publisherID),
    FOREIGN KEY (releaseID) REFERENCES Releasing(ReleaseID),
    FOREIGN KEY (authorID) REFERENCES Author(authorID)
    --FOREIGN KEY (categoryID) REFERENCES ComicCategories(categoryID)
GO


ALTER TABLE Comic
DROP COLUMN comicTitle;
GO


-- Create the Publishing table with the specified columns and foreign key
CREATE TABLE Releasing (
    ReleaseID INT PRIMARY KEY IDENTITY(1,1),
    isApprove BIT NOT NULL,
    approveAt DATETIME,
    userID INT,
    status NVARCHAR(50),
    FOREIGN KEY (userId) REFERENCES [Users](userId),
);
GO
ALTER TABLE Releasing
ADD licenseID INT UNIQUE,
    FOREIGN KEY (licenseID) REFERENCES License(licenseID);
GO

IF OBJECT_ID('License', 'U') IS NOT NULL
    DROP TABLE License;
GO

IF OBJECT_ID('Releasing', 'U') IS NOT NULL
    DROP TABLE Releasing;
GO

-- Create the License table with the specified fields
CREATE TABLE License (
    licenseID INT PRIMARY KEY IDENTITY(1,1),
    licenseName NVARCHAR(50) NOT NULL,
    licenseType NVARCHAR(50) NOT NULL,
    provider NVARCHAR(100),
    validFrom DATE,
    validUntil DATE
);
GO

INSERT INTO License (licenseName, licenseType, provider, validFrom, validUntil)
VALUES 
    ('Standard License', 'Standard', 'Provider A', '2024-01-01', '2025-01-01'),
    ('Premium License', 'Premium', 'Provider B', '2024-02-01', '2025-02-01'),
    ('Basic License', 'Basic', 'Provider C', '2024-03-01', '2025-03-01'),
    ('Enterprise License', 'Enterprise', 'Provider A', '2024-04-01', '2025-04-01'),
    ('Trial License', 'Trial', 'Provider D', '2024-05-01', '2024-06-01'),
    ('Standard Plus', 'Standard', 'Provider E', '2024-06-01', '2025-06-01'),
    ('Premium Plus', 'Premium', 'Provider B', '2024-07-01', '2025-07-01'),
    ('Basic Starter', 'Basic', 'Provider F', '2024-08-01', '2025-08-01'),
    ('Enterprise Gold', 'Enterprise', 'Provider A', '2024-09-01', '2025-09-01'),
    ('Trial Extended', 'Trial', 'Provider D', '2024-10-01', '2024-11-01');

INSERT INTO Releasing (isApprove, approveAt, userId, status, licenseID)
VALUES 
    (1, '2025-01-15', 1014, 'Approved', 1),
    (0, NULL, null, 'Pending', 2),
    (1, '2025-03-20', 1022, 'Approved', 3),
    (1, '2023-04-10', 1014, 'Released', 4),
    (0, NULL, null, 'Pending', 5),
    (1, '2023-06-05', 1023, 'Released', 6),
    (1, '2022-07-22', 1023, 'Released', 7),
    (0, NULL, null, 'Pending', 8),
    (1, '2026-09-15', 1014, 'Pending', 9),
    (1, '2025-10-20', 1014, 'Pending', 10);
GO

IF OBJECT_ID('Publisher', 'U') IS NOT NULL
    DROP TABLE Publisher;
GO
CREATE TABLE Publisher (
    publisherID INT PRIMARY KEY IDENTITY(1,1),
    publisherName NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    contactEmail NVARCHAR(100),
    phoneNumber NVARCHAR(20)
);
GO
SET IDENTITY_INSERT Publisher ON;
INSERT INTO Publisher (publisherID, publisherName, address, contactEmail, phoneNumber) VALUES
(1, 'Marvel Comics', '135 W 50th St, New York, NY 10020', 'info@marvel.com', '212-576-4000'),
(2, 'DC Comics', '1700 Broadway, New York, NY 10019', 'contact@dc.com', '212-636-5400'),
(3, 'Dark Horse Comics', '10956 SE Main St, Milwaukie, OR 97222', 'info@darkhorse.com', '503-652-1999'),
(4, 'Image Comics', '2450 W 26th St, Suite 200, Chicago, IL 60623', 'info@image.com', '312-614-3000'),
(5, 'IDW Publishing', '2765 Shell Rd, San Francisco, CA 94134', 'info@idwpublishing.com', '415-123-4567'),
(6, 'BOOM! Studios', '580 California St, San Francisco, CA 94104', 'contact@boom-studios.com', '415-123-7890'),
(7, 'Dynamite Entertainment', '6930 S. Balsam St, Littleton, CO 80128', 'info@dynamite.com', '720-123-4567'),
(8, 'Valiant Comics', '1001 W 4th St, Suite 200, Los Angeles, CA 90012', 'contact@valiant.com', '310-123-4567'),
(9, 'VIZ Media', '1355 Market St, San Francisco, CA 94103', 'info@viz.com', '415-123-4568'),
(10, 'Titan Comics', '1111 N Orange St, Wilmington, DE 19801', 'info@titan.com', '302-123-4569');
GO



IF OBJECT_ID('Author', 'U') IS NOT NULL
    DROP TABLE Author;
GO
-- Create the Author table with the specified fields
CREATE TABLE Author (
    authorID INT PRIMARY KEY IDENTITY(1,1),
    authorName NVARCHAR(100) NOT NULL,
    bio NVARCHAR(MAX),
    email NVARCHAR(100),
    nationality NVARCHAR(50)
);
GO
-- Insert 10 sample records into the Author table
INSERT INTO Author (authorName, bio, email, nationality) VALUES
('Alice Johnson', 'An experienced comic book author known for her fantasy series.', 'alice.johnson@example.com', 'USA'),
('Bob Smith', 'A graphic novelist who explores social issues through storytelling.', 'bob.smith@example.com', 'Canada'),
('Cathy Lee', 'Comic artist and writer, famous for her superhero comics.', 'cathy.lee@example.com', 'UK'),
('David Brown', 'Award-winning author and illustrator of children’s comics.', 'david.brown@example.com', 'Australia'),
('Eva Martinez', 'A writer specializing in historical fiction comics.', 'eva.martinez@example.com', 'Spain'),
('Frank White', 'A graphic novelist known for his intricate art and deep narratives.', 'frank.white@example.com', 'Germany'),
('Grace Green', 'Comic book writer and editor with over 10 years of experience.', 'grace.green@example.com', 'USA'),
('Henry Black', 'An emerging talent in the indie comic scene.', 'henry.black@example.com', 'Brazil'),
('Isabella Blue', 'Author of best-selling romance comics.', 'isabella.blue@example.com', 'Italy'),
('Jack Grey', 'Futuristic comic author with a focus on technology and innovation.', 'jack.grey@example.com', 'India');
GO



IF OBJECT_ID('Categories', 'U') IS NOT NULL
    DROP TABLE Categories;
GO
-- Create the Categories table with the specified fields
CREATE TABLE Categories (
    categoryID INT PRIMARY KEY IDENTITY(1,1),
    categoryName NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX)
);
GO

-- Insert 10 sample records into the Categories table
INSERT INTO Categories (categoryName, description) VALUES
('Superhero', 'Comics featuring superheroes and their adventures.'),
('Fantasy', 'Comics set in magical worlds with mythical creatures.'),
('Science Fiction', 'Comics that explore futuristic concepts and technology.'),
('Mystery', 'Comics centered around solving crimes and mysteries.'),
('Horror', 'Comics that evoke fear and suspense through thrilling stories.'),
('Romance', 'Comics focusing on romantic relationships and love stories.'),
('Historical Fiction', 'Comics that depict historical events or settings.'),
('Slice of Life', 'Comics that portray everyday life and relatable situations.'),
('Adventure', 'Comics that follow characters on exciting journeys.'),
('Comedy', 'Comics designed to entertain and provoke laughter.');
GO


CREATE TABLE ComicCategories (
    comicID INT,
    categoryID INT,
    PRIMARY KEY (comicID, categoryID),
    FOREIGN KEY (comicID) REFERENCES Comic(ComicID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);
GO