-- 6) DISTINCT:
-- Amaç: DocumentChunks tablosundaki tekrar etmeyen sayfa numaralarýný listelemek
SELECT DISTINCT PageNumber
FROM DocumentChunks
ORDER BY PageNumber;