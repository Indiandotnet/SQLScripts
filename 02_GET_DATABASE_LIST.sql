--***************************************************************
--** Description: Get the list of database on your SQL Instance *
--** Name : Rajat  Jaiswal                                      *
--** Email: Rajatjai@gmail.com                                  *
--** TIP: 02                                                    *
--***************************************************************

--********************************************
-- 1. GET LIST OF Databases on the server
--********************************************

SELECT * FROM Sys.databases  

--********************************************************************************
-- 2. GET list OF  only User defined Databases                                   *
--********************************************************************************
SELECT * FROM sys.databases WHERE NAME NOT IN ('master', 'tempdb', 'model', 'msdb'); 

