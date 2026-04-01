-- 13) MANY TO MANY JOIN:
-- Amaç: Belgeler ile onlara ait etiketleri birlikte göstermek
SELECT d.Title, t.TagName
FROM Documents d
JOIN DocumentTags dt ON d.DocumentID = dt.DocumentID
JOIN Tags t ON dt.TagID = t.TagID
ORDER BY d.Title;