IF OBJECT_ID('[dbo].[USP_ssfAccount_FF]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_ssfAccount_FF];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_ssfAccount_FF]
AS
BEGIN
    SELECT [﻿ID]
         , ISDELETED
         , MASTERRECORDID
         , NAME
         , TYPE
         , RECORDTYPEID
         , PARENTID
         , BILLINGSTREET
         , BILLINGCITY
         , BILLINGSTATE
         , BILLINGPOSTALCODE
         , BILLINGCOUNTRY
         , BILLINGSTATECODE
         , BILLINGCOUNTRYCODE
         , BILLINGLATITUDE
         , BILLINGLONGITUDE
         , BILLINGGEOCODEACCURACY
         , BILLINGADDRESS
         , PHONE
         , FAX
         , ACCOUNTNUMBER
         , WEBSITE
         , PHOTOURL
         , INDUSTRY
         , ANNUALREVENUE
         , NUMBEROFEMPLOYEES
         , OWNERSHIP
         , TICKERSYMBOL
         , DESCRIPTION
        
    FROM dbo.Account_FF;
END;

GO
