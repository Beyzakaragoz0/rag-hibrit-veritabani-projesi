-- 2) LEFT JOIN + COUNT:
-- Amaç: Her kullanýcýnýn yüklediði belge sayýsýný göstermek
SELECT u.UserID, u.Username, COUNT(d.DocumentID) AS BelgeSayisi
FROM Users u
LEFT JOIN Documents d ON u.UserID = d.UserID
GROUP BY u.UserID, u.Username;