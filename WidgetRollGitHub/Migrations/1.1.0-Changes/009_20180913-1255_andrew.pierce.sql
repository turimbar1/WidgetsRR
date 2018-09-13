-- <Migration ID="9d279e67-013a-40c9-b0cf-31162763daae" />
GO

PRINT N'Altering [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD
[LastChangedBy] [datetime] NULL
GO
