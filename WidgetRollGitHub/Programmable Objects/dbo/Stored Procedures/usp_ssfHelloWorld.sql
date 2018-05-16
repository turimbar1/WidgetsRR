IF OBJECT_ID('[dbo].[usp_ssfHelloWorld]') IS NOT NULL
	DROP PROCEDURE [dbo].[usp_ssfHelloWorld];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_ssfHelloWorld] AS
BEGIN
SELECT HelloId
     , HelloDesc FROM dbo.HelloWorld
END

GO
