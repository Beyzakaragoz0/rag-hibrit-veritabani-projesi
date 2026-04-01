-- 8) IN:
-- Amaç: Belirli kategorilere ait belgeleri getirmek
SELECT DocumentID, Title
FROM Documents
WHERE CategoryID IN (1, 2, 3);