-- 11) EXISTS:
-- Amaç: En az bir arama yapmýþ kullanýcýlarý listelemek
SELECT u.UserID, u.Username
FROM Users u
WHERE EXISTS (
    SELECT 1
    FROM SearchLogs s
    WHERE s.UserID = u.UserID
);