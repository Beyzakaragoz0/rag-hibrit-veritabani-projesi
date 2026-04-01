-- 10) SUBQUERY:
-- Amaç: En az bir chunk'ý 1. sayfada bulunan belgelerin baþlýklarýný getirmek
SELECT Title
FROM Documents
WHERE DocumentID IN (
    SELECT DocumentID
    FROM DocumentChunks
    WHERE PageNumber = 1
);