﻿IF OBJECT_ID('[dbo].[USP_SSF_CustDemo]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_SSF_CustDemo];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_SSF_CustDemo] AS
BEGIN
SELECT
    CustID,
    CustDesc
FROM
    dbo.customersDemo;
END

GO
