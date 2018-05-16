CREATE TABLE [dbo].[PersonTest]
(
[PersonId] [bigint] NOT NULL,
[PersonName] [nvarchar] (40) NULL,
[PersonDOB] [date] NULL,
[PersonAddress] [nvarchar] (50) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[PersonState] [nchar] (2) NULL,
[CountryCode] [nchar] (2) NULL
)
GO
ALTER TABLE [dbo].[PersonTest] ADD CONSTRAINT [PK__PersonTe__AA2FFBE59FB67109] PRIMARY KEY CLUSTERED  ([PersonId])
GO
