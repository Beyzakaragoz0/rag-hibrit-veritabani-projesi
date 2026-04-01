-- 17) FUNCTION KULLANIMI:
-- Amaç: Ýki vektör arasýndaki benzerlik skorunu hesaplamak
SELECT dbo.fn_VectorSimilarity('[0.1,0.2,0.3,0.4]', '[0.1,0.2,0.3,0.4]') AS BenzerlikSkoru;