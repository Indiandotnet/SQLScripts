--***************************************************************
--** Description: Get the list All the Stored Procedure         *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 06                                                    *
--***************************************************************

--********************************************
-- 1. GET LIST OF using Sys.Procedures 
--********************************************
GO
SELECT name,type_Desc,create_Date,Modify_Date
FROM sys.procedures WHERE type='p'
AND type_desc ='SQL_STORED_PROCEDURE'
GO

GO

--********************************************
-- 1. GET LIST OF using Information Schema
--********************************************

SELECT ROUTINE_NAME,ROUTINE_TYPE,ROUTINE_DEFINITION,CREATED,LAST_ALTERED
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE ='PROCEDURE'

