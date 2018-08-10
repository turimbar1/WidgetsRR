IF OBJECT_ID('[dbo].[USP_SSF_WidgetPrices]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_SSF_WidgetPrices];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_SSF_WidgetPrices] AS
BEGIN
select RecordID
     , WidgetID
     , Price
     , ValidFrom
     , ValidTo
     , Active
from dbo.WidgetPrices;
END

GO
