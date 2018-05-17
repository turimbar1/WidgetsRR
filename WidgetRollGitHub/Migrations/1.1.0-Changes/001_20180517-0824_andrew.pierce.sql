-- <Migration ID="9059ddf1-aa23-4426-86a8-0df5c2ded726" />
GO

PRINT N'Dropping constraints from [dbo].[DemoTable1]'
GO
ALTER TABLE [dbo].[DemoTable1] DROP CONSTRAINT [PK__DemoTabl__0B285DB0F0446D7E]
GO
PRINT N'Dropping constraints from [dbo].[DemoTest2]'
GO
ALTER TABLE [dbo].[DemoTest2] DROP CONSTRAINT [PK__DemoTest__977B80751365E757]
GO
PRINT N'Dropping constraints from [dbo].[ObjectTest2]'
GO
ALTER TABLE [dbo].[ObjectTest2] DROP CONSTRAINT [PK__ObjectTe__9A6192912603B78D]
GO
PRINT N'Dropping constraints from [dbo].[TestTable1]'
GO
ALTER TABLE [dbo].[TestTable1] DROP CONSTRAINT [PK__TestTabl__A29AFFE0BAB6A9B1]
GO
PRINT N'Dropping [dbo].[TestTable1]'
GO
DROP TABLE [dbo].[TestTable1]
GO
PRINT N'Dropping [dbo].[ObjectTest2]'
GO
DROP TABLE [dbo].[ObjectTest2]
GO
PRINT N'Dropping [dbo].[DemoTest2]'
GO
DROP TABLE [dbo].[DemoTest2]
GO
PRINT N'Dropping [dbo].[DemoTable1]'
GO
DROP TABLE [dbo].[DemoTable1]
GO
