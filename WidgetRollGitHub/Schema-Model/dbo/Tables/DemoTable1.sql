CREATE TABLE [dbo].[DemoTable1]
(
[demoId] [bigint] NOT NULL,
[demoName] [nvarchar] (25) NULL
)
GO
ALTER TABLE [dbo].[DemoTable1] ADD CONSTRAINT [PK__DemoTabl__0B285DB0F0446D7E] PRIMARY KEY CLUSTERED  ([demoId])
GO
