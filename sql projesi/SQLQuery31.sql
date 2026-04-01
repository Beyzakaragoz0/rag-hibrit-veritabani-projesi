-- 19) CTE:
-- Amaç: Önce kullanýcý bazlý belge sayýsýný hesaplayýp sonra kullanýcý adýyla birlikte listelemek
WITH BelgeSayilari AS (
    SELECT UserID, COUNT(*) AS BelgeAdedi
    FROM Documents
    GROUP BY UserID
)
SELECT u.Username, b.BelgeAdedi
FROM BelgeSayilari b
JOIN Users u ON b.UserID = u.UserID
ORDER BY b.BelgeAdedi DESC;