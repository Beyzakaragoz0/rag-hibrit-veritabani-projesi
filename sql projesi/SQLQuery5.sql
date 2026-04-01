USE RagHybridDB;
GO

-- VIEW (Belgeleri özet halinde gösterir)
CREATE VIEW vw_DocumentDetay
AS
SELECT 
    d.DocumentID,
    d.Title,
    c.CategoryName,
    u.Username,
    d.UploadDate
FROM Documents d
JOIN Categories c ON d.CategoryID = c.CategoryID
JOIN Users u ON d.UserID = u.UserID;
GO

-- TRIGGER (log kontrolü - boþ arama engelleme)
CREATE TRIGGER trg_SearchLogs_Control
ON SearchLogs
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE SearchQuery IS NULL OR SearchQuery = ''
    )
    BEGIN
        RAISERROR ('Boþ arama kaydedilemez!', 16, 1);
        RETURN;
    END

    INSERT INTO SearchLogs (UserID, SearchQuery, SearchDate)
    SELECT UserID, SearchQuery, GETDATE()
    FROM inserted;
END;
GO