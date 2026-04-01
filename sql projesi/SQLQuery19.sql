-- 9) BETWEEN:
-- Amaç: Sayfa numarasý 1 ile 5 arasýnda olan chunk kayýtlarýný listelemek
SELECT ChunkID, DocumentID, PageNumber
FROM DocumentChunks
WHERE PageNumber BETWEEN 1 AND 5;