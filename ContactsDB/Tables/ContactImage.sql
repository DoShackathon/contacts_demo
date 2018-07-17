CREATE TABLE [dbo].[ContactImage]
(
	[ImageId] INT NOT NULL PRIMARY KEY, 
    [Image] VARBINARY(MAX) NOT NULL, 
    [Extension] VARCHAR(10) NULL, 
    [ImageName] VARCHAR(50) NULL, 
     
)
