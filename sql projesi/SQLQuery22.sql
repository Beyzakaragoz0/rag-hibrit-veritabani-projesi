-- 12) AGGREGATE FUNCTIONS:
-- Amaç: Chunk verileri üzerinde toplam, ortalama, en büyük ve en küçük sayfa numarasýný hesaplamak
SELECT 
    COUNT(*) AS ToplamChunk,
    AVG(PageNumber) AS OrtalamaSayfa,
    MAX(PageNumber) AS EnBuyukSayfa,
    MIN(PageNumber) AS EnKucukSayfa
FROM DocumentChunks;