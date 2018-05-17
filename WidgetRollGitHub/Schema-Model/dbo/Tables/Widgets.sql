CREATE TABLE [dbo].[Widgets]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) NULL,
[SKU] [varchar] (20) NULL,
[SKUDescritp] [varchar] (50) NULL,
[Name] [varchar] (50) NULL,
[LastModified] [datetime2] NULL
)
GO
ALTER TABLE [dbo].[Widgets] ADD CONSTRAINT [PK_Widgets] PRIMARY KEY NONCLUSTERED  ([RecordID])
GO
