CREATE TABLE [dbo].[Lookup]
(
	[LookupId] INT NOT NULL PRIMARY KEY, 
    [LookupType] VARCHAR(50) NOT NULL, 
    [LookupCode] VARCHAR(50) NOT NULL, 
    [LookupDescription] VARCHAR(500) NOT NULL
)
