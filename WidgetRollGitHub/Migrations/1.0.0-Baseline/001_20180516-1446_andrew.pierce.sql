-- <Migration ID="5ec56eee-62ca-4612-b2c8-ee99384a727e" />
GO

PRINT N'Creating schemas'
GO
PRINT N'Creating [dbo].[Contacts]'
GO
CREATE TABLE [dbo].[Contacts]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NULL,
[PhoneWork] [nvarchar] (25) NULL,
[PhoneMobile] [nvarchar] (25) NULL,
[Address1] [nvarchar] (128) NULL,
[Address2] [nvarchar] (128) NULL,
[Address3] [nvarchar] (128) NULL,
[JoiningDate] [datetime] NULL CONSTRAINT [DF__Contacts__Joinin__29572725] DEFAULT (getdate()),
[Email] [nvarchar] (256) NULL,
[Description] [nvarchar] (62) NULL,
[PhoneHome] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK_Contacts] on [dbo].[Contacts]'
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED  ([ID])
GO
PRINT N'Creating [dbo].[USP_SSFContacts]'
GO
CREATE PROCEDURE [dbo].[USP_SSFContacts] AS
BEGIN
SELECT ID
     , Name
     , PhoneWork
     , PhoneMobile
     , Address1
     , Address2
     , JoiningDate
     , Email
     , Description
      FROM dbo.Contacts
END

GO
PRINT N'Creating [dbo].[PersonTest]'
GO
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
PRINT N'Creating primary key [PK__PersonTe__AA2FFBE59FB67109] on [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD CONSTRAINT [PK__PersonTe__AA2FFBE59FB67109] PRIMARY KEY CLUSTERED  ([PersonId])
GO
PRINT N'Creating [dbo].[USP_ssfPersonTest]'
GO
CREATE PROCEDURE [dbo].[USP_ssfPersonTest] AS
BEGIN
SELECT PersonId
     , PersonName FROM dbo.PersonTest
END

GO
PRINT N'Creating [dbo].[HelloWorld]'
GO
CREATE TABLE [dbo].[HelloWorld]
(
[HelloId] [bigint] NOT NULL,
[HelloDesc] [nvarchar] (25) NULL,
[HelloName] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__HelloWor__02FA286F20B6257F] on [dbo].[HelloWorld]'
GO
ALTER TABLE [dbo].[HelloWorld] ADD CONSTRAINT [PK__HelloWor__02FA286F20B6257F] PRIMARY KEY CLUSTERED  ([HelloId])
GO
PRINT N'Creating [dbo].[usp_ssfHelloWorld]'
GO
CREATE PROCEDURE [dbo].[usp_ssfHelloWorld] AS
BEGIN
SELECT HelloId
     , HelloDesc FROM dbo.HelloWorld
END

GO
PRINT N'Creating [dbo].[Widgets]'
GO
CREATE TABLE [dbo].[Widgets]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) NULL,
[SKU] [varchar] (20) NULL,
[SKUDescritp] [varchar] (50) NULL,
[Name] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Widgets] on [dbo].[Widgets]'
GO
ALTER TABLE [dbo].[Widgets] ADD CONSTRAINT [PK_Widgets] PRIMARY KEY NONCLUSTERED  ([RecordID])
GO
PRINT N'Creating [dbo].[WidgetPrices]'
GO
CREATE TABLE [dbo].[WidgetPrices]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[WidgetID] [int] NULL,
[Price] [money] NULL,
[ValidFrom] [datetime] NULL CONSTRAINT [DF_WidgetPrices_ValidFrom] DEFAULT (getdate()),
[ValidTo] [datetime] NULL,
[Active] [char] (1) NULL CONSTRAINT [DF_WidgetPrices_Active] DEFAULT ('N')
)
GO
PRINT N'Creating primary key [PK_WidgetPrices] on [dbo].[WidgetPrices]'
GO
ALTER TABLE [dbo].[WidgetPrices] ADD CONSTRAINT [PK_WidgetPrices] PRIMARY KEY NONCLUSTERED  ([RecordID])
GO
PRINT N'Creating index [IX_WidgetPrices_1] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices_1] ON [dbo].[WidgetPrices] ([ValidFrom])
GO
PRINT N'Creating index [IX_WidgetPrices_2] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices_2] ON [dbo].[WidgetPrices] ([ValidTo])
GO
PRINT N'Creating index [IX_WidgetPrices] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices] ON [dbo].[WidgetPrices] ([WidgetID])
GO
PRINT N'Creating [dbo].[WidgetPriceList]'
GO


