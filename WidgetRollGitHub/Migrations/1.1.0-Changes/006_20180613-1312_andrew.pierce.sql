-- <Migration ID="938fce05-7198-4745-a9cf-1825f3e95338" />
GO

PRINT N'Altering [dbo].[project]'
GO
ALTER TABLE [dbo].[project] ADD
[projectOwner] [nvarchar] (50) NULL
GO
