CREATE TABLE [dbo].[customersDemo]
(
[CustID] [bigint] NOT NULL,
[CustDesc] [nvarchar] (25) NULL
)
GO
ALTER TABLE [dbo].[customersDemo] ADD CONSTRAINT [PK__customer__049E3A89295CB0A4] PRIMARY KEY CLUSTERED  ([CustID])
GO
