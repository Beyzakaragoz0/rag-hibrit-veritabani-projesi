-- 4) HAVING:
-- Amaç: Belge sayýsý 40'tan fazla olan kategorileri listelemek
SELECT c.CategoryName, COUNT(d.DocumentID) AS ToplamBelge
FROM Categories c
JOIN Documents d ON c.CategoryID = d.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(d.DocumentID) > 40;