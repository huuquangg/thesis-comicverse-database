SELECT TOP (1000) [ComicId]
      ,[comicTitle]
      ,[localhostURL]
      ,[remoteURL]
      ,[taskID]
      ,[releaseDate]
      ,[publisherID]
      ,[releaseID]
      ,[authorID]
      ,[language]
      ,[categoryID]
      ,[Description]
  FROM [thesis-database].[dbo].[Comic]

-- Allow explicit value for identity column if ComicID is an identity column
SET IDENTITY_INSERT Comic ON;

-- Insert specific records into the Comic table
-- Update existing records in the Comic table
UPDATE Comic
SET 
    comicTitle = 'Wonder Woman: Temp Tossed',
    localhostURL = 'http://localhost/wonderwoman',
    remoteURL = 'http://remote.com/wonderwoman',
    taskID = 2,
    releaseDate = '2023-07-20',
    publisherID = 1,
    releaseID = 1,
    authorID = 3,
    language = 'English',
    categoryID = 1,
    Description = 'An inspiring story of empowerment.'
WHERE ComicID = 3;

UPDATE Comic
SET 
    comicTitle = 'Saga Vol. 1',
    localhostURL = 'http://localhost/saga',
    remoteURL = 'http://remote.com/saga',
    taskID = 3,
    releaseDate = '2023-09-10',
    publisherID = 2,
    releaseID = 2,
    authorID = 5,
    language = 'English',
    categoryID = 2,
    Description = 'A sweeping tale of love and adventure.'
WHERE ComicID = 5;

UPDATE Comic
SET 
    comicTitle = 'Persepolis',
    localhostURL = 'http://localhost/persepolis',
    remoteURL = 'http://remote.com/persepolis',
    taskID = 4,
    releaseDate = '2023-12-01',
    publisherID = 3,
    releaseID = 3,
    authorID = 9,
    language = 'English',
    categoryID = 3,
    Description = 'A poignant story of a young girl growing up in Iran.'
WHERE ComicID = 9;

-- For ComicID 1002 and 1003, you need to handle them accordingly
-- Assuming they are not in the table yet, you can insert them.
-- Update the record with ComicID = 1002
UPDATE Comic
SET 
    comicTitle = 'Custom Comic Title 1',
    localhostURL = 'http://localhost/custom1',
    remoteURL = 'http://remote.com/custom1',
    taskID = 5,
    releaseDate = '2024-01-01',
    publisherID = 1,
    releaseID = 4,
    authorID = 1,
    language = 'English',
    categoryID = 1,
    Description = 'A description for Custom Comic 1.'
WHERE ComicID = 1002;

-- Update the record with ComicID = 1003
UPDATE Comic
SET 
    comicTitle = 'Custom Comic Title 2',
    localhostURL = 'http://localhost/custom2',
    remoteURL = 'http://remote.com/custom2',
    taskID = 6,
    releaseDate = '2024-01-15',
    publisherID = 2,
    releaseID = 5,
    authorID = 2,
    language = 'English',
    categoryID = 2,
    Description = 'A description for Custom Comic 2.'
WHERE ComicID = 1003;
GO


-- Disable explicit identity insertion
SET IDENTITY_INSERT Comic OFF;
GO

SET IDENTITY_INSERT Comic ON;

INSERT INTO Comic (
    ComicID, 
    comicTitle, 
    localhostURL, 
    remoteURL, 
    taskID, 
    releaseDate, 
    publisherID, 
    releaseID, 
    authorID, 
    language, 
    categoryID, 
    Description
) VALUES
(1001, 'Batman: Year One', 'http://localhost/batmanyearone', 'http://remote.com/batmanyearone', null, '2024-02-01', 1, 1, 1, 'English', 1, 'The story of Batman’s first year as a crime fighter.'),
(1004, 'Spider-Man: Homecoming', 'http://localhost/spidermanhomecoming', 'http://remote.com/spidermanhomecoming', null, '2024-03-15', 2, 2, 2, 'English', 1, 'The journey of Peter Parker as he becomes Spider-Man.'),
(1005, 'Superman: Red Son', 'http://localhost/supermanredson', 'http://remote.com/supermanredson', null, '2024-04-10', 1, 3, 3, 'English', 2, 'What if Superman was raised in the Soviet Union?'),
(1006, 'Wonder Woman: Bloodlines', 'http://localhost/wonderwomanbloodlines', 'http://remote.com/wonderwomanbloodlines', null, '2024-05-20', 3, 4, 4, 'English', 1, 'A reimagining of Wonder Woman’s origin story.'),
(1007, 'X-Men: Days of Future Past', 'http://localhost/xmendaysoffuturepast', 'http://remote.com/xmendaysoffuturepast', null, '2024-06-25', 2, 5, 5, 'English', 2, 'The X-Men must fight to change the future.'),
(1008, 'The Walking Dead: Compendium One', 'http://localhost/walkingdeadcompendium1', 'http://remote.com/walkingdeadcompendium1', null, '2024-07-30', 4, 6, 6, 'English', 2, 'The beginning of the zombie apocalypse story.'),
(1009, 'Saga: Volume 1', 'http://localhost/sagavolume1', 'http://remote.com/sagavolume1', null, '2024-08-15', 5, null, 7, 'English', 1, 'A sweeping science fiction epic about love and war.'),
(1010, 'Watchmen', 'http://localhost/watchmen', 'http://remote.com/watchmen', null, '2024-09-10', 1, null, 8, 'English', 1, 'A gritty take on the world of superheroes.'),
(1011, 'Hellboy: Seed of Destruction', 'http://localhost/hellboyseedofdestruction', 'http://remote.com/hellboyseedofdestruction', null, '2024-10-05', 6, null, 9, 'English', 2, 'The origin story of Hellboy and his battles against supernatural threats.'),
(1012, 'Maus: A Survivor’s Tale', 'http://localhost/maus', 'http://remote.com/maus', null, '2024-11-11', 7, 6, 10, 'English', 2, 'A graphic novel depicting the Holocaust through the eyes of a survivor.');

