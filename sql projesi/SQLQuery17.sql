-- 7) LIKE:
-- Amaç: Baþlýðýnda '1' geçen belgeleri bulmak
SELECT DocumentID, Title
FROM Documents
WHERE Title LIKE '%1%';