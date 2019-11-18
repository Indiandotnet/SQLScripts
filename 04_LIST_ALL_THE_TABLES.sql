--***************************************************************
--** Description: Get List of All the tables                    *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 04                                                    *
--***************************************************************

--********************************************
-- 1. GET List of all the Tables in a database 
--********************************************
Go
SELECT * FROM sys.objects WHERE type='U' AND Name <> 'sysdiagrams'
GO

--********************************************************************************
-- 2.  use Sys.Tables                                                            *
--********************************************************************************
GO
SELECT * FROM sys.tables

--********************************************************************************
-- 3. Information Schema                                                         *
--********************************************************************************
Go
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME <>'sysdiagrams'
Go
