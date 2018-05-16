CREATE TABLE [dbo].[Customer]
(
[CustId] [bigint] NOT NULL,
[CustFirstname] [nvarchar] (25) NULL,
[CustLastname] [nvarchar] (25) NULL,
[CustDescription] [nchar] (10) NULL
)
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK__Customer__049E3AA9B86CDE0B] PRIMARY KEY CLUSTERED  ([CustId])
GO
