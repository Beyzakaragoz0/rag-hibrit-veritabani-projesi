-- 20) WINDOW FUNCTION:
-- Amaç: Her kategori içindeki belgeleri yüklenme tarihine göre sýralamak
SELECT 
    d.DocumentID,
    d.Title,
    d.CategoryID,
    ROW_NUMBER() OVER (PARTITION BY d.CategoryID ORDER BY d.UploadDate DESC) AS SiraNo
FROM Documents d;