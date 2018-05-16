CREATE TABLE [dbo].[ObjectTest2]
(
[ObjectId] [bigint] NOT NULL,
[ObjectDescription] [nvarchar] (25) NULL
)
GO
ALTER TABLE [dbo].[ObjectTest2] ADD CONSTRAINT [PK__ObjectTe__9A6192912603B78D] PRIMARY KEY CLUSTERED  ([ObjectId])
GO