-- Create indexed view

CREATE VIEW [dbo].[WidgetPriceList]
WITH SCHEMABINDING 
AS
SELECT     dbo.Widgets.RecordID, dbo.Widgets.Description AS Widget, dbo.WidgetPrices.Price
FROM       dbo.Widgets INNER JOIN
           dbo.WidgetPrices ON dbo.Widgets.RecordID = dbo.WidgetPrices.RecordID
		   WHERE Price <= '$2:00'
GO
PRINT N'Creating [dbo].[Account_FF]'
GO
CREATE TABLE [dbo].[Account_FF]
(
[﻿ID] [nvarchar] (50) NULL,
[ISDELETED] [bit] NULL,
[MASTERRECORDID] [nvarchar] (50) NULL,
[NAME] [nvarchar] (255) NULL,
[TYPE] [nvarchar] (50) NULL,
[RECORDTYPEID] [nvarchar] (50) NULL,
[PARENTID] [nvarchar] (50) NULL,
[BILLINGSTREET] [nvarchar] (255) NULL,
[BILLINGCITY] [nvarchar] (50) NULL,
[BILLINGSTATE] [nvarchar] (80) NULL,
[BILLINGPOSTALCODE] [nvarchar] (50) NULL,
[BILLINGCOUNTRY] [nvarchar] (80) NULL,
[BILLINGSTATECODE] [nvarchar] (50) NULL,
[BILLINGCOUNTRYCODE] [nvarchar] (50) NULL,
[BILLINGLATITUDE] [int] NULL,
[BILLINGLONGITUDE] [int] NULL,
[BILLINGGEOCODEACCURACY] [nvarchar] (50) NULL,
[BILLINGADDRESS] [nvarchar] (1000) NULL,
[PHONE] [nvarchar] (50) NULL,
[FAX] [nvarchar] (50) NULL,
[ACCOUNTNUMBER] [nvarchar] (50) NULL,
[WEBSITE] [nvarchar] (255) NULL,
[PHOTOURL] [nvarchar] (255) NULL,
[INDUSTRY] [nvarchar] (50) NULL,
[ANNUALREVENUE] [nvarchar] (255) NULL,
[NUMBEROFEMPLOYEES] [nvarchar] (255) NULL,
[OWNERSHIP] [nvarchar] (50) NULL,
[TICKERSYMBOL] [nvarchar] (255) NULL,
[DESCRIPTION] [nvarchar] (1300) NULL,
[CURRENCYISOCODE] [nvarchar] (50) NULL,
[OWNERID] [nvarchar] (50) NULL,
[CREATEDDATE] [datetime] NULL,
[CREATEDBYID] [nvarchar] (50) NULL,
[LASTMODIFIEDDATE] [datetime] NULL,
[LASTMODIFIEDBYID] [nvarchar] (50) NULL,
[SYSTEMMODSTAMP] [datetime] NULL,
[LASTACTIVITYDATE] [datetime] NULL,
[LASTVIEWEDDATE] [datetime] NULL,
[LASTREFERENCEDDATE] [datetime] NULL,
[ISPARTNER] [bit] NULL,
[ISCUSTOMERPORTAL] [bit] NULL,
[JIGSAW] [nvarchar] (50) NULL,
[JIGSAWCOMPANYID] [nvarchar] (50) NULL,
[ACCOUNTSOURCE] [nvarchar] (50) NULL,
[SICDESC] [nvarchar] (80) NULL,
[SUPPORT_PIN_CODE__C] [nvarchar] (50) NULL,
[SUPPORT_LEVEL_ESBU__C] [nvarchar] (255) NULL,
[ACCOUNT_NUMBER__C] [nvarchar] (50) NULL,
[ACCOUNT_PRIORITY__C] [nvarchar] (255) NULL,
[ACCOUNT_TYPE__C] [nvarchar] (255) NULL,
[APPROVED_AGENT__C] [nvarchar] (255) NULL,
[CCBU_SUPPORT_LEVEL__C] [nvarchar] (255) NULL,
[COMPANY_SIZE__C] [nvarchar] (255) NULL,
[CREDIT_LIMIT__C] [nvarchar] (100) NULL,
[CUSTOMER_PHASE_COMMERCIAL_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE_SETUP_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE_TRIAL_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE__C] [nvarchar] (255) NULL,
[CUSTOMER_REFERENCE_ID__C] [nvarchar] (50) NULL,
[DEFAULT_PRICE_BOOK__C] [nvarchar] (50) NULL,
[ENABLE_BANDWIDTH_THROTTLING__C] [bit] NULL,
[ENTERPRISE__C] [bit] NULL,
[ZUORA__ACTIVE__C] [nvarchar] (255) NULL,
[FINANCE_APPROVED__C] [bit] NULL,
[GLOBAL_STRATEGIC_ACCOUNT__C] [nvarchar] (50) NULL,
[INCO_TERMS__C] [nvarchar] (255) NULL,
[JDE_ADDRESS__C] [nvarchar] (255) NULL,
[LAST_CASE_THAT_CONSUMED_TOKEN__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_MOST_RECENT__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_ORIGINAL__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_SALES__C] [nvarchar] (255) NULL,
[LEGACY_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[MSA_ATTACHED__C] [bit] NULL,
[NUMBER_OF_TOKENS__C] [int] NULL,
[PRIMARY_SALES_OWNER__C] [nvarchar] (50) NULL,
[PRIMARY_SUPPORT_QUEUE__C] [nvarchar] (255) NULL,
[PRIORITY__C] [nvarchar] (255) NULL,
[REGION__C] [nvarchar] (255) NULL,
[SECTOR_ESBU__C] [nvarchar] (255) NULL,
[SIERRA_ID__C] [nvarchar] (255) NULL,
[JOINT_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[SUB_TYPE__C] [nvarchar] (255) NULL,
[SUPPORT_QUEUE_OVERRIDE__C] [nvarchar] (255) NULL,
[TARGET_ACCOUNT__C] [bit] NULL,
[USAGE_ALERT_EMAIL_DISTRIBUTION__C] [nvarchar] (1300) NULL,
[ACCESS_LEVEL__C] [nvarchar] (255) NULL,
[ACCOUNT_OWNER_FULL_NAME__C] [nvarchar] (255) NULL,
[BILLING_CONTACT__C] [nvarchar] (50) NULL,
[MCS_ID__C] [nvarchar] (50) NULL,
[SITE_LOCATION_ID__C] [nvarchar] (255) NULL,
[DUPLICATE_GROUP__C] [int] NULL,
[DUPLICATE_SCORE__C] [int] NULL,
[POTENTIAL_DUPLICATE__C] [nvarchar] (255) NULL,
[RECORD_CHECKED__C] [nvarchar] (255) NULL,
[ACCEL_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[ORACLE_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[EXTERNAL_ID__C] [nvarchar] (255) NULL,
[DATA_QUALITY_DESCRIPTION__C] [nvarchar] (1300) NULL,
[DATA_QUALITY_SCORE__C] [int] NULL,
[DUPCHECK__DC3DISABLEDUPLICATECHECK__C] [nvarchar] (255) NULL,
[DUPCHECK__DC3INDEX__C] [nvarchar] (255) NULL,
[ZUORA__CUSTOMERPRIORITY__C] [nvarchar] (255) NULL,
[ZUORA__NUMBEROFLOCATIONS__C] [int] NULL,
[ZUORA__SLAEXPIRATIONDATE__C] [datetime] NULL,
[ZUORA__SLASERIALNUMBER__C] [nvarchar] (255) NULL,
[ZUORA__SLA__C] [nvarchar] (255) NULL,
[ZUORA__UPSELLOPPORTUNITY__C] [nvarchar] (255) NULL,
[OLD_BILLING_STATE__C] [nvarchar] (255) NULL,
[OLD_BILLING_COUNTRY__C] [nvarchar] (255) NULL,
[BILLING_COUNTRY_NAME] [nvarchar] (255) NULL,
[BILLING_COUNTRY_CODE] [nvarchar] (255) NULL,
[BILLING_STATE_NAME] [nvarchar] (255) NULL,
[BILLING_STATE_CODE] [nvarchar] (255) NULL,
[RED_Gate_ID] [nvarchar] (255) NOT NULL
)
GO
PRINT N'Adding constraints to [dbo].[Account_FF]'
GO
ALTER TABLE [dbo].[Account_FF] ADD CONSTRAINT [UQ__Account___7E0C69C99E820764] UNIQUE NONCLUSTERED  ([RED_Gate_ID])
GO
PRINT N'Creating [dbo].[USP_ssf_Account]'
GO
CREATE PROCEDURE [dbo].[USP_ssf_Account] AS
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
     , USAGE_ALERT_EMAIL_DISTRIBUTION__C
     , ACCESS_LEVEL__C
     , ACCOUNT_OWNER_FULL_NAME__C
     , BILLING_CONTACT__C
     , MCS_ID__C
     , DUPLICATE_GROUP__C
     , DUPLICATE_SCORE__C
     , POTENTIAL_DUPLICATE__C
     , RECORD_CHECKED__C
     , ACCEL_EXTERNAL_ID__C
     , ORACLE_EXTERNAL_ID__C
     , EXTERNAL_ID__C
     , DATA_QUALITY_DESCRIPTION__C
     , DATA_QUALITY_SCORE__C
     , DUPCHECK__DC3DISABLEDUPLICATECHECK__C
     , DUPCHECK__DC3INDEX__C
     , ZUORA__CUSTOMERPRIORITY__C
     , ZUORA__NUMBEROFLOCATIONS__C
     , ZUORA__SLAEXPIRATIONDATE__C
     , ZUORA__SLASERIALNUMBER__C
     , ZUORA__SLA__C
     , ZUORA__UPSELLOPPORTUNITY__C
     , OLD_BILLING_STATE__C
     , OLD_BILLING_COUNTRY__C
     , BILLING_COUNTRY_NAME
     , BILLING_COUNTRY_CODE
     , BILLING_STATE_NAME
     , BILLING_STATE_CODE
     , RED_Gate_ID FROM dbo.Account_FF
END

GO
PRINT N'Creating [dbo].[USP_ssfAccount_FF]'
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
PRINT N'Creating [dbo].[WidgetPurchases]'
GO
CREATE TABLE [dbo].[WidgetPurchases]
(
[PurchaseID] [int] NOT NULL IDENTITY(1, 1),
[WidgetPriceID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__WidgetPur__Quant__267ABA7A] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[Date] [datetime] NOT NULL CONSTRAINT [DF__WidgetPurc__Date__276EDEB3] DEFAULT (getdate()),
[Description] [nvarchar] (50) NULL
)
GO
PRINT N'Creating index [IX_WidgetPurchases] on [dbo].[WidgetPurchases]'
GO
CREATE UNIQUE CLUSTERED INDEX [IX_WidgetPurchases] ON [dbo].[WidgetPurchases] ([PurchaseID])
GO
PRINT N'Creating [dbo].[usp_SSFPurchases]'
GO
CREATE PROCEDURE [dbo].[usp_SSFPurchases] AS
BEGIN
SELECT PurchaseID
     , Quantity
     , InvoiceNumber
     
     FROM dbo.WidgetPurchases
END

GO
PRINT N'Creating [dbo].[project]'
GO
CREATE TABLE [dbo].[project]
(
[projectID] [bigint] NOT NULL,
[projectDescription] [nvarchar] (50) NULL,
[projectName] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__project__11F14D8522BBD6BF] on [dbo].[project]'
GO
ALTER TABLE [dbo].[project] ADD CONSTRAINT [PK__project__11F14D8522BBD6BF] PRIMARY KEY CLUSTERED  ([projectID])
GO
PRINT N'Creating [dbo].[USP_SSFproject]'
GO
CREATE PROCEDURE [dbo].[USP_SSFproject] AS
BEGIN
SELECT projectID
     , projectDescription
     , projectName FROM dbo.project
END

GO
PRINT N'Creating [dbo].[Account]'
GO
CREATE TABLE [dbo].[Account]
(
[Id] [nvarchar] (18) NULL,
[Name] [nvarchar] (121) NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) NULL,
[SystemModstamp] [datetime] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[Description] [nvarchar] (1000) NULL,
[IsDeleted] [bit] NULL,
[MasterRecordId] [nvarchar] (18) NULL,
[Type] [nvarchar] (40) NULL,
[RecordTypeId] [nvarchar] (18) NULL,
[ParentId] [nvarchar] (18) NULL,
[BillingStreet] [nvarchar] (255) NULL,
[BillingCity] [nvarchar] (40) NULL,
[BillingState] [nvarchar] (80) NULL,
[BillingPostalCode] [nvarchar] (20) NULL,
[BillingCountry] [nvarchar] (80) NULL,
[BillingStateCode] [nvarchar] (10) NULL,
[BillingCountryCode] [nvarchar] (10) NULL,
[BillingLatitude] [float] NULL,
[BillingLongitude] [float] NULL,
[BillingGeocodeAccuracy] [nvarchar] (40) NULL,
[BillingAddress] [nvarchar] (max) NULL,
[ShippingStreet] [nvarchar] (255) NULL,
[ShippingCity] [nvarchar] (40) NULL,
[ShippingState] [nvarchar] (80) NULL,
[ShippingPostalCode] [nvarchar] (20) NULL,
[ShippingCountry] [nvarchar] (80) NULL,
[ShippingStateCode] [nvarchar] (10) NULL,
[ShippingCountryCode] [nvarchar] (10) NULL,
[ShippingLatitude] [float] NULL,
[ShippingLongitude] [float] NULL,
[ShippingGeocodeAccuracy] [nvarchar] (40) NULL,
[ShippingAddress] [nvarchar] (max) NULL,
[Phone] [nvarchar] (40) NULL,
[Website] [nvarchar] (255) NULL,
[PhotoUrl] [nvarchar] (255) NULL,
[Industry] [nvarchar] (40) NULL,
[NumberOfEmployees] [int] NULL,
[CurrencyIsoCode] [nvarchar] (3) NULL,
[OwnerId] [nvarchar] (18) NULL,
[LastActivityDate] [date] NULL,
[IsPartner] [bit] NULL,
[IsCustomerPortal] [bit] NULL,
[Jigsaw] [nvarchar] (20) NULL,
[JigsawCompanyId] [nvarchar] (20) NULL,
[AccountSource] [nvarchar] (40) NULL,
[SicDesc] [nvarchar] (80) NULL,
[Support_level_ESBU__c] [nvarchar] (255) NULL,
[Support_Pin_Code__c] [nvarchar] (10) NULL,
[Accel_External_Id__c] [nvarchar] (100) NULL,
[Access_Level__c] [nvarchar] (255) NULL,
[Account_Number__c] [nvarchar] (30) NULL,
[Account_Owner_Full_Name__c] [nvarchar] (255) NULL,
[Approved_Agent__c] [bit] NULL,
[Billing_Contact__c] [nvarchar] (18) NULL,
[CCBU_Support_Level__c] [nvarchar] (255) NULL,
[CSM_Units__c] [nvarchar] (100) NULL,
[Company_Size__c] [nvarchar] (255) NULL,
[Credit_Limit__c] [nvarchar] (100) NULL,
[Customer_Phase_Commercial_Date__c] [date] NULL,
[Customer_Phase_Setup_Date__c] [date] NULL,
[Customer_Phase_Trial_Date__c] [date] NULL,
[Customer_Phase__c] [nvarchar] (255) NULL,
[Customer_Reference_ID__c] [nvarchar] (50) NULL,
[Data_Quality_Description__c] [nvarchar] (1300) NULL,
[Data_Quality_Score__c] [float] NULL,
[Default_Price_Book__c] [nvarchar] (18) NULL,
[Duplicate_Group__c] [float] NULL,
[Duplicate_Score__c] [float] NULL,
[Enable_Bandwidth_Throttling__c] [bit] NULL,
[Enterprise__c] [bit] NULL,
[External_ID__c] [nvarchar] (100) NULL,
[Finance_Approved__c] [bit] NULL,
[Global_Strategic_Account__c] [bit] NULL,
[Inco_Terms__c] [nvarchar] (100) NULL,
[JDE_Address__c] [nvarchar] (160) NULL,
[Joint_External_Id__c] [nvarchar] (100) NULL,
[Last_Case_That_Consumed_Token__c] [nvarchar] (100) NULL,
[Lead_Source_Most_Recent__c] [nvarchar] (100) NULL,
[Lead_Source_Original__c] [nvarchar] (100) NULL,
[Lead_Source_Sales__c] [nvarchar] (255) NULL,
[Legacy_External_ID__c] [nvarchar] (100) NULL,
[MCS_ID__c] [nvarchar] (18) NULL,
[MSA_Attached__c] [bit] NULL,
[Number_Of_Tokens__c] [float] NULL,
[Old_Billing_Country__c] [nvarchar] (80) NULL,
[Old_Billing_State__c] [nvarchar] (80) NULL,
[Oracle_External_Id__c] [nvarchar] (100) NULL,
[Primary_Sales_Owner__c] [nvarchar] (18) NULL,
[Primary_Support_Queue__c] [nvarchar] (255) NULL,
[Priority__c] [nvarchar] (255) NULL,
[Region__c] [nvarchar] (255) NULL,
[Sector_ESBU__c] [nvarchar] (255) NULL,
[Sierra_ID__c] [nvarchar] (100) NULL,
[Site_Location_ID__c] [nvarchar] (100) NULL,
[Sub_Type__c] [nvarchar] (255) NULL,
[Support_Queue_Override__c] [nvarchar] (255) NULL,
[Target_Account__c] [bit] NULL,
[Tax_ID__c] [nvarchar] (25) NULL,
[Usage_Alert_Email_Distribution__c] [nvarchar] (1023) NULL,
[Zuora__Active__c] [nvarchar] (255) NULL,
[Zuora__CustomerPriority__c] [nvarchar] (255) NULL,
[Zuora__NumberofLocations__c] [float] NULL,
[Zuora__SLAExpirationDate__c] [date] NULL,
[Zuora__SLASerialNumber__c] [nvarchar] (10) NULL,
[Zuora__SLA__c] [nvarchar] (255) NULL,
[Zuora__UpsellOpportunity__c] [nvarchar] (255) NULL,
[RED_Gate_ID] [nvarchar] (255) NULL
)
GO
PRINT N'Adding constraints to [dbo].[Account]'
GO
ALTER TABLE [dbo].[Account] ADD CONSTRAINT [UQ__Account__7E0C69C9522A6707] UNIQUE NONCLUSTERED  ([RED_Gate_ID])
GO
PRINT N'Creating [dbo].[Customer]'
GO
CREATE TABLE [dbo].[Customer]
(
[CustId] [bigint] NOT NULL,
[CustFirstname] [nvarchar] (25) NULL,
[CustLastname] [nvarchar] (25) NULL,
[CustDescription] [nchar] (10) NULL
)
GO
PRINT N'Creating primary key [PK__Customer__049E3AA9B86CDE0B] on [dbo].[Customer]'
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK__Customer__049E3AA9B86CDE0B] PRIMARY KEY CLUSTERED  ([CustId])
GO
PRINT N'Creating [dbo].[DemoTable1]'
GO
CREATE TABLE [dbo].[DemoTable1]
(
[demoId] [bigint] NOT NULL,
[demoName] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__DemoTabl__0B285DB0F0446D7E] on [dbo].[DemoTable1]'
GO
ALTER TABLE [dbo].[DemoTable1] ADD CONSTRAINT [PK__DemoTabl__0B285DB0F0446D7E] PRIMARY KEY CLUSTERED  ([demoId])
GO
PRINT N'Creating [dbo].[DemoTest2]'
GO
CREATE TABLE [dbo].[DemoTest2]
(
[DemoId] [bigint] NOT NULL,
[DemoDescrip] [nvarchar] (50) NULL,
[DemoDate] [datetime2] NULL
)
GO
PRINT N'Creating primary key [PK__DemoTest__977B80751365E757] on [dbo].[DemoTest2]'
GO
ALTER TABLE [dbo].[DemoTest2] ADD CONSTRAINT [PK__DemoTest__977B80751365E757] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[HelloDemo]'
GO
CREATE TABLE [dbo].[HelloDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__HelloDem__977B8075C276CD8C] on [dbo].[HelloDemo]'
GO
ALTER TABLE [dbo].[HelloDemo] ADD CONSTRAINT [PK__HelloDem__977B8075C276CD8C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[NewTestObject]'
GO
CREATE TABLE [dbo].[NewTestObject]
(
[objectId] [bigint] NOT NULL,
[objectDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__NewTestO__5243E26A30FCE0CA] on [dbo].[NewTestObject]'
GO
ALTER TABLE [dbo].[NewTestObject] ADD CONSTRAINT [PK__NewTestO__5243E26A30FCE0CA] PRIMARY KEY CLUSTERED  ([objectId])
GO
PRINT N'Creating [dbo].[ObjectDemo]'
GO
CREATE TABLE [dbo].[ObjectDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL,
[DemoLName] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectDe__977B8075D47C7A7C] on [dbo].[ObjectDemo]'
GO
ALTER TABLE [dbo].[ObjectDemo] ADD CONSTRAINT [PK__ObjectDe__977B8075D47C7A7C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[ObjectTest2]'
GO
CREATE TABLE [dbo].[ObjectTest2]
(
[ObjectId] [bigint] NOT NULL,
[ObjectDescription] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectTe__9A6192912603B78D] on [dbo].[ObjectTest2]'
GO
ALTER TABLE [dbo].[ObjectTest2] ADD CONSTRAINT [PK__ObjectTe__9A6192912603B78D] PRIMARY KEY CLUSTERED  ([ObjectId])
GO
PRINT N'Creating [dbo].[ObjectTest]'
GO
CREATE TABLE [dbo].[ObjectTest]
(
[ObjectID] [bigint] NOT NULL,
[ObjectName] [nvarchar] (25) NULL,
[ObjectDesc] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectTe__9A6192B18CF93115] on [dbo].[ObjectTest]'
GO
ALTER TABLE [dbo].[ObjectTest] ADD CONSTRAINT [PK__ObjectTe__9A6192B18CF93115] PRIMARY KEY CLUSTERED  ([ObjectID])
GO
PRINT N'Creating [dbo].[TestTable1]'
GO
CREATE TABLE [dbo].[TestTable1]
(
[testid] [bigint] NOT NULL,
[testName] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__TestTabl__A29AFFE0BAB6A9B1] on [dbo].[TestTable1]'
GO
ALTER TABLE [dbo].[TestTable1] ADD CONSTRAINT [PK__TestTabl__A29AFFE0BAB6A9B1] PRIMARY KEY CLUSTERED  ([testid])
GO
PRINT N'Creating [dbo].[TestTable]'
GO
CREATE TABLE [dbo].[TestTable]
(
[TestId] [bigint] NOT NULL,
[TestName] [nvarchar] (25) NULL,
[TestDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__TestTabl__8CC33160C9CCD1F4] on [dbo].[TestTable]'
GO
ALTER TABLE [dbo].[TestTable] ADD CONSTRAINT [PK__TestTabl__8CC33160C9CCD1F4] PRIMARY KEY CLUSTERED  ([TestId])
GO
PRINT N'Creating [dbo].[WidgetDescriptions]'
GO
CREATE TABLE [dbo].[WidgetDescriptions]
(
[WidgetID] [int] NOT NULL,
[ShortDescription] [nvarchar] (2000) NULL,
[Description] [text] NULL,
[Picture] [image] NULL,
[Description2] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_WidgetDescriptions] on [dbo].[WidgetDescriptions]'
GO
ALTER TABLE [dbo].[WidgetDescriptions] ADD CONSTRAINT [PK_WidgetDescriptions] PRIMARY KEY CLUSTERED  ([WidgetID])
GO
PRINT N'Creating [dbo].[WidgetReferences]'
GO
CREATE TABLE [dbo].[WidgetReferences]
(
[WidgetID] [int] NOT NULL,
[Reference] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_WidgetReferences] on [dbo].[WidgetReferences]'
GO
ALTER TABLE [dbo].[WidgetReferences] ADD CONSTRAINT [PK_WidgetReferences] PRIMARY KEY NONCLUSTERED  ([WidgetID])
GO
PRINT N'Creating [dbo].[customersDemo]'
GO
CREATE TABLE [dbo].[customersDemo]
(
[CustID] [bigint] NOT NULL,
[CustDesc] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__customer__049E3A89295CB0A4] on [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD CONSTRAINT [PK__customer__049E3A89295CB0A4] PRIMARY KEY CLUSTERED  ([CustID])
GO
PRINT N'Creating [dbo].[demotable]'
GO
CREATE TABLE [dbo].[demotable]
(
[DemoId] [bigint] NOT NULL,
[DemoDescription] [nvarchar] (50) NULL,
[FirstName] [nvarchar] (30) NULL,
[LastName] [nvarchar] (50) NULL,
[DemoDate] [datetime] NULL,
[DemoAddress] [nvarchar] (50) NULL,
[ModifiedDate] [date] NULL
)
GO
PRINT N'Creating primary key [PK__demotabl__977B80755E2EBDD1] on [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD CONSTRAINT [PK__demotabl__977B80755E2EBDD1] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating extended properties'
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'IsSQLCloneDatabase', @xp, NULL, NULL, NULL, NULL, NULL, NULL
GO
