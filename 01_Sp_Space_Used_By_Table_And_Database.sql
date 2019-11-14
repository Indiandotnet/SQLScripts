--********************************************************
--** SCRIPT FOR  Determine the space used in database    *
--** Name : Rajat  Jaiswal                               *
--** Email: Rajatjai@gmail.com                           *
--********************************************************

--********************************************
-- 1. Determine entire database space used 
--********************************************
GO
SP_SPACEUSED
GO
--********************************************************** *
--** 2. Determine space used by specific table in a database *
--**            SP_SPACEUSED TABLENAME                       *
--************************************************************
SP_SPACEUSED [Person.Person]
GO
--************************************************************
--** 3. Determine space used by each table in a database     *
--**           SP_MSFOREACHTABLE 'SP_SPACEUSED [?]'          *
--************************************************************
GO
SP_MSFOREACHTABLE 'SP_SPACEUSED [?]'
GO
--************************************************************
--** 4. Show updated space in table                          *
--**           SP_SPACEUSED @updateUsage =N'True'            *
--************************************************************

GO
SP_SPACEUSED @updateUsage =N'True'
GO

