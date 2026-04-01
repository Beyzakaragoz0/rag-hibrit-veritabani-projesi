-- 1
SELECT * FROM Users;

-- 2
SELECT Title, UploadDate FROM Documents;

-- 3
SELECT d.Title, c.CategoryName
FROM Documents d
JOIN Categories c ON d.CategoryID = c.CategoryID;

-- 4
SELECT u.Username, COUNT(d.DocumentID) AS BelgeSayisi
FROM Users u
LEFT JOIN Documents d ON u.UserID = d.UserID
GROUP BY u.Username;

-- 5
SELECT TOP 10 * FROM DocumentChunks;

-- 6
SELECT d.Title, t.TagName
FROM Documents d
JOIN DocumentTags dt ON d.DocumentID = dt.DocumentID
JOIN Tags t ON dt.TagID = t.TagID;

-- 7
SELECT CategoryName, COUNT(*) AS Toplam
FROM Documents d
JOIN Categories c ON d.CategoryID = c.CategoryID
GROUP BY CategoryName;

-- 8
SELECT * FROM SearchLogs
WHERE SearchDate > DATEADD(DAY, -1, GETDATE());

-- 9
SELECT Title
FROM Documents
WHERE Title LIKE '%1%';

-- 10
SELECT COUNT(*) FROM DocumentChunks;

-- 11
SELECT TOP 5 *
FROM Documents
ORDER BY UploadDate DESC;

-- 12
SELECT DISTINCT CategoryID FROM Documents;

-- 13
SELECT u.Username, s.SearchQuery
FROM Users u
JOIN SearchLogs s ON u.UserID = s.UserID;

-- 14
EXEC sp_SistemOzeti;

-- 15
EXEC sp_RAG_AramaYap 'text', 1;

-- 16
SELECT * FROM vw_DocumentDetay;

-- 17
SELECT Title
FROM Documents
WHERE DocumentID IN (
    SELECT DocumentID FROM DocumentChunks WHERE PageNumber = 1
);

-- 18
SELECT AVG(PageNumber) FROM DocumentChunks;

-- 19
SELECT TagName FROM Tags
WHERE TagID > 5;

-- 20
SELECT TOP 5 Username FROM Users;