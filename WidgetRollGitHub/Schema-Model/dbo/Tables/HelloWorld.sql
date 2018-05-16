CREATE TABLE [dbo].[HelloWorld]
(
[HelloId] [bigint] NOT NULL,
[HelloDesc] [nvarchar] (25) NULL,
[HelloName] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[HelloWorld] ADD CONSTRAINT [PK__HelloWor__02FA286F20B6257F] PRIMARY KEY CLUSTERED  ([HelloId])
GO
