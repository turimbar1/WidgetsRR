CREATE TABLE [dbo].[HelloDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL,
[DemoLName] [nvarchar] (25) NULL
)
GO
ALTER TABLE [dbo].[HelloDemo] ADD CONSTRAINT [PK__HelloDem__977B8075C276CD8C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
