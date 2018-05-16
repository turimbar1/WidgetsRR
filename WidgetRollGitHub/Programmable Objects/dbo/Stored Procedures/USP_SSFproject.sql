IF OBJECT_ID('[dbo].[USP_SSFproject]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_SSFproject];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_SSFproject] AS
BEGIN
SELECT projectID
     , projectDescription
     , projectName FROM dbo.project
END

GO
