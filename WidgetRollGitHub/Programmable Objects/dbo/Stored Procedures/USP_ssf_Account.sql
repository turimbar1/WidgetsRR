IF OBJECT_ID('[dbo].[USP_ssf_Account]') IS NOT NULL
	DROP PROCEDURE [dbo].[USP_ssf_Account];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[USP_SSF_Account] AS
BEGIN
SELECT Id
     , Name
     , CreatedDate
     , CreatedById
     , LastModifiedDate
     , LastModifiedById
     , SystemModstamp
     , LastViewedDate
     , LastReferencedDate
     , Description
     , IsDeleted
     , MasterRecordId
     , Type
     , RecordTypeId
     , ParentId
     , BillingStreet
     , BillingCity
     , BillingState
     , BillingPostalCode
     , BillingCountry
     , BillingStateCode
     , BillingCountryCode
     , BillingLatitude
     , BillingLongitude
     , BillingGeocodeAccuracy
     , BillingAddress
     , ShippingStreet
     , ShippingCity
     , ShippingState
     , ShippingPostalCode
     , ShippingCountry
     , ShippingStateCode
     , ShippingCountryCode
     , ShippingLatitude
     , ShippingLongitude
     , ShippingGeocodeAccuracy
     , ShippingAddress
     , Phone
     , Website
     , PhotoUrl
     , Industry
     , NumberOfEmployees
     , CurrencyIsoCode
     , OwnerId
     , LastActivityDate
     , IsPartner
     , IsCustomerPortal
     , Jigsaw
     , JigsawCompanyId
     , AccountSource
     , SicDesc
     , Support_level_ESBU__c
     , Support_Pin_Code__c
     , Accel_External_Id__c
     , Access_Level__c
     , Account_Number__c
     , Account_Owner_Full_Name__c
     , Approved_Agent__c
     , Billing_Contact__c
     , CCBU_Support_Level__c
     , CSM_Units__c
FROM dbo.Account;
END

GO
