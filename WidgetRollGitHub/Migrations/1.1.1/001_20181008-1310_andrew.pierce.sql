-- <Migration ID="fd038270-1f76-451c-8c9c-ea3f35742d62" />
GO

PRINT N'Altering [dbo].[ObjectDemo]'
GO
ALTER TABLE [dbo].[ObjectDemo] ADD
[Description] [nvarchar] (250) NULL
GO
