-- 3) GROUP BY:
-- Amaç: Kategorilere göre toplam belge sayýsýný hesaplamak
SELECT c.CategoryName, COUNT(d.DocumentID) AS ToplamBelge
FROM Categories c
LEFT JOIN Documents d ON c.CategoryID = d.CategoryID
GROUP BY c.CategoryName;