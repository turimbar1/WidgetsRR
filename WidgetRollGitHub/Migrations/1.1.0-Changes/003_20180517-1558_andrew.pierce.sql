-- <Migration ID="955fda6a-1d66-41b6-a113-a6db951adaca" />
GO

PRINT N'Altering [dbo].[Widgets]'
GO
ALTER TABLE [dbo].[Widgets] ADD
[LastModified] [datetime2] NULL
GO
