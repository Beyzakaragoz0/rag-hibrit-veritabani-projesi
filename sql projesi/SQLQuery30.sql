-- 18) CASE:
-- Amaç: Kullanýcý rollerini açýklamalý þekilde göstermek
SELECT 
    UserID,
    Username,
    CASE 
        WHEN Role = 'Admin' THEN 'Yönetici'
        ELSE 'Standart Kullanýcý'
    END AS RolAciklama
FROM Users;