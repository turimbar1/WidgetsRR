IF OBJECT_ID('[dbo].[USP_ssfPersonTest]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_ssfPersonTest];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_ssfPersonTest] AS
BEGIN
SELECT PersonId
     , PersonName FROM dbo.PersonTest
END

GO
