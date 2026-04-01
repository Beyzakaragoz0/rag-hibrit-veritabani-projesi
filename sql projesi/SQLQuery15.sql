-- 5) ORDER BY + TOP:
-- Amaç: En son yüklenen 10 belgeyi göstermek
SELECT TOP 10 DocumentID, Title, UploadDate
FROM Documents
ORDER BY UploadDate DESC;