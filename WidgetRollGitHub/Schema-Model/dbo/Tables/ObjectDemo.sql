CREATE TABLE [dbo].[ObjectDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL,
[DemoLName] [nvarchar] (25) NULL
)
GO
ALTER TABLE [dbo].[ObjectDemo] ADD CONSTRAINT [PK__ObjectDe__977B8075D47C7A7C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
