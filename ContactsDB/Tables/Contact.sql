CREATE TABLE [dbo].[Contact]
(
	[ContactId] INT NOT NULL PRIMARY KEY, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [MiddleName] VARCHAR(50) NULL, 
    [EmailAddress] VARCHAR(50) NULL, 
    [MobilePhone] VARCHAR(50) NULL, 
    [WorkPhone] VARCHAR(50) NULL, 
    [HomePhone] VARCHAR(50) NULL, 
    [AddressLine1] VARCHAR(50) NULL, 
    [AddressLine2] VARCHAR(50) NULL, 
    [City] VARCHAR(50) NULL, 
    [StateCode] CHAR(2) NULL, 
    [CountryCode] VARCHAR(3) NULL, 
    [ZipCode] VARCHAR(50) NULL, 
    [Latitude] VARCHAR(50) NULL, 
    [Longitude] VARCHAR(50) NULL, 
    [ImageId] INT NULL, 
    CONSTRAINT [FK_Contact_ToTable] FOREIGN KEY ([ImageId]) REFERENCES [ContactImage]([ImageId])
)
