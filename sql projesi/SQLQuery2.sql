USE RagHybridDB;
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Role NVARCHAR(20) NOT NULL DEFAULT 'User',
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT CHK_Users_Role CHECK (Role IN ('User', 'Admin'))
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500) NULL
);

CREATE TABLE Tags (
    TagID INT IDENTITY(1,1) PRIMARY KEY,
    TagName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Documents (
    DocumentID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    CategoryID INT NOT NULL,
    UserID INT NOT NULL,
    UploadDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Documents_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    CONSTRAINT FK_Documents_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE DocumentChunks (
    ChunkID INT IDENTITY(1,1) PRIMARY KEY,
    DocumentID INT NOT NULL,
    ChunkText NVARCHAR(MAX) NOT NULL,
    VectorData NVARCHAR(MAX) NULL,
    PageNumber INT NULL,
    CONSTRAINT FK_DocumentChunks_Documents FOREIGN KEY (DocumentID) REFERENCES Documents(DocumentID) ON DELETE CASCADE
);

CREATE TABLE DocumentTags (
    DocumentID INT NOT NULL,
    TagID INT NOT NULL,
    PRIMARY KEY (DocumentID, TagID),
    CONSTRAINT FK_DocumentTags_Documents FOREIGN KEY (DocumentID) REFERENCES Documents(DocumentID),
    CONSTRAINT FK_DocumentTags_Tags FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);

CREATE TABLE SearchLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    SearchQuery NVARCHAR(500) NOT NULL,
    SearchDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_SearchLogs_Users FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO