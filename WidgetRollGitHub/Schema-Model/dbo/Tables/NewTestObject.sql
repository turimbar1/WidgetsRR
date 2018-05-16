CREATE TABLE [dbo].[NewTestObject]
(
[objectId] [bigint] NOT NULL,
[objectDescription] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[NewTestObject] ADD CONSTRAINT [PK__NewTestO__5243E26A30FCE0CA] PRIMARY KEY CLUSTERED  ([objectId])
GO
