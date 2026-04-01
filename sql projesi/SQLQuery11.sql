-- 1) INNER JOIN:
-- Aamaç: Belgeleri kategori ve kullanýcý bilgileriyle birlikte listelemek
SELECT d.DocumentID, d.Title, c.CategoryName, u.Username
FROM Documents d
INNER JOIN Categories c ON d.CategoryID = c.CategoryID
INNER JOIN Users u ON d.UserID = u.UserID;