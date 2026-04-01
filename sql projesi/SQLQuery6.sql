USE RagHybridDB;
GO

-- USERS (100 adet)
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Users (Username, Email)
    VALUES ('user' + CAST(@i AS NVARCHAR), 'user' + CAST(@i AS NVARCHAR) + '@mail.com');
    SET @i = @i + 1;
END;

-- CATEGORIES (10 adet)
INSERT INTO Categories (CategoryName)
VALUES ('AI'), ('Database'), ('Security'), ('HR'), ('Finance'),
       ('Backend'), ('Frontend'), ('DevOps'), ('Cloud'), ('Testing');

-- TAGS (20 adet)
SET @i = 1;
WHILE @i <= 20
BEGIN
    INSERT INTO Tags (TagName)
    VALUES ('Tag' + CAST(@i AS NVARCHAR));
    SET @i = @i + 1;
END;

-- DOCUMENTS (500 adet)
SET @i = 1;
WHILE @i <= 500
BEGIN
    INSERT INTO Documents (Title, CategoryID, UserID)
    VALUES (
        'Document ' + CAST(@i AS NVARCHAR),
        (ABS(CHECKSUM(NEWID())) % 10) + 1,
        (ABS(CHECKSUM(NEWID())) % 100) + 1
    );
    SET @i = @i + 1;
END;

-- CHUNKS (her belgeye 5 → 2500+ kayıt)
SET @i = 1;
WHILE @i <= 2500
BEGIN
    INSERT INTO DocumentChunks (DocumentID, ChunkText, VectorData, PageNumber)
    VALUES (
        (ABS(CHECKSUM(NEWID())) % 500) + 1,
        'Sample text content ' + CAST(@i AS NVARCHAR),
        '[0.1,0.2,0.3,0.4]',
        (ABS(CHECKSUM(NEWID())) % 10) + 1
    );
    SET @i = @i + 1;
END;

-- DOCUMENT TAGS (1000+ kayıt)
SET @i = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO DocumentTags (DocumentID, TagID)
    VALUES (
        (ABS(CHECKSUM(NEWID())) % 500) + 1,
        (ABS(CHECKSUM(NEWID())) % 20) + 1
    );
    SET @i = @i + 1;
END;

-- SEARCH LOGS (1000+ kayıt)
SET @i = 1;
WHILE @i <= 1000
BEGIN
    INSERT INTO SearchLogs (UserID, SearchQuery)
    VALUES (
        (ABS(CHECKSUM(NEWID())) % 100) + 1,
        'search query ' + CAST(@i AS NVARCHAR)
    );
    SET @i = @i + 1;
END;
GO