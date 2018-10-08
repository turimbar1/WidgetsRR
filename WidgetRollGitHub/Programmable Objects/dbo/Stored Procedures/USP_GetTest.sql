﻿IF OBJECT_ID('[dbo].[USP_GetTest]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_GetTest];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_GetTest] AS
BEGIN
SELECT TestId, TestName, TestDescription FROM dbo.TestTable;
END

GO
