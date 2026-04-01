-- VECTOR SIMILARITY FUNCTION
CREATE OR ALTER FUNCTION fn_VectorSimilarity (
    @Vector1 NVARCHAR(MAX),
    @Vector2 NVARCHAR(MAX)
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @DotProduct FLOAT = 0, @Mag1 FLOAT = 0, @Mag2 FLOAT = 0;

    SELECT 
        @DotProduct = SUM(CAST(v1.value AS FLOAT) * CAST(v2.value AS FLOAT)),
        @Mag1 = SQRT(SUM(SQUARE(CAST(v1.value AS FLOAT)))),
        @Mag2 = SQRT(SUM(SQUARE(CAST(v2.value AS FLOAT))))
    FROM OPENJSON(@Vector1) v1
    JOIN OPENJSON(@Vector2) v2 ON v1.[key] = v2.[key];

    IF @Mag1 * @Mag2 = 0 RETURN 0;
    RETURN @DotProduct / (@Mag1 * @Mag2);
END;
GO

-- ARAMA PROSEDÜRÜ (GELÝÞTÝRÝLMÝÞ)
CREATE OR ALTER PROCEDURE sp_RAG_AramaYap
    @AramaMetni NVARCHAR(MAX),
    @KullaniciID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO SearchLogs (UserID, SearchQuery)
    VALUES (@KullaniciID, @AramaMetni);

    SELECT 
        dc.ChunkID,
        c.CategoryName,
        d.Title,
        dc.ChunkText,
        ISNULL((
            SELECT STRING_AGG(t.TagName, ', ')
            FROM DocumentTags dt
            JOIN Tags t ON dt.TagID = t.TagID
            WHERE dt.DocumentID = d.DocumentID
        ), 'Etiket Yok') AS Etiketler
    FROM Documents d
    JOIN Categories c ON d.CategoryID = c.CategoryID
    JOIN DocumentChunks dc ON d.DocumentID = dc.DocumentID
    WHERE dc.ChunkText LIKE '%' + @AramaMetni + '%'
       OR d.Title LIKE '%' + @AramaMetni + '%';
END;
GO

-- SÝSTEM ÖZETÝ (DÜZELTÝLMÝÞ)
CREATE OR ALTER PROCEDURE sp_SistemOzeti
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        (SELECT COUNT(*) FROM Documents) AS ToplamBelge,
        (SELECT COUNT(*) FROM DocumentChunks) AS ToplamChunk,
        (
            SELECT TOP 1 c.CategoryName
            FROM Documents d
            JOIN Categories c ON d.CategoryID = c.CategoryID
            GROUP BY c.CategoryName
            ORDER BY COUNT(*) DESC
        ) AS EnYogunKategori,
        (SELECT COUNT(*) FROM SearchLogs 
         WHERE SearchDate > DATEADD(DAY, -1, GETDATE())) AS Son24SaatTrafik;
END;
GO