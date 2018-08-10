-- <Migration ID="69f156d7-e794-452f-b66f-c5f5be262183" />
GO

PRINT N'Altering [dbo].[ObjectTest]'
GO
ALTER TABLE [dbo].[ObjectTest] ADD
[ObjectOwner] [nvarchar] (15) NULL
GO
