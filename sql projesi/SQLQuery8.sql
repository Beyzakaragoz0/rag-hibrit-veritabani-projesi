UPDATE DocumentChunks
SET ChunkText = 
CASE 
    WHEN ChunkID % 3 = 0 THEN 'Yapay zeka sistemleri veri analizi yapar'
    WHEN ChunkID % 3 = 1 THEN 'Veritabaný yönetim sistemleri performans saðlar'
    ELSE 'Siber güvenlik veri koruma saðlar'
END;